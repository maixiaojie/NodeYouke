<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <meta data-vue-meta="true" data-vmid="keywords" name="keywords" content="微博关键词,2018,微博词云"/>
    <meta data-vue-meta="true" data-vmid="description" name="description" content="{{userData.screen_name}}的2018微博词云"/>
    <meta name="author" content="麦晓杰 | maixiaojie.github.io" />
    <meta name="Copyright" content="Copyright (c) 2016-2019 yk.mcust.cn" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="{{userData.screen_name}}的2018微博词云">
    <meta property="og:description" content="{{userData.screen_name}}的2018微博词云,更多内容请访问http:/yk.mcust.cn">
    <meta property="og:image" content="http:/yk.mcust.cn/public/img/logo80.jpg">
    <meta property="og:url" content="http:/yk.mcust.cn/wb">
    <title>{{userData.screen_name}}的2018微博词云</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/wbcommon.css" />
    <link rel="stylesheet" href="/public/css/animate.css" />
    <style>
        body {
            background: url('/public/assets/2.png') no-repeat;
            background-size: cover;
            {# background-image: linear-gradient(44deg, #F46287, #011CC5); #}
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
<div style ='margin:0 auto;width:0px;height:0px;overflow:hidden; '>
    <img src='/public/img/logo80.jpg'/>
</div>
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
    <div class="nextcontainer" data-html2canvas-ignore="true">
        <a class="animated infinite pulse delay-2s" href="/wbdata2/{{userData.uid}}"><img src="/public/assets/Path.png" />next</a>
    </div>
    <div class="lb">
        <img src="/public/img/lb.png">
        <p data-html2canvas-ignore="true">Tips:长按图片可以保存</p>
    </div>
    <div class="titleLogo">
        <img src="/public/img/title.png">
    </div>
    {% endif  %}
{% endif  %}

</body>
<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="/public/js/js-cookies.js"></script>
{# <script src="https://cdn.bootcss.com/vConsole/3.2.0/vconsole.min.js"></script> #}
{# <script src="https://cdn.bootcss.com/html2canvas/0.5.0-beta3/html2canvas.min.js"></script> #}
<script src="https://cdn.bootcss.com/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>
{# <script src="https://cdn.bootcss.com/html2canvas/0.5.0-alpha2/html2canvas.js"></script> #}
{# <script src="https://cdn.bootcss.com/html2canvas/0.5.0-alpha1/html2canvas.min.js"></script> #}
<script src="/public/js/wbcommon.js"></script>
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
    //var vConsole = new VConsole();
    var splider_status = $('.top').attr('status');
    if(splider_status == 4 || splider_status == 0) {
       timer = setInterval(function() {
            getStatus()
        },  1500)
    }  
})
</script>
</html>