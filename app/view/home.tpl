<html>
<head>
    <title>{{title}}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/common.css" />
    <link rel="stylesheet" href="/public/css/home.css" />
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
    <nav class="main">
        <div class="container"><a href="/" class="brand">悠客 Lite</a> <span></span>
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
            <div class="tags">
                {% for item in tags %}
                <span class="tag bg{{ helper.rd(1, 9) }}"><a href="/?keyword={{item.tag}}">{{ item.tag }} <font>{{ item.count }} </font></a></span>
                {% endfor %}
            </div>
            <ul class="view">
                {% for item in list %}
                <li class="item">
                    <p>
                        <span ><a href="/user/{{item.uid}}" class="username" href="">{{item.name}}</a></span><font class="afterDoit">•</font>
                        <span class="time">{{ helper.relativeTime(item.ctime) }}</span><font class="afterDoit">•</font>
                        <span>
                            {% set tagArr = helper.str2arr(item.tags) %}
                            {% for tag in tagArr %}
                                {% if loop.index == loop.length %}
                                    <a href="/?keyword={{tag}}" class="taga">{{tag}}</a>
                                {% else %}
                                    <a href="/?keyword={{tag}}" class="taga">{{tag}}</a><font class="afterDoit">/</font>
                                {% endif %}
                            {% endfor %}
                        </span>
                    </p>
                    <a class="artTitle" href="/detail/{{ item.id }}">{{ item.title }}</a>
                    {# <span class="time">({{ helper.relativeTime(item.ctime) }})</span> #}
                </li>
                {% endfor %}
            </ul>
        </section>
    </section>
</body>
<script src="/public/js/common.js"></script>
</html>