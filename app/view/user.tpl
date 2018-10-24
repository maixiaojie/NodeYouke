<html>
<head>
    <title>{{title}}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/common.css" />
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/public/css/user.css" />
</head>
<body>
    <nav class="main">
        <div class="container"><a href="/" class="brand">悠客 Lite</a> <span></span></div>
    </nav>
    <section class="mainBody">
        <section class="formBody">
            <div class="u-container">
                <div class="tac"><img src="{{user.avatar_url}}" /></div>
                <div class="tac username m5">{{user.name}} <span>({{user.display_name}})</span></div>
                <div class="tac m5 loc">
                    <span class="">{{user.location}}</span> |
                    <span class="">{{user.company}}</span>
                    <a href="{{user.github_url}}" target="_blank" class="href" title="github"><i class="fa fa-github"></i></a>
                    <a href="{{user.blog}}" target="_blank" class="href" title="个人博客"><i class="fa fa-paperclip"></i></a>
                </div>
                <div class="tac m5 lastlogin">上次登录时间：{{ helper.relativeTime(user.last_login_time) }} </div>
                <div class="tac m5 bio" >{{user.bio}}</div>
            </div>
        </section>
    </section>
</body>
<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

</html>