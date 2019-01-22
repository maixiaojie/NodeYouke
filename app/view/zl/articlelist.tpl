<!-悠客 ->
<html>
<head>     
    <meta name="google-site-verification" content="qlYVR3ZDCGo9wBezx5j03K5gkasYOLQ6isu9Bad-RAo" />   
    <meta http-equiv=Content-Language content=zh-cn>
    <meta data-vue-meta="true" data-vmid="keywords" name="keywords" content="悠客,麦晓杰,开发者,Vue.js,微信小程序"/>
    <meta data-vue-meta="true" data-vmid="description" name="description" content="悠客是另外一个帮助开发者成长的社区，是给开发者用的 Hacker News，给设计师用的 Designer News，和给产品经理用的 Medium。悠客的技术文章由技术大牛和极客共同编辑为你筛选出最优质的干货，其中包括：Android、iOS、前端、后端等方面的内容。用户每天都可以在这里找到技术世界的头条内容。即使你是 GitHub、StackOverflow、开源中国的用户，我们相信你也可以在这里有所收获。"/>
    <title>{{zl_info.title}} - 悠客专栏</title>
    <meta name="author" content="麦晓杰 | maixiaojie.github.io" />
    <meta name="Copyright" content="Copyright (c) 2016-2019 yk.mcust.cn" />
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/common.css" />
    <link rel="stylesheet" href="/public/css/home.css" />
    <link rel="stylesheet" href="/public/css/zl/home.css" />
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        .status {
            font-size: 16px;
        }
    </style>
</head>
<body>
    <nav class="main">
        <div class="container"><a href="/zl" class="brand" title="悠客 - 另外一个帮助开发者成长的社区">悠客专栏 Lite</a> <span></span>
            <div class="login-info">
            
            <div>
        </div>
    </nav>
    <section class="body">
        <section class="blocks">
            <div class="zl">
                <h2>{{zl_info.title}} <span class="status">({% if zl_info.status == 1 %}已完结 {% else %}同步更新中 {% endif %})</span></h2>
                <a style="display:none;" class="new" href="/newarticle/{{zl_info.id}}">new</a>
            </div>
            <ul class="article-list">
                {% for item in articles %}
                <li class="article">
                <a href="/zl/detail/{{item.id}}">
                    <h2 class="article-item-title">{{item.article_title}}</h2>
                    <div class="article-item-more">
                        <span class="article-item-more-text">阅读全文</span> <i class="fa fa-angle-right"></i>
                    </div>
                </a>
                </li>
                {% endfor %}
            </ul>
        </section>
    </section>
</body>
<script src="/public/js/common.js"></script>
</html>