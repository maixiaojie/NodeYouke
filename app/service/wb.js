'use strict';
const Service = require('egg').Service;

class WbService extends Service {
    async getSum(uid) {
        const sql = `SELECT SUM(reposts_count) AS rc,
        SUM(comments_count) AS cc,
        SUM(attitudes_count) AS ac,
        SUM(LENGTH(text)) AS wl
        FROM wb WHERE uid = '${uid}'  AND LENGTH(created_at) != 10`
        const rs = await this.app.mysql.query(sql);
        return rs;
    }
    async getcount(uid) {
        const sql = `SELECT COUNT(*) AS count FROM wb WHERE uid = '${uid}' AND LENGTH(created_at) != 10`
        const rs = await this.app.mysql.query(sql);
        return rs;
    }
    async getRetweentedCount(uid) {
        const sql = `SELECT COUNT(*) AS rc  FROM wb WHERE uid = '${uid}' AND is_retweeted = '1' AND LENGTH(created_at) != 10`;
        const rs = await this.app.mysql.query(sql);
        return rs;
    }
}
module.exports = WbService;