'use strict';

const Controller = require('egg').Controller;

class LanmuController extends Controller {
    async index() {
        let page = 1;
        const query = this.ctx.query;
        const userinfo = this.ctx.user;
        const zl = await this.ctx.service.zl.list();
        await this.ctx.render('zl/home.tpl', {
            title: '悠客专栏 Lite',
            userinfo,
            zl
        });
    }
    async add() {
        await this.ctx.render('zl/addzl.tpl', {
            title: '新增悠客专栏 Lite'
        });
    }
    async newzl() {
        const ctx = this.ctx;
        const req = ctx.request.body;
        const id = 'zl'+ctx.helper.uuid(6);
        const data = Object.assign(req, {uid: ctx.session.userid, id: id, ctime: new Date()});
        const rs = await ctx.service.zl.add(data);
        return ctx.body = {
            success: rs
        } 
    }
    async article_list() {
        const id = this.ctx.params.id;
        const order = this.ctx.params.order;
        const zl_info = await this.ctx.service.zl.one(id);
        const articles = await this.ctx.service.zl.listArticle(1, id, order);
        await this.ctx.render('zl/articlelist.tpl', {
            zl_info,
            articles,
            order
        });
    }
    async newarticle() {
        const id = this.ctx.params.pid;
        const zl_info = await this.ctx.service.zl.one(id);
        await this.ctx.render('zl/addarticle.tpl', {
            title: '添加文章',
            zl_info
        });
    }
    async newArticle() {
        const ctx = this.ctx;
        const req = ctx.request.body;
        const id = ctx.helper.uuid(10);
        const data = Object.assign(req, {uid: ctx.session.userid, id: id, ctime: new Date()});
        const rs = await ctx.service.zl.addArticle(data);
        return ctx.body = {
            success: rs
        } 
    }
    async detail() {
        const id = this.ctx.params.id;
        await this.ctx.service.zl.updateRead(id);
        const article = await this.ctx.service.zl.oneArticle(id);
        const zhuanlan = await this.ctx.service.zl.one(article.pid);
        await this.ctx.render('zl/detail.tpl', {
            title: '添加文章',
            data: article,
            zhuanlan
        });
    }
    async zlListApi() {
        let page = 1;
        const query = this.ctx.query;
        const userinfo = this.ctx.user;
        const zl = await this.ctx.service.zl.list();
        return this.ctx.body = {
            data: zl
        }
    }
    async articleListApi() {
        const id = this.ctx.params.id;
        const order = this.ctx.params.order;
        const zl_info = await this.ctx.service.zl.one(id);
        const articles = await this.ctx.service.zl.listArticle(1, id, order);
        return this.ctx.body = {
            zl_info,
            articles,
            order
        }        
    }
    async detailApi() {
        const id = this.ctx.params.id;
        const order = this.ctx.params.order;
        await this.ctx.service.zl.updateRead(id);
        const article = await this.ctx.service.zl.oneArticle(id);
        const zhuanlan = await this.ctx.service.zl.one(article.pid);
        const lastArticle = await this.ctx.service.zl.lastArticle(article.pid, article.id, order);
        const nextArticle = await this.ctx.service.zl.nextArticle(article.pid, article.id, order);
        article.mdhtml = article.mdhtml.toString();
        return this.ctx.body = {
            data: {
                article,
                lastArticle,
                nextArticle
            },
            zhuanlan
        }
    }
}

module.exports = LanmuController;