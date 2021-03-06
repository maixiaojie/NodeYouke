<!-悠客 ->
<html>
<head>     
    <meta name="google-site-verification" content="qlYVR3ZDCGo9wBezx5j03K5gkasYOLQ6isu9Bad-RAo" />   
    <meta http-equiv=Content-Language content=zh-cn>
    <meta data-vue-meta="true" data-vmid="keywords" name="keywords" content="悠客,麦晓杰,开发者,Vue.js,微信小程序,{{ helper.HomeArr2str(tags) }}"/>
    <meta data-vue-meta="true" data-vmid="description" name="description" content="悠客是另外一个帮助开发者成长的社区，是给开发者用的 Hacker News，给设计师用的 Designer News，和给产品经理用的 Medium。悠客的技术文章由技术大牛和极客共同编辑为你筛选出最优质的干货，其中包括：Android、iOS、前端、后端等方面的内容。用户每天都可以在这里找到技术世界的头条内容。即使你是 GitHub、StackOverflow、开源中国的用户，我们相信你也可以在这里有所收获。"/>
    <title>{{title}} - 另外一个帮助开发者成长的社区</title>
    <meta name="author" content="麦晓杰 | maixiaojie.github.io" />
    <meta name="Copyright" content="Copyright (c) 2016-2019 yk.mcust.cn" />
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/common.css" />
    <link rel="stylesheet" href="/public/css/home.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/css/swiper.min.css">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
    
    @media (max-width: 1080px) {
        .swiper-container {
            width: 100%;
            height: 200px;
        }
    }
    @media (max-width: 1080px){
        .body {
            padding: 0 0 25px 0 !important;
        }
    }
    @media (min-width: 1080px) {
        .swiper-container {
            width: 100%;
            height: 300px;
        }
    }
    .swiper-container img {
        min-width: 100%;
        max-width: 100%;
        height: 100%;
    }
    </style>
</head>
<body>
    <nav class="main">
        <div class="container">
            <a href="/" class="brand" title="悠客 - 另外一个帮助开发者成长的社区">悠客 Lite</a> <span></span>
            <ul class="menu">
                <li><a href="/zl" class="brand" title="悠客专栏">悠客专栏</a></li>
            </ul>
            <div class="login-info">
            {% if userinfo %}
                <div class="hasLogin">
                    <a href=""><i class="mr5 fa fa-user" aria-hidden="true"></i><span class="mr5">{{ userinfo.name }}</span><img src="{{userinfo.photo}}" /></a>
                    <a href="/add"><i class="mr5 fa fa-pencil-square-o" aria-hidden="true"></i>写文章</a>
                    <a href="/logout"><i class="mr5 fa fa-sign-out" aria-hidden="true"></i>退出</a>
                </div>
            {% else %}
                <div class="toLogin">
                    <a href="/passport/github"><i class="fa fa-github mr5"></i>登录</a>
                </div>
            {% endif %}
            <div>
        </div>
    </nav>
    <section class="body">        
        <section class="blocks">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="/zl" class="brand" title="悠客专栏"><img src="/public/banner/banner01.png"></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="/zl" class="brand" title="悠客专栏"><img src="/public/banner/banner02.png"></a>
                    </div>
                </div>
                <!-- 如果需要分页器 -->
                <div class="swiper-pagination"></div>
            </div>
            <div class="tags">
                {% for item in tags %}
                <span class="tag bg{{ helper.rd(1, 9) }}"><a href="/?keyword={{item.tag}}" title="{{item.tag}}">{{ item.tag }} <font>{{ item.count }} </font></a></span>
                {% endfor %}
            </div>
            <ul class="view">
                {% for item in list %}
                <li class="item">
                    <p>
                        <span ><a href="/user/{{item.uid}}" class="username" title="{{item.name}}">{{item.name}}</a></span><font class="afterDoit">•</font>
                        <span class="time">{{ helper.relativeTime(item.ctime) }}</span><font class="afterDoit">•</font>
                        <span>
                            {% set tagArr = helper.str2arr(item.tags) %}
                            {% for tag in tagArr %}
                                {% if loop.index == loop.length %}
                                    <a href="/?keyword={{tag}}" title="{{tag}}" class="taga">{{tag}}</a>
                                {% else %}
                                    <a href="/?keyword={{tag}}" title="{{tag}}" class="taga">{{tag}}</a><font class="afterDoit">/</font>
                                {% endif %}
                            {% endfor %}
                        </span>
                    </p>
                    <a class="artTitle" href="/detail/{{ item.id }}" title="{{ item.title }}">{{ item.title }}</a>
                </li>
                {% endfor %}
            </ul>
        </section>
    </section>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/js/swiper.min.js"></script>
<script src="/public/js/common.js"></script>
<script>        
  var mySwiper = new Swiper ('.swiper-container', {
    direction: 'horizontal', // 垂直切换选项
    loop: true, // 循环模式选项
    autoplay: true,
    
    // 如果需要分页器
    pagination: {
      el: '.swiper-pagination',
    }
  })        
  </script>
</html>