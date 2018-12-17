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
            background:#fff;
        }
        .title {
            width:100%;
            height:6rem;
            background: #fe8100;
            color: white;
            text-align: center;
            font-size: 28px;
            line-height: 6rem;
            font-family: '苹方',Pingfang;
        }
        .name {
            width:100%;
            height:3rem;
            line-height:3rem;
            padding: 0;
            margin: 0;
            color: #333;
            font-weight: bold;
            font-size: 22px;
            font-family: '苹方',Pingfang;
            border-bottom: 1px solid #e7e7e7;
            margin-bottom: 10px;
            background: #f6f6f6;
            text-align: center;
        }
        .intro {
            text-align: center;
            width: 100%;
            color: #333;
        }
        .intro a {
            color: #333;
        }
        .keywordimg {
            width:100%;
        }
        .tips {
            text-align:center;
            color:#909090;
            font-size:12px;
        }

    </style>
</head>
<body>
<div class="title">新浪微博年度关键词</div>
<p class="name">@ {{userData.screen_name}}</p>
<img class="keywordimg" src="/public/wb/2401890571.png" />
<p class="tips">tips:长按可以保存到手机</p>
<p class="intro">©flying工作室 pord by <a href="https://m.weibo.cn/u/2401890571">@丶aNva丨</a></p>
</body>
<script src="/public/js/common.js"></script>
<script>
</script>
</html>