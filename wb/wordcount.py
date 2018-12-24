#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Date    : 2018-11-05 14:48:35
# @Author  : maixiaojie (tracywyj@gmail.com)
# @Link    : https://maixiaojie.github.io
# @Version : $Id$
import sys
import json
import jieba
import jieba.analyse
from wordcloud import WordCloud
from PIL import Image
import numpy as np
import codecs
import weibo as wb
import service
import readdict as Dict

reload(sys)
sys.setdefaultencoding( "utf-8" )

print '加载用户词库中...'
jieba.load_userdict('./dict/userdict.txt')
print '用户词库加载完成...'
# jieba.load_userdict('./dict/dict.dat')

class wordcount(object):
	def __init__(self, uid):
		self.uid = uid
	def printList(self, lists):
		res_data = json.dumps(lists, ensure_ascii=False, encoding="UTF-8")
		print res_data

	def main(self):
		print '加载停用词中..'
		stopwords = Dict.readStopWord()
		stopwords = stopwords + self.load_stopwords()
		print '一共加载停用词'+str(len(stopwords))+'个..'
		self.get_data(stopwords)
		
	def get_data(self, stopwords):
		print '获取用户微博数据中..'
		userWbData = service.WBData(self.uid)
		print '一共获取到' + str(len(userWbData)) + ' 条微博'
		if len(userWbData) > 0:
			print '分词中..'
			wbText = self.load_words_data(userWbData, stopwords)
			print '分词完成, 正在计算用户关键词..'
			b=jieba.analyse.extract_tags(wbText, topK = 66, withWeight = True, allowPOS = ('n'))
			self.printList(b)
			# print dict(b)
			topText = self.get_topWordText(b)
			print '计算完成，图片生成中..'
			self.word_cloud(dict(b), self.uid)
		else:
			print '没有数据,正在重新获取数据'
			wb_instance = wb.Weibo()
			wb_instance.main(self.uid)

	def word_cloud(self, text, uid):
		font = './font/baiduzong.ttf'
		filename = '../app/public/userimg/'+ uid+'.png'
		bg_mask = np.array(Image.open('./mask/mask4.png'))
		wc = WordCloud(font_path=font,
			background_color='white',
			mask=bg_mask,
			width=1000,
			max_font_size=60,
			random_state=42,
			relative_scaling=0,
			height=800
			).generate_from_frequencies(text)
		wc.to_file(filename)
		print '图片生成成功【'+filename+'】'

	def get_topWordText(self, alist):
		f_str = ''
		for item in alist:
			f_str = f_str + ' ' + item[0]
		return f_str

	def load_stopwords(self):
		stopwords_list = []
		with codecs.open('./dict/stopwords.txt', 'r', 'utf-8') as f:
			for item in f.readlines():
				item = item.strip('\n')
				item = item.strip('\r')
				stopwords_list.append(item)
		return stopwords_list
	def load_words_data(self, wbText, stopwords):
		words_str = ''
		for item in wbText:
			each = item[0]
			each = each.strip('\n')
			each = each.strip('\r')
			if len(each) > 0:
				items = []
				lists = jieba.cut(each, False)
				for word in lists:
					word = word.strip('\n')
					word = word.strip('\r')
					if word not in stopwords and word != ' ' and len(word) > 1 and len(word) < 6:
						items.append(word)
				if len(items) > 0:
					words_str  = words_str + ' ' + ' '.join(items)
		return words_str


if __name__ == '__main__':	
	uid = '5195667944'
	wordc = wordcount(uid)
	wordc.main()