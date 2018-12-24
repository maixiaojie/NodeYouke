<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <title>{{title}}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/wbcommon.css" />
    <link rel="stylesheet" href="/public/css/animate.css" />
    <style>
        body {
            {# background: url('/public/assets/2.png') no-repeat;
            background-size: cover; #}
            background-image: linear-gradient(44deg, #F46287 0%, #011CC5 100%);
            
            font-family: Arial,"PingFang SC","Hiragino Sans GB","Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;
        }
        .top {
            width: 86%;
            margin: 20px 7%;
            height: 45%;
            background: url(/public/assets/天.png) no-repeat;
            background-size: 100% 100%;
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
<div class="top"></div>
<p class="name animated bounceInLeft">在2018年</p>
<p class="divide"></p>
<p class="ct animated bounceInRight">你一共发布微博  {{data.count}} 条</p>
<p class="ct animated bounceInLeft">其中，转发 {{data.rc}} 条</p>
<p class="ct animated bounceInRight" style="padding-left: 3em;">原创 {{data.ycc}} 条</p>
<div class="nextcontainer">
    <a class="animated infinite pulse delay-2s" href="/wbdata2/{{userData.uid}}"><img src="/public/assets/Path.png" />next</a>
</div>
</body>
<script src="/public/js/common.js"></script>
<script>
</script>
</html>