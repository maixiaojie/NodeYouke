<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <title>{{title}}</title>
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
            width:100%;
            font-family: PingFangSC-Regular;
            font-size: 22px;
            color: #FFFFFF;
            text-align: center;
            height:6rem;
            margin-top: 9%;
            {# background: #fe8100; #}
            {# background:#00D0CF; #}
            line-height: 6rem;
        }
        .keywordimg {
            width: calc(90% - 56px);
            margin: 5%;
            padding: 28px;
            background: rgba(255, 255, 255, 0.5);
            margin-top: 0;
        }
        .tips {
            text-align:center;
            color:#fff;
            font-size:12px;
            {# background:#fff; #}
            margin: 0;
            padding: 10px 0;
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
<div class="title animated bounceIn">2018，你的微博关键词</div>
<img class="keywordimg animated zoomIn" src="/public/wb/2401890571.png" />
<p class="tips">tips:长按可以保存到手机</p>
</body>
<script src="/public/js/common.js"></script>
<script>
</script>
</html>