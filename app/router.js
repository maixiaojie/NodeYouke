'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  app.passport.mount('github');
  router.get('/', controller.home.index);
  router.get('/add', controller.blog.add);
  router.post('/newblog', controller.blog.newblog);
  router.get('/detail/:id', controller.blog.detail);
  router.get('/blogAnalysis/:id', controller.blog.blogAnalysis);
  router.get('/logout', controller.home.logout);

  router.get('/user/:id', controller.user.detail);

  router.get('/wb', controller.wb.index);
  router.get('/wb/getStatus/:uid', controller.wb.getStatus);
  router.get('/wbkeywords/:uid', controller.wb.keywords);
  router.get('/wbdata/:uid', controller.wb.wbdata);
  router.get('/wbdata2/:uid', controller.wb.wbdata2);
  router.get('/news', controller.news.list);
  router.get('/new', controller.news.lists);

  router.get('/zl', controller.lanmu.index);
  router.get('/addzl', controller.lanmu.add);
  router.post('/zl/newzl', controller.lanmu.newzl);
  router.get('/al/:id', controller.lanmu.article_list);
  router.get('/newarticle/:pid', controller.lanmu.newarticle);
  router.post('/zl/newarticle', controller.lanmu.newArticle);
  router.get('/zl/detail/:id', controller.lanmu.detail);
};
