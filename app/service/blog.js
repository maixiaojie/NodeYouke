'use strict';
const Service = require('egg').Service;

class BlogService extends Service {
  async add(data) {
    const rs = await this.app.mysql.insert('blog', data);
    return rs.affectedRows === 1;
  }
  async addAnalysis(data) {
    const rs = await this.app.mysql.insert('blog_analysis', data);
    return rs.affectedRows === 1;
  }
  async list(page = 1, keyword = '') {
      const limit = 100;
      const offset = (page-1)*limit;
      keyword = '%'+keyword+'%';
      const sql = 'SELECT b.id, b.title, b.tags, b.uid, b.ctime, b.readcount, u.name FROM blog AS b INNER JOIN user AS u ON u.id = b.uid WHERE b.tags LIKE ? ORDER BY b.ctime DESC LIMIT ? OFFSET ?';
      const rs = await this.app.mysql.query(sql, [keyword, limit, offset]);
      return rs;
  }
  async one(id) {
      const rs = await this.app.mysql.get('blog', {id});
      return rs;
  }
  async getAnalysis(id) {
    const rs = await this.app.mysql.get('blog_analysis', {blog_id: id});
    return rs;
  }
  async updateRead(id) {
      const rs = await this.app.mysql.query('update blog set readcount = (readcount + 1) where id = ?', id);
      return rs.affectedRows === 1;
  }
  async listAllTags() {
    const rs = await this.app.mysql.query('SELECT tags from blog');
    var res = rs.map(item => {
      return item.tags;
    })
    res = res.join(',').split(',');
    return this.ctx.helper.getCount(res).sort(function(x, y) {
      return y.count - x.count;
    });
  }
  async listSimilar(id, limit = 5) {
    const sql = `
      SELECT DISTINCT b.id , b.title, b.tags, b.readcount, b.ctime, s.similar, u.id as uid, u.avatar_url, u.name
      FROM similar AS s 
      LEFT JOIN blog as b ON s.bid1 = b.id OR s.bid2 = b.id
      LEFT JOIN user as u ON b.uid = u.id
      WHERE
      b.id <> '${id}' 
      AND
      (s.bid1 = '${id}' OR s.bid2 = '${id}')
      GROUP BY b.id  ORDER BY s.similar DESC, b.ctime DESC
      LIMIT ${limit}`;
      const rs = await this.app.mysql.query(sql);
      return rs;
  }
}
module.exports = BlogService;
