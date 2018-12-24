'use strict';

module.exports = appInfo => {
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1537337524779_1592';
  // add your config here
  config.middleware = [ 'robot' ];
  config.mysql = {
    client: {
      host: '140.143.163.52',
      port: '3306',
      user: 'root',
      password: 'wenyujie@123',
      database: 'mdblog'
    },
    app: true,
    agent: false
  }
  config.robot = {
    ua: [
      /Baiduspider/i,
    ],
  };
  config.passportGithub = {
    key: 'e99b3cc277c87e862414',
    secret: 'ce040dab73dc4650f27a9e0c309c61109064cf69',
    proxy: true,
    // callbackURL: 'http://yk.mcust.cn/passport/github/callback'

  };
  // 新浪微博网页应用信息配置
  config.SinaWB = {
    client_id: '3873533066',
    client_secret: '43d4d25d3304312f7986c06ef98a0300',
    redirect_uri: 'http://yk.mcust.cn/wb',
    // redirect_uri: 'http://127.0.0.1:7001/wb',
  };
  config.view = {
    defaultViewEngine: 'nunjucks',
    mapping: {
      '.tpl': 'nunjucks',
    },
  };
  config.news = {
    pageSize: 5,
    serverUrl: 'https://cnodejs.org/api/v1',
  };
  config.security = {
    csrf: {
      headerName: 'x-csrf-token', // 通过 header 传递 CSRF token 的默认字段为 x-csrf-token
    }
  };
  return config;
};
