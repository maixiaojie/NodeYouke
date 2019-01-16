<!-悠客 ->
<html>
<head>
    <meta data-vue-meta="true" data-vmid="keywords" name="keywords" content="悠客,麦晓杰,开发者专栏"/>
    <meta data-vue-meta="true" data-vmid="description" name="description" content="悠客是另外一个帮助开发者成长的社区，是给开发者用的 Hacker News，给设计师用的 Designer News，和给产品经理用的 Medium。悠客的技术文章由技术大牛和极客共同编辑为你筛选出最优质的干货，其中包括：Android、iOS、前端、后端等方面的内容。用户每天都可以在这里找到技术世界的头条内容。即使你是 GitHub、StackOverflow、开源中国的用户，我们相信你也可以在这里有所收获。"/>
    <meta name="author" content="麦晓杰 | maixiaojie.github.io" />
    <meta name="Copyright" content="Copyright (c) 2016-2019 yk.mcust.cn" />
    <title>{{data.article_title}} - 悠客专栏</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">    
    <link href="https://cdn.bootcss.com/github-markdown-css/2.10.0/github-markdown.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/public/css/common.css" />
    <link rel="stylesheet" href="/public/css/detail.css" />
    <link rel="stylesheet" href="/public/css/jqcloud.css" />
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        .article-img {
            max-width: 100%;
        }
        .detail {
            width: 960px;
        }
        .mini-player {
            width: 100%;
            height: 5.25rem;
            border: 1px solid #d9d9d9;
            background: #fafafa;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            padding: 1rem;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: horizontal;
            -webkit-box-direction: normal;
            -ms-flex-direction: row;
            flex-direction: row;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
            justify-content: space-between;
            margin: 1rem 0;
        }
        .mini-player .btn-pause, .mini-player .btn-play {
            width: 2.6875rem;
            height: 2.6875rem;
            background-repeat: no-repeat;
            background-position: 0 0;
            background-size: contain;
            text-decoration: none;
        }
        .mini-player .btn-play {
            background-image: url(data:image/png;base64,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);
        }
        .mini-player .btn-pause {
            background-image: url(data:image/png;base64,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);
        }
        .mini-player>a {
            border: none;
            -ms-flex-negative: 0;
            flex-shrink: 0;
        }
        .mini-player .audio-info {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-flex: 1;
            -ms-flex-positive: 1;
            flex-grow: 1;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
            margin-left: .6875rem;
            min-width: 0;
        }
        .mini-player .audio-info h3 {
            color: #353535;
            font-size: 15.25px;
            margin: 0;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .mini-player .audio-info p {
            margin: 0;
            margin-top: .125rem;
            font-size: 11px;
            line-height: 1rem;
        }
        .mini-player .audio-info p span {
            color: #888;
        }
        .mainBody audio {
            width: 100%;
            background-color: #eee;
        }
    </style>
</head>
<body>
    <nav class="main">
        <div class="container"><a href="/zl" title="悠客专栏 - 另外一个帮助开发者成长的社区" class="brand">悠客专栏 Lite</a> <span></span></div>
    </nav>
    <section class="mainBody">
        <section class="formBody">
            <div class="detail shadow">
                <div class="form-group">
                    <a href="/zl" title="悠客专栏 - 另外一个帮助开发者成长的社区" class="brand">悠客专栏</a> >
                    <a href="/al/{{zhuanlan.id}}" title="悠客专栏 - {{zhuanlan.title}}" class="brand">{{zhuanlan.title}}</a> >
                    文章详情
                </div>
                <div class="form-group">
                    <h1 class="article-title">{{data.article_title}}</h1>
                </div>
                <div class="form-group">
                    <span>阅读 {{data.view_number}}</span>
                </div>
                <div class="form-group">
                    <img src="{{data.article_cover}}" class="article-img">
                </div>
                {% if data.audio_download_url %}
                <div class="form-group">
                    <div class="mini-player">
                        <a href="javascript:;" id="audioControl" class="btn-play"></a>
                        <div class="audio-info">
                            <h3>{{data.article_title}}</h3>
                            <p><span>朗读人：XXX &nbsp;&nbsp;&nbsp;</span> <span>{{data.audio_time}} | {{data.audio_size}}b</span></p>
                        </div>
                        <audio title="{{data.article_title}}" id="audio" preload src="{{data.audio_download_url}}"></audio>
                    </div>
                </div>
                {% else %}
                {% endif %}
                <div class="form-group markdown-body">
                    {{data.mdhtml | safe}}
                </div>
                <div class="form-group">
                </div>
            </div>            
        </section>
    </section>
</body>
<script src="/public/js/common.js"></script>
<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/caret/1.0.0/jquery.caret.min.js"></script>
<script src="/public/js/js-cookies.js"></script>
<script>
$(document).ready(function() {
    $('#audioControl').on('click', function() {
        var audio = document.getElementById('audio'); 
        if(audio!==null){
            //检测播放是否已暂停.audio.paused 在播放器播放时返回false.
            //alert(audio.paused);
        }
        if(audio.paused){                 
            audio.play();//audio.play();// 这个就是播放  
            $('#audioControl').removeClass('btn-play').addClass('btn-pause');
        }else{
        audio.pause();// 这个就是暂停
        $('#audioControl').removeClass('btn-pause').addClass('btn-play');
        }
    })
})
</script>
</html>