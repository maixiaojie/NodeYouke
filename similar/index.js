var mysql = require('mysql');
var squel = require('squel');
var similar = require('./similar').similar;
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : '140.143.163.52',
  port            : '3306',
  user            : 'root',
  password        : 'wenyujie@123',
  database        : 'mdblog'
});
/**
 * 建立连接池连接，并且查询出需要的数据
 * @param  {[type]} (err, connection)   [description]
 * @return {[type]}       [description]
 */
pool.getConnection((err, connection) => {
	if(err) throw err;
	connection.query('SELECT b.id, b.title, b.tags, ba.keyword from blog as b LEFT JOIN blog_analysis as ba on ba.blog_id = b.id', (err, res, fields) => {
		if(err) throw err;
		querySimilar(res, connection);
		
	})
});
/**
 * 数据处理
 * @param  {[type]} arr        [description]
 * @param  {[type]} connection [description]
 * @return {[type]}            [description]
 */
function handleData(oldData = [], arr = [], connection) {
	var len = arr.length;
	var jsonData = [];
	for(var i=0; i<len-1; i++) {
		for(var j=i+1; j<len; j++) {
			var ids = arr[i].id + '||' + arr[j].id;
			if(!oldData.includes(ids)) {				
				var tagsA = [], tagsB = [];
				if(arr[i].tags) {
					tagsA = tagsA.concat(arr[i].tags.split(','));
				}
				if(arr[j].tags) {
					tagsB = tagsB.concat(arr[j].tags.split(','));
				}
				if(arr[i].keyword) {
					try {
						var tags = JSON.parse(arr[i].keyword).items.map(item => {
							return item.tag;
						});
						tagsA = tagsA.concat(tags);
					}catch(e) {
						console.log(e);
					}
					
				}
				if(arr[j].keyword) {
					try {
						var tags = JSON.parse(arr[j].keyword).items.map(item => {
							return item.tag;
						});
						tagsB = tagsB.concat(tags);
					}catch(e) {
						console.log(e);
					}
				}
				var simi = similar.init(arr[i].title, arr[j].title, tagsA, tagsB);
				var json = {
					bid1: arr[i].id,
					bid2: arr[j].id,
					title1: arr[i].title,
					title2: arr[j].title,
					words1: JSON.stringify(simi.arr1),
					words2: JSON.stringify(simi.arr2),
					similar: simi.similar,
					version: new Date().getTime()
				}
				jsonData.push(json);
			}
				
		}
	}
	if(jsonData.length > 0) {
		insertData(connection, jsonData);
	}else {
		pool.end(function (err) {
			if(err) throw err;
			connection.release();
		});
	}
	
}
/**
 * 将最后的结果保存到数据库，并且释放连接池
 * @param  {[type]} connection [description]
 * @param  {[type]} jsonArr    [description]
 * @return {[type]}            [description]
 */
function insertData(connection, jsonArr) {
	var sql = squel.insert()
					.into('similar')
					.setFieldsRows(jsonArr)
					.toString();
	connection.query(sql, (err, res, fields) => {
		if(err) throw err;
		console.log(res);
		pool.end(function (err) {
			if(err) throw err;
			connection.release();
		});
	})
}
function querySimilar(blogData = [], connection) {
	var sql = squel.select()
					.from('similar')
					.field('bid1')
					.field('bid2')
					.toString();
	connection.query(sql, (err, res, field) => {
		if(err) throw err;
		var rs = res.map(item => {
			return item.bid1 + '||' + item.bid2;
		})
		handleData(rs, blogData, connection);
	})
}
