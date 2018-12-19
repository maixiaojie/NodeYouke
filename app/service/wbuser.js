'use strict';
const Service = require('egg').Service;

class WbuserService extends Service {
    async register(user) {
        const rs = await this.app.mysql.insert('wb_user', user);
        return rs.affectedRows === 1;
    }
    async findOne(condition) {
        const rs = await this.app.mysql.get('wb_user', condition);
        return rs;
    }
    async updateOne(row) {
        const rs = await this.app.mysql.update('wb_user', row);
        return rs.affectedRows === 1;
    }
}
module.exports = WbuserService;