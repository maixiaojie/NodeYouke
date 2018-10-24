<html>
<head>
    <title>{{data.title}} - 悠客 Lite</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">    
    <link href="https://cdn.bootcss.com/github-markdown-css/2.10.0/github-markdown.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/public/css/common.css" />
    <link rel="stylesheet" href="/public/css/detail.css" />
    <link rel="stylesheet" href="/public/css/jqcloud.css" />
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
    <nav class="main">
        <div class="container"><a href="/" class="brand">悠客 Lite</a> <span></span></div>
    </nav>
    <section class="mainBody">
        <section class="formBody">
            <div class="detail shadow">
                <div class="form-group flex">
                    <a class="author-img" href="/user/{{auth.id}}">
                        <img src="{{auth.avatar_url}}" />
                    </a>
                    <div class="author-infobox flex-item1">
                        <a href="/user/{{auth.id}}">{{ auth.name }}</a>
                        <p>{{ helper.toDate(data.ctime) }} <span>阅读 {{data.readcount}}</span></p>
                    </div>
                </div>
                <div class="form-group">
                    <h1 class="article-title">{{data.title}}</h1>
                </div>
                <div class="form-group">
                    <ul class="tags">
                        {% for item in helper.str2arr(data.tags) %}
                            <li class="tag"><a href="/?keywords={{item}}"><i class="mr5 fa fa-tag"></i>{{ item }}</a></li>
                        {% endfor %}
                    </ul>
                </div>
                <div class="form-group markdown-body">
                    {{data.mdhtml | safe}}
                </div>
                <div class="form-group">
                    <div class="word-cloud" id="word-cloud" style="width:100%; height:180px;border-top: 1px solid #eaecef;"></div>
                </div>
            </div>
            <div class="relative shadow" id="relatives" blog_id="{{data.id}}">
                <p class="r-title">推荐文章</p>
                <ul>
                    {% for item in similar %}
                    <li>
                        <a href="/detail/{{ item.id }}">
                            {{ item.title }}
                            {% if item.similar >= 0.8 %}
                                <i title="{{ item.similar}}" class="fire fire1 fa fa-fire"></i>
                            {% elif (item.similar < 0.8 and item.similar >= 0.5) %}
                                <i title="{{ item.similar }}" class="fire fire2 fa fa-fire"></i>
                            {% elif (item.similar < 0.5 and item.similar >= 0.3) %}
                                <i title="{{ item.similar }}" class="fire fire3 fa fa-fire"></i>
                            {% elif (item.similar < 0.3 and item.similar > 0) %}
                                <i title="{{ item.similar }}" class="fire fire4 fa fa-fire"></i>
                            {% else %}
                            {% endif %}
                            
                            <div class="bloginfo-container">
                            <span class="bloginfo"><i class="mr5 fa fa-eye"></i>{{item.readcount}}</span>
                            <span class="bloginfo"><i class="mr5 fa fa-star-o"></i>{{ helper.rd(4, 13) }}</span>
                            <span class="bloginfo"><i class="mr5 fa fa-thumbs-o-up"></i>{{ helper.rd(6, 20) }}</span>
                            <span class="bloginfo"><i class="mr5 fa fa-comment-o"></i>{{ helper.rd(1, 9) }}</span>
                            </div>
                        </a>
                        
                        {# <a class="userinfo" href="/user/{{ item.uid }}"><img src="{{item.avatar_url}}" />{{ item.name }}</a> #}
                    </li>
                    {% endfor %}
                </ul>
            </div>
        </section>
    </section>
    
</body>
<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/caret/1.0.0/jquery.caret.min.js"></script>
<script src="/public/js/js-cookies.js"></script>
<script src="/public/js/jqcloud.min.js"></script>
<script>
$(document).ready(function() {
    function wordCloud(word_array) {
        $('#word-cloud').jQCloud(word_array);
    }
    var csrftoken = Cookies.get('csrfToken');
    var blog_id = $('#relatives').attr('blog_id');
    function csrfSafeMethod(method) {
    // these HTTP methods do not require CSRF protection
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
    }
    $.ajaxSetup({
    beforeSend: function(xhr, settings) {
        if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
        xhr.setRequestHeader('x-csrf-token', csrftoken);
        }
    },
    });
    $.ajax({
        url: '/blogAnalysis/'+blog_id,
        method: 'GET',
        headers: {
            "Content-Type": "application/json"
        },
        // 告诉jQuery不要去设置Content-Type请求头
        contentType: false,
        // 告诉jQuery不要去处理发送的数据
        processData: false,
        success: function(res) {
            console.log(res)
            if(res.success && res.data != null) {
                try {
                    var keywords = JSON.parse(res.data.keyword).items;
                    var len = keywords.length;
                    if(len > 0) {
                        keywords.map(function(item) {
                            item.text = item.tag;
                            item.weight = item.score*100;
                            item.html = {title: item.score};
                            return item;
                        });
                        wordCloud(keywords);
                        $('#word-cloud').append('<span class="cloudTitle">人工智能自动分类标签结果：<span>');
                    }

                }catch(e) {
                    $('#word-cloud').hide();
                    console.log(e);
                }
            }else {
                $('#word-cloud').hide();
                console.log('无数据');
            }
        }
    });
})
</script>
</html>