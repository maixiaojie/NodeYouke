<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <title>{{title}}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/wbcommon.css" />
    <link rel="stylesheet" href="/public/css/animate.css" />
    <style>
        body {
            background: url('/public/assets/3.png') no-repeat;
            background-size: cover;
            font-family: Arial,"PingFang SC","Hiragino Sans GB","Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;
        }
        .bottom {
            width: 100%;
            position: absolute;
            bottom: 10%;
            height: 30%;
            background: url(/public/assets/船.png) no-repeat;
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
            .btn {
                width: 400px;
            }
        }
    </style>
</head>
<body>
<p class="name animated bounceInLeft" style="margin-top:12%;">在2018年</p>
<p class="divide"></p>
<p class="ct animated bounceInRight">微博一共被转发 {{data.rcc}} 次</p>
<p class="ct animated bounceInLeft">获得点赞 {{data.ac}} 次</p>
<p class="ct animated bounceInRight">收到评论 {{data.cc}} 次</p>
<div class="bottom"></div>
<div class="nextcontainer">
    <a class="animated infinite pulse delay-2s" href="/wbkeywords/{{userData.uid}}"><img src="/public/assets/Path.png" />next</a>
</div>
</body>
<script src="/public/js/common.js"></script>
<script>
</script>
</html>