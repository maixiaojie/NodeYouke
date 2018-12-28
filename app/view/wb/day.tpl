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
            {# background: url('/public/assets/1.png') no-repeat;
            background-size: cover; #}
            background-image: linear-gradient(44deg, #30CFD0 0%, #330867 100%);
            font-family: Arial,"PingFang SC","Hiragino Sans GB","Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;
        }
        .name { 
            margin-top: 12%;
        }
        .bottom {
            width: 100%;
            position: absolute;
            bottom: 0;
            height: 45%;
            background: url('/public/assets/山.png') no-repeat;
            background-size: 100% 100%;
            opacity: 0.9;
        }
        @media screen and (min-width: 780px) {
            body {
                width:400px;
                margin-left: calc(50% - 200px) !important;
                background-position: 50% 0;
                background-size: 400px 100%;
            }
        }
    </style>
</head>
<body>
<div style ='margin:0 auto;width:0px;height:0px;overflow:hidden; '>
<img src='/public/img/logo80.jpg'/>
</div>
{# <p class="img">
    <img src="{{userData.profile_image_url}}" />
</p> #}
<p class="name animated bounceInDown">嗨， @ {{userData.screen_name}}</p>
<p class="divide"></p>
<p class="ct animated bounceInDown">你在 {{userData.create_at }} 注册微博。 </p>
<p class="ct animated bounceInDown">今天是你在微博的第 {{userData.days}} 天。</p>
<p class="ct animated bounceInUp">这些时间很长，这些时间也很短。这些时间足够你失去所有，足够让你变得面目全非，让你身陷泥沼苦苦挣扎却不得挣脱；这些时间也足够你重拾希望，再度启程，塑造出一个更为勇敢，更为坚强的你。
</p>
<p class="ct animated bounceInUp">美好的一年又开始了，愿你有新的体验与收获!新的一年，新的开始!一切从心出发!
</p>
<p class="ct animated bounceInUp">2019，请继续努力！
</p>
<p class="ct animated bounceInUp" style="text-align: right;">-- by 某某某
</p>
{# <p class="content">今天是我在微博的第<span>{{userData.days}}</span>天</p>
<p class="content">我在<span class="small">{{userData.create_at }}</span>这个时候注册了微博，</p>
<p class="content">到现在为止，我关注了<span class="middle">{{userData.friends_count}}</span>人， 共有<span class="middle">{{userData.followers_count}}</span>人关注了我。</p> #}
{# <p class="keywords"><a href="/wbkeywords/{{userData.uid}}">点击获取我的微博关键词</a></p> #}
{# <p class="keywords"><a href="/wbdata/{{userData.uid}}">点击查看下一页</a></p> #}
<div class="bottom"></div>
<div class="nextcontainer">
    <a class="animated infinite pulse delay-2s" href="/wbdata/{{userData.uid}}"><img src="/public/assets/Path.png" />next</a>
</div>
{# <p class="intro">©flying工作室 pord by <a href="https://m.weibo.cn/u/2401890571">@丶aNva丨</a></p> #}
</body>
<script src="/public/js/common.js"></script>
<script>
</script>
</html>