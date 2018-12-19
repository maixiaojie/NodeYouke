<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <title>{{title}}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=2941004611" type="text/javascript" charset="utf-8"></script>
    <style>
        html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }
        body {
            background: url('/public/img/5baf222d1499d.jpg') no-repeat;
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
{# <h2 class="title">查看你注册微博多少天了</h2> #}

<div class="btn WB_loginButton WB_widgets">
    <a href="https://api.weibo.com/oauth2/authorize?client_id=3873533066&response_type=code&redirect_uri=http://127.0.0.1:7001/wb">
        <img src="http://timg.sjs.sinajs.cn/t4/appstyle/widget/images/loginButton/loginButton_24.png">
    </a>
</div>
{# <p class="intro">©flying工作室 pord by <a href="https://m.weibo.cn/u/2401890571">@丶aNva丨</a></p> #}
</body>
<script src="/public/js/common.js"></script>
<script>
</script>
</html>