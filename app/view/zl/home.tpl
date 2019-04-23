<!-悠客 ->
<html>
<head>     
    <meta name="google-site-verification" content="qlYVR3ZDCGo9wBezx5j03K5gkasYOLQ6isu9Bad-RAo" />   
    <meta http-equiv=Content-Language content=zh-cn>
    <meta data-vue-meta="true" data-vmid="keywords" name="keywords" content="悠客,麦晓杰,开发者,Vue.js,悠客专栏"/>
    <meta data-vue-meta="true" data-vmid="description" name="description" content="悠客专栏，价值上千元的学习大礼包，免费在线学习。"/>
    <title>{{title}} - 另外一个帮助开发者成长的社区</title>
    <meta name="author" content="麦晓杰 | maixiaojie.github.io" />
    <meta name="Copyright" content="Copyright (c) 2016-2019 yk.mcust.cn" />
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/common.css" />
    <link rel="stylesheet" href="/public/css/home.css" />
    <link rel="stylesheet" href="/public/css/zl/home.css" />
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
    </style>
</head>
<body>
    <nav class="main">
        <div class="container"><a href="/zl" class="brand" title="悠客 - 另外一个帮助开发者成长的社区">悠客专栏 Lite</a> <span></span>
            <a href="/" target="_blank" class="brand" style="font-size: 18px;color: #666;margin-left: 20px;" title="悠客 - 另外一个帮助开发者成长的社区">悠客 Lite</a>
            <a href="https://blog.mcust.cn/" target="_blank" class="brand" style="font-size: 18px;color: #666;margin-left: 20px;" title="麦晓杰的博客">博客</a>
<div class="login-info">
            <div>
        </div>
    </nav>
    <section class="body">
        <section class="blocks">
            <div class="zl">
                <h2>专栏</h2>
                <a style="display:none;" class="new" href="/addzl">new</a>
            </div>
            <ul class="goods-list">
                <p style="color: #ec4d17;font-weight: bold;font-size: 26px;">微信小程序“悠客社区”已经上线，同步更新更多精彩的内容，请多多关注！</p>
                <p style="color: #ec4d17;font-weight: bold;">别忘记收藏！！每天进步一点点，人生将迈进一大步！</p>
                <p style="color: #ec4d17;font-weight: bold;">有任何的意见建议，都可以去博客或者github联系我哟！</p>
                {% for item in zl %}
                <li class="goods">
                    <div class="goods-img">
                        <img src="{{item.cover}}">
                    </div>
                    <div class="goods-info">
                        <h6>{{item.title}}</h6>
                        <p>状态：<span>{% if item.status == 1 %} 已完结 {% else %} 同步更新中 {% endif %} </span></p>
                    </div>
                    <div class="other-info">
                        <p>作者：{{item.author}}</p>
                        <p>{{item.intro}}</p>
                    </div>
                    <div class="btn-warpper">
                        <a class="btn" href="/al/{{item.id}}/0">开始学习<i class="ml5 fa fa-arrow-right"></i></a>
                    </div>
                </li>
                {% endfor %}
            </ul>
            <ul class="mb-goods-list">
                <p style="color: #ec4d17;font-weight: bold;font-size: 26px;">微信小程序“悠客社区”已经上线，同步更新更多精彩的内容，请多多关注！</p>
                <p style="color: #ec4d17;font-weight: bold;">别忘记收藏！！每天进步一点点，人生将迈进一大步！</p>
                <p style="color: #ec4d17;font-weight: bold;">有任何的意见建议，都可以去博客或者github联系我哟！</p>
                {% for item in zl %}
                <li>
                    <div class="mb-goods-img">
                        <img src="{{item.cover}}">
                    </div>
                    <div class="mb-goods-info">
                        <h6>{{item.title}}</h6>
                        <div class="operate">
                            <div class="other-info">
                                <p>作者：{{item.author}} |  状态：<span>{% if item.status == 1 %}已完结 {% else %}同步更新中 {% endif %}</span></p>
                                <p>{{item.intro}}</p>
                            </div>
                            <div class="btn-warpper">
                                <a class="btn" href="/al/{{item.id}}/0">开始学习<i class="ml5 fa fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </li>
                {% endfor %}
            </ul>
        </section>
    </section>
</body>
<script src="/public/js/common.js"></script>

</html>