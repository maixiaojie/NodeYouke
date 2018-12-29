<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <meta data-vue-meta="true" data-vmid="keywords" name="keywords" content="微博关键词,2018,微博词云"/>
    <meta data-vue-meta="true" data-vmid="description" name="description" content="{{userData.screen_name}}的2018微博词云"/>
    <meta name="author" content="麦晓杰 | maixiaojie.github.io" />
    <meta name="Copyright" content="Copyright (c) 2016-2019 yk.mcust.cn" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="{{userData.screen_name}}的2018微博词云">
    <meta property="og:description" content="{{userData.screen_name}}的2018微博词云,更多内容请访问http:/yk.mcust.cn">
    <meta property="og:image" content="http:/yk.mcust.cn/public/img/logo80.jpg">
    <meta property="og:url" content="http:/yk.mcust.cn/wb">
    <title>{{userData.screen_name}}的2018微博词云</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/wbcommon.css" />
    <link rel="stylesheet" href="/public/css/animate.css" />
    <style>
        body {
            background: url('/public/assets/3.png') no-repeat;
            background-size: cover;
            {# background-image: linear-gradient(44deg, #FECFA9 0%, #FD7189 100%); #}
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
<div style ='margin:0 auto;width:0px;height:0px;overflow:hidden; '>
<img src='/public/img/logo80.jpg'/>
</div>
<p class="name animated bounceInLeft" style="margin-top:12%;">在2018年</p>
<p class="divide"></p>
<p class="ct animated bounceInRight">微博一共被转发 {{data.rcc}} 次</p>
<p class="ct animated bounceInLeft">获得点赞 {{data.ac}} 次</p>
<p class="ct animated bounceInRight">收到评论 {{data.cc}} 次</p>
<div class="bottom"></div>
<div class="nextcontainer" data-html2canvas-ignore="true">
    <a class="animated infinite pulse delay-2s" href="/wbkeywords/{{userData.uid}}"><img src="/public/assets/Path.png" />next</a>
</div>
<div class="lb">
    <img src="/public/img/lb.png">
    <p data-html2canvas-ignore="true">Tips:长按图片可以保存</p>
</div>
<div class="titleLogo">
    <img src="/public/img/title.png">
</div>
</body>
<script src="https://cdn.bootcss.com/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>
<script src="/public/js/wbcommon.js"></script>
<script>
</script>
</html>