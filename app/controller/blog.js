'use strict';

const Controller = require('egg').Controller;
class BlogController extends Controller {
    async add() {
        await this.ctx.render('add.tpl', { title:  '悠客 Lite'});
    }
    async newblog() {
        const ctx = this.ctx;
        const req = ctx.request.body;
        const id = 'blog'+ctx.helper.uuid(60);
        const data = Object.assign(req, {uid: ctx.session.userid, id: id, ctime: new Date()});
        const rs = await ctx.service.blog.add(data);
        try {
            // 计算文档之间的相似度
            this.countSimilar();
            // 文档获取内容标签
            ctx.helper.keyword(req.title, req.mdtext, function(res) {
                var keyword = res;
                // 文档获取分类标签
                ctx.helper.topic(req.title, req.mdtext, function(rs) {
                    var topic = rs;
                    const anal_id = 'anal'+ctx.helper.uuid(60);
                    var anal_data = {
                        id: anal_id,
                        blog_id: id,
                        keyword,
                        topic,
                        ctime: new Date()
                    };
                    const anal_rs = ctx.service.blog.addAnalysis(anal_data);
                });
            });
        }catch(e) {
            console.log(e);
        }        
        return ctx.body = {
            success: rs
        }        
    }
    async detail() {
        const id = this.ctx.params.id;
        await this.ctx.service.blog.updateRead(id);
        const data = await this.ctx.service.blog.one(id);        
        const auth = await this.ctx.service.user.findOne({id: data.uid});
        const similar = await this.ctx.service.blog.listSimilar(id, 7);
        await this.ctx.render('detail.tpl', { data, auth, similar});
    }
    async blogAnalysis() {
        const id = this.ctx.params.id;
        const data = await this.ctx.service.blog.getAnalysis(id);
        return this.ctx.body = {
            success: 1,
            data
        }
    }
    /**
     * 调用另外一个nodejs脚本，去计算文档相似度
     */
    countSimilar() {
        const path = require('path');
        var process = require('child_process');
        var appRoot = path.resolve(__dirname, '../../');
        var similarCountAppPath = path.join(appRoot, 'similar');
        var shell = `cd ${similarCountAppPath} && node index.js`;
        process.exec(shell, (error, stdout, stderr) => {
            if(error) throw error;
        });
    }
}
module.exports = BlogController;