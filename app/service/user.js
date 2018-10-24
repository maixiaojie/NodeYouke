'use strict';
const Service = require('egg').Service;

class UserService extends Service {
    async register(user) {
        const rs = await this.app.mysql.insert('user', user);
        return rs.affectedRows === 1;
    }
    async findOne(condition) {
        const rs = await this.app.mysql.get('user', condition);
        return rs;
    }
    async updateOne(row) {
        const rs = await this.app.mysql.update('user', row);
        return rs.affectedRows === 1;
    }
}
module.exports = UserService;