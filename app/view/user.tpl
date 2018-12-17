<!-悠客 ->
<html>
<head>
    <meta data-vue-meta="true" data-vmid="keywords" name="keywords" content="悠客,麦晓杰,开发者,{{user.name}}, {{ user.display_name }}"/>
    <meta data-vue-meta="true" data-vmid="description" name="description" content="悠客是另外一个帮助开发者成长的社区，是给开发者用的 Hacker News，给设计师用的 Designer News，和给产品经理用的 Medium。悠客的技术文章由技术大牛和极客共同编辑为你筛选出最优质的干货，其中包括：Android、iOS、前端、后端等方面的内容。用户每天都可以在这里找到技术世界的头条内容。即使你是 GitHub、StackOverflow、开源中国的用户，我们相信你也可以在这里有所收获。"/>
    <meta name="author" content="麦晓杰 | maixiaojie.github.io" />
    <meta name="Copyright" content="Copyright (c) 2016-2019 yk.mcust.cn" />
    <title>悠客 Lite - 另外一个帮助开发者成长的社区</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/common.css" />
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/public/css/user.css" />
</head>
<body>
    <nav class="main">
        <div class="container"><a href="/" title="悠客 - 另外一个帮助开发者成长的社区" class="brand">悠客 Lite</a> <span></span></div>
    </nav>
    <section class="mainBody">
        <section class="formBody">
            <div class="u-container">
                <div class="tac"><img src="{{user.avatar_url}}" title="{{user.name}} - 用户头像" alt="{{user.name}} - 用户头像" /></div>
                <div class="tac username m5">{{user.name}} <span>({{user.display_name}})</span></div>
                <div class="tac m5 loc">
                    <span class="">{{user.location}}</span> |
                    <span class="">{{user.company}}</span>
                    <a href="{{user.github_url}}" target="_blank" class="href" title=" {{user.name}} - github"><i class="fa fa-github"></i></a>
                    <a href="{{user.blog}}" target="_blank" class="href" title="{{user.name}} - 个人博客"><i class="fa fa-paperclip"></i></a>
                </div>
                <div class="tac m5 lastlogin">上次登录时间：{{ helper.relativeTime(user.last_login_time) }} </div>
                <div class="tac m5 bio" >{{user.bio}}</div>
            </div>
        </section>
    </section>
</body>
<script src="/public/js/common.js"></script>
<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

</html>