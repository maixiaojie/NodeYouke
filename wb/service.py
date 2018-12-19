#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Date    : 2018-11-06 17:29:19
# @Author  : maixiaojie (tracywyj@gmail.com)
# @Link    : https://maixiaojie.github.io
# @Version : $Id$

import MySQLdb

db = MySQLdb.connect('140.143.163.52', 'root', 'wenyujie@123', 'mdblog',  charset='utf8')
cursor = db.cursor()

def WBData(uid):
	cursor.execute("SELECT text from wb where uid = %s and LENGTH(created_at) != 10 limit 200", [uid])
	rs = cursor.fetchall()
	# close()
	return rs

def close():
	cursor.close()
	db.close()

if __name__ == '__main__':
	WBData(123)
	# close()
