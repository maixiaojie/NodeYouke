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
<div class="top" uid="{{userData.uid}}" status="{{splider_status}}"></div>
{% if splider_status == 3 %}
<p class="ct animated bounceInLeft">亲爱的 {{userData.screen_name}} , 您今年貌似没有发微博哦~</p>
<p class="ct animated bounceInRight">希望2019，每一天都开心∩﹏∩！</p>
{% elif ( splider_status == 4 or splider_status == 0 ) %}
    <div class='base'>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
        <div class='cube'></div>
    </div>
    <p class="ct animated bounceInDown" style="text-align:center;">数据正在处理中,请稍等...</p>
    <p class="ct animated bounceInDown" style="text-align:center;">此处时间可能较长，请耐心等待...</p>
{% else %}
    {% if wbcount == 0 %}
    <p class="ct animated bounceInLeft">
        <p class="ct animated bounceInLeft">亲爱的 {{userData.screen_name}} , 您今年貌似没有发微博哦~</p>
        <p class="ct animated bounceInRight">希望2019，每一天都开心∩﹏∩！</p>
    </p>
    {% else %}
    <p class="name animated bounceInLeft">在2018年</p>
    <p class="divide"></p>
    <p class="ct animated bounceInRight">你一共发布微博  {{data.count}} 条</p>
    <p class="ct animated bounceInLeft">累计字数共  {{data.wl}} 字</p>
    <p class="ct animated bounceInRight">其中，转发 {{data.rc}} 条</p>
    <p class="ct animated bounceInLeft" style="padding-left: 3em;">原创 {{data.ycc}} 条</p>
    <div class="nextcontainer">
        <a class="animated infinite pulse delay-2s" href="/wbdata2/{{userData.uid}}"><img src="/public/assets/Path.png" />next</a>
    </div>
    {% endif  %}
{% endif  %}

</body>
<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="/public/js/js-cookies.js"></script>
<script src="/public/js/common.js"></script>
<script>
var timer = null;
var i = 0;
var getStatus = function() {
    i++;
    if(i == 20) {
        clearInterval(timer);
        window.location.reload();
    }
    var csrftoken = Cookies.get('csrfToken');
    var uid = $('.top').attr('uid');
    //var uid = '11'
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
        url: '/wb/getStatus/'+uid,
        method: 'GET',
        headers: {
            "Content-Type": "application/json"
        },
        // 告诉jQuery不要去设置Content-Type请求头
        contentType: false,
        // 告诉jQuery不要去处理发送的数据
        processData: false,
        success: function(res) {
            if(res && res.success && res.data && res.data.length == 1) {
                
                var status = res.data[0].splider_status;
                if(status == 2 || status == 3) {
                    clearInterval(timer);
                    window.location.reload();
                }
            }
        }
    });
}
$(document).ready(function() {
   var splider_status = $('.top').attr('status');
   if(splider_status == 4 || splider_status == 0) {
       timer = setInterval(function() {
            getStatus()
        },  1500)
   }
    
    
})
</script>
</html>