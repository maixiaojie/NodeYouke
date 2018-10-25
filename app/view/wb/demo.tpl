<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <title>{{title}}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/common.css" />
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=2941004611" type="text/javascript" charset="utf-8"></script>
    <style>
        html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }
        body {
            background: url('/public/img/bg1.png') no-repeat;
            background-size: cover;
        }
        .title {
            text-align: center;
            color: rgb(205, 14, 97);
            padding-top: 50%;
            font-size: 1.7rem;
            font-family: '仿宋';
            font-weight: 600;
        }
        .btn {
            position: absolute;
            bottom: 10%;
            text-align: center;
            width: 100%;
        }
        .btn a {
            display: inline-block;
            padding: 5px 8px;
            width: 110px;
            text-align: center;
            background: #fef89c;
            border-radius: 8px;
            border: 1px solid #ff9aa7;
        }
        .intro {
            position: absolute;
            bottom: 5%;
            text-align: center;
            color: white;
            width: 100%;
        }
    </style>
</head>
<body>
<h2 class="title">查看你注册微博多少天了</h2>
<p class="btn"><a href="https://api.weibo.com/oauth2/authorize?client_id=3873533066&response_type=code&redirect_uri=http://127.0.0.1:7001/wb">微博授权查看</a></p>
<p class="intro">@麦晓杰NLP研究工作室出品</p>
</body>
<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="/public/js/js-cookies.js"></script>
<script>
</script>
</html>