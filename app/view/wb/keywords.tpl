<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <meta data-vue-meta="true" data-vmid="keywords" name="keywords" content="微博关键词,2018,微博词云"/>
    <meta data-vue-meta="true" data-vmid="description" name="description" content="{{userData.screen_name}}的2018微博关键词"/>
    <meta name="author" content="麦晓杰 | maixiaojie.github.io" />
    <meta name="Copyright" content="Copyright (c) 2016-2019 yk.mcust.cn" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="{{userData.screen_name}}的2018微博词云">
    <meta property="og:description" content="{{userData.screen_name}}的2018微博词云,更多内容请访问http:/yk.mcust.cn">
    <meta property="og:image" content="http:/yk.mcust.cn/public/img/logo80.jpg">
    <meta property="og:url" content="http:/yk.mcust.cn/wb">
    <title>{{userData.screen_name}}的2018微博关键词</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/wbcommon.css" />
    <link rel="stylesheet" href="/public/css/animate.css" />
    <style>
        body {
            {# background: url('/public/img/bg2c.png') no-repeat; #}
            {# background-size: 100% 100%; #}
            background-image: linear-gradient(-45deg, #FA742B 0%, #FDD265 100%);
            {# background-attachment: fixed; #}
            {# background:#fff; #}
        }
        .title {
            width: 95%;
            font-family: PingFangSC-Regular;
            font-size: 18px;
            color: #FFFFFF;
            text-align: right;
            height:6rem;
            padding-right:2%;
            {# margin-top: 2%; #}
            {# background: #fe8100; #}
            {# background:#00D0CF; #}
            line-height: 6rem;
        }
        .keywordimg {
            width: calc(90% - 56px);
            margin: 5%;
            padding: 28px;
            background: rgba(255, 255, 255, 0.5);
            margin-top: 2%;
            margin-bottom:2%;
        }
        .tips {
            text-align:center;
            color:#fff;
            font-size:12px;
            {# background:#fff; #}
            margin: 0;
            padding: 10px 0;
        }
        .titleLogo {
            position: absolute;
            left: 2%;
            top: 0;
            width: 150px;
            z-index: 0;
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
<div class="title animated bounceIn">2018，你的微博关键词</div>
<img class="keywordimg animated zoomIn"  src="/public/userimg/{{userData.uid}}.png" onerror="this.src='/public/img/nopic.jpg';this.onerror=null" />

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