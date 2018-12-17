const moment = require('moment');
moment.locale('zh-cn');

const AipNlpClient = require('baidu-aip-sdk').nlp;
// 设置APPID/AK/SK
var APP_ID = "9594700";
var API_KEY = "MdWlhGsT7It2DL8Fk3hHVx1z";
var SECRET_KEY = "ICe08Y6x7tIfA2svO2uS34gZXeMhjqhE";
// 新建一个对象，建议只保存一个对象调用服务接口
var client = new AipNlpClient(APP_ID, API_KEY, SECRET_KEY);

exports.relativeTime = date => moment(date).fromNow();
exports.toDate = date => moment(date).format('LLL');
exports.str2arr = str => str.split(',');
exports.HomeArr2str = arr => arr.map(item => item.tag).join(',');
exports.getCount = function(arr) {
  var obj = {},
      k, arr1 = [];
  for(var i = 0, len = arr.length; i < len; i++) {
      k = arr[i];
      if(obj[k])
          obj[k]++;
      else
          obj[k] = 1;
  }
  for(var o in obj) {
      arr1.push({
          tag: o,
          count: obj[o]
      });
  }
  return arr1;
}
exports.uuid = function(len, radix) {
    var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
    var uuid = [], i;
    radix = radix || chars.length;
 
    if (len) {
      // Compact form
      for (i = 0; i < len; i++) uuid[i] = chars[0 | Math.random()*radix];
    } else {
      // rfc4122, version 4 form
      var r;
 
      // rfc4122 requires these characters
      uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
      uuid[14] = '4';
 
      // Fill in random data.  At i==19 set the high bits of clock sequence as
      // per rfc4122, sec. 4.1.5
      for (i = 0; i < 36; i++) {
        if (!uuid[i]) {
          r = 0 | Math.random()*16;
          uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
        }
      }
    }
 
    return uuid.join('');
}
exports.rd = function(n,m){
  var c = m-n+1; 
  return Math.floor(Math.random() * c + n);
}
exports.keyword = function(title, content, callback) {
  // 自然语言处理- 文章标签 - 针对网络各类媒体文章进行快速的内容理解，根据输入含有标题的文章，输出多个内容标签以及对应的置信度，用于个性化推荐、相似文章聚合、文本内容分析等场景。
  client.keyword(title, content).then(function(result) {
    callback(JSON.stringify(result));
    }).catch(function(err) {
      console.log(err);
  });
}
exports.topic = function(title, content, callback) {
  // 自然语言处理- 文章分类 - 对文章按照内容类型进行自动分类，首批支持娱乐、体育、科技等26个主流内容类型，为文章聚类、文本内容分析等应用提供基础技术支持。
  client.topic(title, content).then(function(result) {
    callback(JSON.stringify(result));
  }).catch(function(err) {
      console.log(err);
  });
}