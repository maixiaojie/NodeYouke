'use strict';
const Controller = require('egg').Controller;


class WBController extends Controller {
  async index() {
    var ctx =this.ctx;
    const code = ctx.request.query.code;
    var access_tokens = ctx.request.query.access_token;
    var uids = ctx.request.query.uid;
    if(access_tokens && uids) {
        // 缺少验证token的有效性
        const userinfo = await this.usersShow(access_tokens, uids);
        console.log(userinfo);
        var s1 = new Date(userinfo.created_at).getTime();
        var s2 = new Date().getTime();
        var days = parseInt((s2-s1) / (1000 * 60 * 60 * 24));
        var d = new Date(userinfo.created_at);  
        var resDate = d.getFullYear() + '年' + (d.getMonth() + 1) + '月' + d.getDate() + '日' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds(); 
        var userData = {
            screen_name: userinfo.screen_name,
            profile_image_url: userinfo.profile_image_url,
            followers_count: userinfo.followers_count,
            friends_count: userinfo.friends_count,
            days,
            create_at: resDate
        }
        console.log(userData.created_at);
        await ctx.render('wb/day.tpl', {userData});
    }
    else if(code) {
        const client_id = '3873533066';
        const client_secret = '43d4d25d3304312f7986c06ef98a0300';
        const redirect_uri = 'http://127.0.0.1:7001/wb';
        console.log(code);
        var url = `https://api.weibo.com/oauth2/access_token?client_id=${client_id}&client_secret=${client_secret}&grant_type=authorization_code&redirect_uri=${redirect_uri}&code=${code}`;
        const result = await ctx.curl(url, {
            method: 'POST'
        });
        var res = JSON.parse(result.data.toString('utf-8'));
        // console.log(res);
        if(res.error) {
            ctx.redirect(`/wb`);
        }
        const access_token = res.access_token;
        const uid = res.uid;
        ctx.redirect(`/wb?access_token=${access_token}&uid=${uid}`);
    }else {
        await ctx.render('wb/demo.tpl');
    } 
    
  }
  /**
   * users/show  根据用户ID获取用户信息
   */
  async usersShow(access_token = '', uid = '') {
    var ctx =this.ctx;
    var url = `https://api.weibo.com/2/users/show.json?access_token=${access_token}&uid=${uid}`;
    const result = await ctx.curl(url);
    var res = JSON.parse(result.data.toString('utf-8'));
    return res;
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
