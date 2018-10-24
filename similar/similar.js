var nodejieba = require('nodejieba');
var similar = {
	/**
	 * 短文本计算相似度
	 * @param  {[type]} sentence1 [description]
	 * @param  {[type]} sentence2 [description]
	 * @param  {Array}  tags1     [description]
	 * @param  {Array}  tags2     [description]
	 * @return {[type]}           [description]
	 */
	init(sentence1, sentence2, tags1=[], tags2=[]) {
		var arr1 = similar.wordbreak(sentence1);
		var arr2 = similar.wordbreak(sentence2);
		arr1 = arr1.concat(tags1);
		arr2 = arr2.concat(tags2);
		var total = similar.mergeArr(arr1, arr2);
		var vector1 = similar.buildVector(arr1, total);
		var vector2 = similar.buildVector(arr2, total);
		return {
			arr1,
			arr2,
			similar: similar.countSimilar(vector1, vector2)
		};
	},
	/**
	 * 短文本分词
	 * @param  {[type]} sentence [description]
	 * @return {[type]}          [description]
	 */
	wordbreak(sentence) {
		sentence = sentence.replace(/\s+/g,"");
		return nodejieba.tag(sentence).map(item => {
			return item.word;
		})
	},
	/**
	 * 合并两个数组，并且去除重复项
	 * @param  {[type]} arr1 [description]
	 * @param  {[type]} arr2 [description]
	 * @return {[type]}      [description]
	 */
	mergeArr(arr1, arr2) {
		var _arr = arr1.concat(arr2);
		var set = new Set(_arr);
        return [...set];
	},
	/**
	 * 短文本构建向量
	 * @param  {[type]} arr      [description]
	 * @param  {[type]} totalArr [description]
	 * @return {[type]}          [description]
	 */
	buildVector(arr, totalArr) {
		var vector = [];
		for(var i=0; i<totalArr.length; i++) {
			vector.push(similar.countTime(totalArr[i], arr));
		}
		return vector;
	},
	/**
	 * 计算出现的次数
	 * @param  {[type]} word [description]
	 * @param  {[type]} arr  [description]
	 * @return {[type]}      [description]
	 */
	countTime(word, arr) {
		var count = 0;
		for(var i=0; i<arr.length; i++) {
			if(arr[i] == word) {
				count++;
			}
		}
		return count;
	},
	/**
	 * 根据两个短文本构建成的向量计算相似度
	 * @param  {[Array]} vector1 [文本1构建成的SVM向量]
	 * @param  {[Array]} vector2 [文本2构建成的SVM向量]
	 * @return {[Double]} rs     [相似度]
	 */
	countSimilar(vector1, vector2) {
		var sum = 0, sumX = 0, sumY = 0;
		for(var i=0; i<vector1.length; i++) {
			sum += vector1[i]*vector2[i];
			sumX += vector1[i]*vector1[i];
			sumY += vector1[i]*vector1[i];
		}
		var rs = sum / (Math.sqrt(sumX) * Math.sqrt(sumY));
		return rs;
	}
};
module.exports = { similar };