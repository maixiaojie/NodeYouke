'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    let page = 1;
    const query = this.ctx.query;
    const keyword = query.keyword;
    const userinfo = this.ctx.user;
    const list = await this.ctx.service.blog.list(page, keyword);
    const tags = await this.ctx.service.blog.listAllTags();
    await this.ctx.render('home.tpl', { title:  '悠客 Lite', tags, list, userinfo});
  }
  async logout() {
    this.ctx.session.userid = null;
    this.ctx.logout();
    this.ctx.redirect('/');
  }
}

module.exports = HomeController;
