<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <meta data-vue-meta="true" data-vmid="keywords" name="keywords" content="微博关键词,2018,微博词云"/>
    <meta data-vue-meta="true" data-vmid="description" name="description" content="2018我的微博词云，回顾我的微博2018"/>
    <meta name="author" content="麦晓杰 | maixiaojie.github.io" />
    <meta name="Copyright" content="Copyright (c) 2016-2019 yk.mcust.cn" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="2018我的微博词云">
    <meta property="og:description" content="2018我的微博词云,更多内容请访问http:/yk.mcust.cn">
    <meta property="og:image" content="http:/yk.mcust.cn/public/img/logo80.jpg">
    <meta property="og:url" content="http:/yk.mcust.cn/wb">
    <title>2018我的微博词云</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=3873533066" type="text/javascript" charset="utf-8"></script>
    <style>
        html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }
        body {
            background: url('/public/img/grant2.png') no-repeat;
            background-size: 100% 100%;
            background-attachment: fixed;
            font-family: Arial,"PingFang SC","Hiragino Sans GB","Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;
        }
        .btn {
            position: absolute;
            bottom: 23%;
            text-align: center;
            width: 100%;
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
        .title {
            text-align: center;
            color: rgb(239, 44, 61);
            padding-top: 50%;
            font-size: 1.5rem;
            font-weight: 500;
        }
        
        .btn a {
            display: inline-block;
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
    </style>
</head>
<body>
<div style ='margin:0 auto;width:0px;height:0px;overflow:hidden; '>
<img src='/public/img/logo80.jpg'/>
</div>
{# <h2 class="title">查看你注册微博多少天了</h2> #}

<div class="btn WB_loginButton WB_widgets">
    <a href="https://api.weibo.com/oauth2/authorize?client_id={{sinaApiConf.client_id}}&response_type=code&redirect_uri={{sinaApiConf.redirect_uri}}">
        <img src="http://timg.sjs.sinajs.cn/t4/appstyle/widget/images/loginButton/loginButton_24.png">
    </a>
</div>
{# <p class="intro">©flying工作室 pord by <a href="https://m.weibo.cn/u/2401890571">@丶aNva丨</a></p> #}
</body>
<script src="/public/js/common.js"></script>
<script>
</script>
</html>