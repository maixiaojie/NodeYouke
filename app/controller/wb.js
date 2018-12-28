'use strict';
const Controller = require('egg').Controller;


class WBController extends Controller {
    async index() {
        var ctx = this.ctx;
        const code = ctx.request.query.code;
        var access_tokens = ctx.request.query.access_token;
        var uids = ctx.request.query.uid;
        if (access_tokens && uids) {
            // 缺少验证token的有效性
            // await this.userTimeline(access_tokens, uids);
            // await this.share(access_tokens);
            const userinfo = await this.usersShow(access_tokens, uids);
            await this.saveUserInfo(uids, userinfo);
            var s1 = new Date(userinfo.created_at).getTime();
            var s2 = new Date().getTime();
            var days = parseInt((s2 - s1) / (1000 * 60 * 60 * 24));
            var d = new Date(userinfo.created_at);
            var resDate = d.getFullYear() + '年' + (d.getMonth() + 1) + '月' + d.getDate() + '日' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
            var userData = {
                screen_name: userinfo.screen_name,
                profile_image_url: userinfo.profile_image_url,
                followers_count: userinfo.followers_count,
                friends_count: userinfo.friends_count,
                days,
                uid: uids,
                create_at: resDate
            }
            const wbcountData = await ctx.service.wb.getcount(uids);
            const wbcount = wbcountData[0].count;
            const splider =  await ctx.service.wb.getSpliderStatus(uids);
            const splider_status = splider.length > 0 ? splider[0].splider_status : 4;
            if(wbcount == 0 && splider_status == 4) {
                this.toGetWBdata(uids);
            }
            await ctx.render('wb/day.tpl', {
                userData
            });
        } else if (code) {
            const client_id = this.config.SinaWB.client_id;
            const client_secret = this.config.SinaWB.client_secret;
            const redirect_uri = this.config.SinaWB.redirect_uri;
            console.log(code);
            var url = `https://api.weibo.com/oauth2/access_token?client_id=${client_id}&client_secret=${client_secret}&grant_type=authorization_code&redirect_uri=${redirect_uri}&code=${code}`;
            const result = await ctx.curl(url, {
                method: 'POST'
            });
            var res = JSON.parse(result.data.toString('utf-8'));
            // console.log(res);
            if (res.error) {
                ctx.redirect(`/wb`);
            }
            const access_token = res.access_token;
            const uid = res.uid;
            const wbcountData = await ctx.service.wb.getcount(uid);
            const wbcount = wbcountData[0].count;
            const splider =  await ctx.service.wb.getSpliderStatus(uid);
            const splider_status = splider.length > 0 ? splider[0].splider_status : 4;
            if(wbcount == 0 && splider_status == 4) {
                // this.toGetWBdata(uid);
            }
            ctx.redirect(`/wb?access_token=${access_token}&uid=${uid}`);
        } else {
            const sinaApiConf = this.config.SinaWB;
            await ctx.render('wb/grant.tpl', {
                sinaApiConf
            });
        }
    }
    async saveUserInfo(uid, userinfo) {
        const user = await this.ctx.service.wbuser.findOne({
            id: uid
        });
        if (user == null) {
            const saveData = {
                id: userinfo.id,
                class: userinfo.class,
                screen_name: userinfo.screen_name,
                name: userinfo.name,
                province: userinfo.province,
                city: userinfo.city,
                location: userinfo.location,
                description: userinfo.description,
                url: userinfo.url,
                profile_image_url: userinfo.profile_image_url,
                cover_image_phone: userinfo.cover_image_phone,
                profile_url: userinfo.profile_url,
                domain: userinfo.domain,
                weihao: userinfo.weihao,
                gender: userinfo.gender,
                followers_count: userinfo.followers_count,
                friends_count: userinfo.friends_count,
                pagefriends_count: userinfo.pagefriends_count,
                statuses_count: userinfo.statuses_count,
                video_status_count: userinfo.video_status_count,
                favourites_count: userinfo.favourites_count,
                created_at: userinfo.created_at,
                following: userinfo.following,
                allow_all_act_msg: userinfo.allow_all_act_msg,
                geo_enabled: userinfo.geo_enabled,
                verified: userinfo.verified,
                verified_type: userinfo.verified_type,
                remark: userinfo.remark,
                ptype: userinfo.ptype,
                allow_all_comment: userinfo.allow_all_comment,
                avatar_large: userinfo.avatar_large,
                avatar_hd: userinfo.avatar_hd,
                verified_reason: userinfo.verified_reason,
                verified_trade: userinfo.verified_trade,
                verified_reason_url: userinfo.verified_reason_url,
                verified_source: userinfo.verified_source,
                verified_source_url: userinfo.verified_source_url,
                verified_state: userinfo.verified_state,
                verified_level: userinfo.verified_level,
                verified_type_ext: userinfo.verified_type_ext,
                has_service_tel: userinfo.has_service_tel,
                verified_reason_modified: userinfo.verified_reason_modified,
                verified_contact_name: userinfo.verified_contact_name,
                verified_contact_email: userinfo.verified_contact_email,
                verified_contact_mobile: userinfo.verified_contact_mobile,
                bi_followers_count: userinfo.bi_followers_count,
                star: userinfo.star,
                mbtype: userinfo.mbtype,
                mbrank: userinfo.mbrank,
                block_word: userinfo.block_word,
                block_app: userinfo.block_app,
                credit_score: userinfo.credit_score,
                user_ability: userinfo.user_ability,
                cardid: userinfo.cardid,
                avatargj_id: userinfo.avatargj_id,
                urank: userinfo.urank,
                story_read_state: userinfo.story_read_state,
                vclub_member: userinfo.vclub_member,
                ctime: new Date()
            }
            await this.ctx.service.wbuser.register(saveData);
        }

    }
    async keywords() {
        var ctx = this.ctx;
        const uid = ctx.params.uid;
        // console.log(uid)
        const userData = {
            screen_name: '丶aNva丨',
            uid
        };
        await ctx.render('wb/keywords.tpl', {
            userData
        });
    }
    async getStatus() {
        var ctx = this.ctx;
        const uid = ctx.params.uid;
        const splider =  await ctx.service.wb.getSpliderStatus(uid);
        return ctx.body = {
            success: 1,
            data:splider
        }
    }
    async wbdata() {
        var ctx = this.ctx;
        const uid = ctx.params.uid;
        const wbcountData = await this.ctx.service.wb.getcount(uid);
        const wbcount = wbcountData[0].count;
        const splider =  await ctx.service.wb.getSpliderStatus(uid);
        const splider_status = splider.length > 0 ? splider[0].splider_status : 4;
        // const splider_status = 4;
        if(wbcount == 0) {
            //数据抓取未完成 或者无数据 或者数据抓取失败

            const userData = {
                uid,
                screen_name: '丶aNva丨',
                profile_image_url: 'http://tvax1.sinaimg.cn/crop.0.0.996.996.50/8f29f10bly8fr5j8c8qbcj20ro0rogmp.jpg'
            };
            await ctx.render('wb/data.tpl', {
                userData,
                splider_status,
                wbcount
            });
        }else {
            const userinfo = await this.ctx.service.wbuser.findOne({id: uid});
            const sum = await this.ctx.service.wb.getRetweentedCount(uid);
            var data = {};
            data.count = wbcount; //发布的微博总数
            const rc = sum[0].rc; 
            data.rc = rc; //转发微博数
            data.ycc = data.count - data.rc; //发布的原创微博总数
            const count = await this.ctx.service.wb.getSum(uid);
            data.rcc = count[0].rc; // 微博被转发总数
            data.cc = count[0].cc; // 微博被评论总数
            data.ac = count[0].ac; // 微博被点赞总数
            data.wl = count[0].wl; //发布微博总字数
            const userData = {
                uid,
                screen_name: userinfo.screen_name,
                profile_image_url: userinfo.profile_image_url
            };
            await ctx.render('wb/data.tpl', {
                userData,
                data,
                splider_status,
                wbcount
            });
        } 
    }
    async wbdata2() {
        var ctx = this.ctx;
        const uid = ctx.params.uid;
        const wbcountData = await this.ctx.service.wb.getcount(uid);
        const wbcount = wbcountData[0].count;
        // console.log(wbcount)
        if(wbcount == 0) {
            //数据抓取未完成 或者无数据 或者数据抓取失败

            const userData = {
                uid,
                screen_name: '丶aNva丨',
                profile_image_url: 'http://tvax1.sinaimg.cn/crop.0.0.996.996.50/8f29f10bly8fr5j8c8qbcj20ro0rogmp.jpg'
            };
            await ctx.render('wb/data2.tpl', {
                userData
            });
        }else {
            const userinfo = await this.ctx.service.wbuser.findOne({id: uid});
            const sum = await this.ctx.service.wb.getRetweentedCount(uid);
            var data = {};
            data.count = wbcount; //发布的微博总数
            const rc = sum[0].rc; 
            data.rc = rc; //转发微博数
            data.ycc = data.count - data.rc; //发布的原创微博总数
            const count = await this.ctx.service.wb.getSum(uid);
            data.rcc = count[0].rc; // 微博被转发总数
            data.cc = count[0].cc; // 微博被评论总数
            data.ac = count[0].ac; // 微博被点赞总数
            data.wl = count[0].wl; //发布微博总字数
            const userData = {
                uid,
                screen_name: userinfo.screen_name,
                profile_image_url: userinfo.profile_image_url
            };
            await ctx.render('wb/data2.tpl', {
                userData,
                data
            });
        } 
    }
    /**
     * 调用python脚本
     */
    toGetWBdata(uid) {
        try {
            const path = require('path');
            var process = require('child_process');
            var appRoot = path.resolve(__dirname, '../../');
            var pythonWBAppPath = path.join(appRoot, 'wb');
            var shell = `cd ${pythonWBAppPath} && python weibo.py ${uid}`;
            console.log(shell)
            // var pyscript = spawn(shell,['-m']);
            // pyscript.on('exit', function (code, signal) { 
            //     console.log('child process eixt ,exit:' + code); 
            // });
            process.exec(shell, (error, stdout, stderr) => {
                if (error) throw error;
            }); 
        }catch(e) {
            console.log(e)
        }
        
    }
    /**
     * users/show  根据用户ID获取用户信息
     */
    async usersShow(access_token = '', uid = '') {
        var ctx = this.ctx;
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
            uids: uid,
            count: 40,
            page: 1,
            trim_user: 1
        };
        var url = `https://api.weibo.com/2/statuses/timeline_batch.json?`;
        const result = await ctx.curl(url + qs.stringify(params));
        var res = JSON.parse(result.data.toString('utf-8'));
        console.log(res);
    }
    async share(access_token) {
        var url = `https://api.weibo.com/2/statuses/share.json?`;
        var params = {
            access_token,
            // rip: '106.12.202.229',
            status: encodeURIComponent('啦啦啦， 快来看。http://yk.mcust.cn/detail/blogWFwkSDpxn4rh23ts4BZ629dsY7c08fHj2X1YlBcm0Bq8HiqSv5s5e773e4e0')
        };
        var qs = require('querystring');
        var ctx = this.ctx;
        const result = await ctx.curl(url + qs.stringify(params), {
            method: 'POST'
        });
        var res = JSON.parse(result.data.toString('utf-8'));
        console.log(res);
    }
}
module.exports = WBController;