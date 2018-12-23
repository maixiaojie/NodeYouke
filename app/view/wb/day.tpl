<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <title>{{title}}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/wbcommon.css" />
    <link rel="stylesheet" href="/public/css/animate.css" />
    <style>
        body {
            background: url('/public/assets/1.png') no-repeat;
            background-size: cover;
            {# background-image: linear-gradient(-44deg, #30CFD0 0%, #330867 100%); #}
            font-family: Arial,"PingFang SC","Hiragino Sans GB","Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;
        }
        .name { 
            margin-top: 12%;
        }
        .bottom {
            width: 100%;
            position: absolute;
            bottom: 0;
            height: 45%;
            background: url('/public/assets/山.png') no-repeat;
            background-size: 100% 100%;
            opacity: 0.9;
        }
        @media screen and (min-width: 780px) {
            body {
                width:400px;
                margin-left: calc(50% - 200px) !important;
                background-position: 50% 0;
                background-size: 400px 100%;
            }
        }
    </style>
</head>
<body>
{# <p class="img">
    <img src="{{userData.profile_image_url}}" />
</p> #}
<p class="name animated bounceInLeft">嗨， @ {{userData.screen_name}}</p>
<p class="divide"></p>
<p class="ct animated bounceIn">你在 {{userData.create_at }} 注册微博 </p>
<p class="ct animated bounceInRight">今天是你在微博的第 {{userData.days}} 天</p>
{# <p class="content">今天是我在微博的第<span>{{userData.days}}</span>天</p>
<p class="content">我在<span class="small">{{userData.create_at }}</span>这个时候注册了微博，</p>
<p class="content">到现在为止，我关注了<span class="middle">{{userData.friends_count}}</span>人， 共有<span class="middle">{{userData.followers_count}}</span>人关注了我。</p> #}
{# <p class="keywords"><a href="/wbkeywords/{{userData.uid}}">点击获取我的微博关键词</a></p> #}
{# <p class="keywords"><a href="/wbdata/{{userData.uid}}">点击查看下一页</a></p> #}
<div class="bottom"></div>
<div class="nextcontainer">
    <a class="animated infinite pulse delay-2s" href="/wbdata/{{userData.uid}}"><img src="/public/assets/Path.png" />next</a>
</div>
{# <p class="intro">©flying工作室 pord by <a href="https://m.weibo.cn/u/2401890571">@丶aNva丨</a></p> #}
</body>
<script src="/public/js/common.js"></script>
<script>
</script>
</html>