'use strict';
const Controller = require('egg').Controller;


class WBController extends Controller {
  async index() {
    var ctx =this.ctx;
    const code = ctx.request.query.code;
    if(code) {
        const client_id = '3873533066';
        const client_secret = '43d4d25d3304312f7986c06ef98a0300';
        const redirect_uri = 'http://127.0.0.1:7001/wb';
        console.log(code);
        var url = `https://api.weibo.com/oauth2/access_token?client_id=${client_id}&client_secret=${client_secret}&grant_type=authorization_code&redirect_uri=${redirect_uri}&code=${code}`;
        const result = await ctx.curl(url, {
            method: 'POST'
        });
        var res = JSON.parse(result.data.toString('utf-8'));
        console.log(res);
        if(res.error) {
            ctx.redirect(`/wb`);
        }
        const access_token = res.access_token;
        const uid = res.uid;
        this.usersShow(access_token, uid);
        // this.userTimeline(access_token, uid);
        // this.share(access_token);
    } 
    await ctx.render('wb/day.tpl');
  }
  /**
   * users/show  根据用户ID获取用户信息
   */
  async usersShow(access_token = '', uid = '') {
    var ctx =this.ctx;
    var url = `https://api.weibo.com/2/users/show.json?access_token=${access_token}&uid=${uid}`;
    const result = await ctx.curl(url);
    var res = JSON.parse(result.data.toString('utf-8'));
    // console.log(res);
  }
  async userTimeline(access_token = '', uid = '') {
    var qs = require('querystring');
    var ctx = this.ctx;
    var params = {
        access_token,
        uid,
        count: 40,
        page: 1,
        trim_user: 1
    };
    var url = `https://api.weibo.com/2/statuses/user_timeline.json?`;
    const result = await ctx.curl(url+qs.stringify(params));
    var res = JSON.parse(result.data.toString('utf-8'));
    console.log(res.statuses.length);
  }
  async share(access_token) {
    var url = `https://api.weibo.com/2/statuses/share.json?`;
    var params = {
        access_token,
        status: encodeURIComponent('http://www.baidu.com/share/'),
        rip: '127.0.0.1'
    };
    var qs = require('querystring');
    var ctx = this.ctx;
    const result = await ctx.curl(url+qs.stringify(params), {
        method: 'POST'
    });
    var res = JSON.parse(result.data.toString('utf-8'));
    console.log(res);
  }
}
module.exports = WBController;
