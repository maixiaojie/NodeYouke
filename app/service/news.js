const Service = require('egg').Service;

class NewsService extends Service {
  async list(page = 1) {
    const { serverUrl, pageSize } = this.config.news;
    // const newsList = await this.ctx.curl(`${serverUrl}/topics`, { dataType: 'json' });
    const newsList = await this.app.mysql.select('lesson', {
        limit: 5
    });
    this.logger.info(serverUrl);
    return newsList;
  }
}
module.exports = NewsService;
