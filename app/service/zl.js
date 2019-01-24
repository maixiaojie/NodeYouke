'use strict';
const Service = require('egg').Service;

class ZlService extends Service {
  async add(data) {
    const rs = await this.app.mysql.insert('zhuanlan', data);
    return rs.affectedRows === 1;
  }
  async list(page = 1) {
      const limit = 100;
      const offset = (page-1)*limit;
      const sql = 'SELECT * FROM zhuanlan ORDER BY ctime DESC LIMIT ? OFFSET ?';
      const rs = await this.app.mysql.query(sql, [limit, offset]);
      return rs;
  }
  async one(id) {
      const rs = await this.app.mysql.get('zhuanlan', {id});
      return rs;
  }
  async listArticle(page = 1, id, order=0) {
    const limit = 100;
    const offset = (page-1)*limit;
    var sql = '';
    if(order == 1) {
      sql = 'SELECT id, pid,article_title,article_cover FROM article where pid = ? ORDER BY ctime DESC LIMIT ? OFFSET ?';
    }else {
      sql = 'SELECT id, pid,article_title,article_cover FROM article where pid = ? ORDER BY ctime ASC LIMIT ? OFFSET ?';
    }
    const rs = await this.app.mysql.query(sql, [id, limit, offset]);
    return rs;
}
  async addArticle(data) {
    const rs = await this.app.mysql.insert('article', data);
    return rs.affectedRows === 1;
  }
  async oneArticle(id) {
    const rs = await this.app.mysql.get('article', {id});
    return rs;
}
  async updateRead(id) {
      const rs = await this.app.mysql.query('update article set view_number = (view_number + 1) where id = ?', id);
      return rs.affectedRows === 1;
  }
}
module.exports = ZlService;
