#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Date    : 2018-11-08 15:39:03
# @Author  : maixiaojie (tracywyj@gmail.com)
# @Link    : https://maixiaojie.github.io
# @Version : $Id$

import os
import codecs
import json

def printList(lists):
	res_data = json.dumps(lists, ensure_ascii=False, encoding="UTF-8")
	print res_data

def readStopWord():
	words = []
	with codecs.open('./dict/stopwords.dat', 'r', 'utf-8') as f:
		for item in f.readlines():
			item = item.strip('\n')
			words.append(item)
		return words

if __name__ == '__main__':
	readStopWord()