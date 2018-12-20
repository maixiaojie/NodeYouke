<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <title>{{title}}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <style>
        html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }
        body {
            background: url('/public/img/databg.jpg') no-repeat;
            background-size: cover;
            font-family: Arial,"PingFang SC","Hiragino Sans GB","Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;
        }
        .img {
            text-align: center;
            padding-top: 10%;
        }
        .img img {
            width: 80px;
            height: 80px;
            border-radius: 80px;
        }
        .intro {
            position: absolute;
            bottom: 5%;
            text-align: center;
            color: white;
            width: 100%;
        }
        .intro a {
            color: #fff;
        }
        .name {
            color: #fff;
            font-size: 1.2rem;
            text-align: center;
            text-shadow: 0 0 4px rgba(0,0,0,0.5);
        }
        .content {
            text-align: center;
            color: #fff;
            font-size: 0.9rem;
        }
        .content span {
            font-size: 2rem;
        }
        .content span.small {
            font-size: 1.2rem;
        }
        .content span.middle {
            font-size: 1.5rem;
        }
        .keywords {
            text-align: center;
        }
        .keywords a {
            color: rgb(222, 21, 21);
            font-size: 18px;
        }
        @media screen and (min-width: 780px) {
            body {
                width:400px;
                margin-left: calc(50% - 200px) !important;
                background-position: 50% 0;
                background-size: 400px 100%;
            }
            .btn {
                width: 400px;
            }
        }
    </style>
</head>
<body>
<p class="img">
    <img src="{{userData.profile_image_url}}" />
</p>
<p class="name">@ {{userData.screen_name}}</p>
<p class="content">2018, 我一共发布微博<span>212</span>条</p>
<p class="content">其中，转发<span>26</span>条，原创<span>124</span>条</p>
<p class="content">2018，我共获得点赞<span>342</span>次</p>
<p class="content">2018，我的微博一共被转发<span>342</span>次</p>
<p class="content">2018，我的微博总计收到评论<span>3442</span>条</p>
<p class="keywords"><a href="/wbkeywords/{{userData.uid}}">点击查看我的微博词云</a></p>
{# <p class="intro">©flying工作室 pord by <a href="https://m.weibo.cn/u/2401890571">@丶aNva丨</a></p> #}
</body>
<script src="/public/js/common.js"></script>
<script>
</script>
</html>