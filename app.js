module.exports = app => {
    
    var start = null;
    app.beforeStart(async () => {
        start = Date.now();
    })
    app.once('server', server => {
        app.logger.info('启动耗时 %d ms', Date.now() - start);
    });
    app.passport.verify(async (ctx, user) => {
        const userinfo = await ctx.service.user.findOne({github_uid: user.id});
        if(userinfo == null) {
            const newUser = {
                id: 'user'+ctx.helper.uuid(60),
                github_uid: user.id,
                display_name: user.displayName,
                avatar_url: user.photo,
                github_url: user.profile.profileUrl,
                name: user.name,
                company: user.profile._json.company,
                blog: user.profile._json.blog,
                location: user.profile._json.location,
                email: user.profile._json.email,
                bio: user.profile._json.bio,
                github_ctime: user.profile._json.created_at,
                ctime: new Date(),
                last_login_time: new Date()
            }
            ctx.session.userid = newUser.id;
            const rs = await ctx.service.user.register(newUser);
        }else {
            const updateUser = {
                id: userinfo.id,
                last_login_time: new Date()
            };
            ctx.session.userid = userinfo.id;
            const res = await ctx.service.user.updateOne(updateUser);
        }
        return user;
    })
}