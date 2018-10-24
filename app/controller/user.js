'use strict';
const Controller = require('egg').Controller;


class UserController extends Controller {
  async detail() {
    const ctx = this.ctx;
    const id = ctx.params.id;
    const user = await this.ctx.service.user.findOne({id});
    await ctx.render('user.tpl', { user });
  }
}
module.exports = UserController;
