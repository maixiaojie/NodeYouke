const Controller = require('egg').Controller;


class NewsController extends Controller {
  async list() {
    const ctx = this.ctx;
    const page = ctx.query.page || 1;
    const newsList = await ctx.service.news.list(page);
    await ctx.render('list.tpl', { list: newsList });
  }
  async lists() {
    const ctx = this.ctx;
    const page = ctx.query.page || 1;
    const newsList = await ctx.service.news.list(page);
    ctx.body = newsList;
  }
}
module.exports = NewsController;
