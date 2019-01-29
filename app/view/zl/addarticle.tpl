<html>
<head>
    <title>{{title}}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/common.css" />
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/github-markdown-css/2.10.0/github-markdown.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/tag-editor/1.0.20/jquery.tag-editor.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/public/css/markdown.css" />
    <link rel="stylesheet" href="/public/css/add.css" />
    <style>
    .formBody {
        margin-bottom: 150px;
    }
</style>
</head>
<body>
    <nav class="main">
        <div class="container"><a href="/zl" class="brand">悠客专栏 Lite</a> <span></span></div>
    </nav>
    <section class="formBody">
        <div class="form-group">
            <p>当前文章会收录到 《{{zl_info.title}}》专栏中。 </p>
        </div>
        <div class="form-group">
            <input type="hidden" id="pid" value="{{zl_info.id}}" class="" placeholder="" />
            <input type="text" id="article_title" class="input" placeholder="article_title" />
        </div>
        <div class="form-group">
            <input type="text" id="article_cover" class="input" placeholder="article_cover" />
        </div>
        <div class="form-group">
            <input type="text" id="audio_download_url" class="input" placeholder="audio_download_url" />
        </div>
        <div class="form-group">
            <input type="text" id="audio_url" class="input" placeholder="audio_url" />
        </div>
        <div class="form-group">
            <input type="text" id="audio_size" class="input" placeholder="audio_size" />
        </div>
        <div class="form-group">
            <input type="text" id="audio_time" class="input" placeholder="audio_time" />
        </div>
        
        <div class="form-group mdBody">
            <textarea name="field" style="display:none;" id="fieldTest" cols="30" rows="10"></textarea>
        </div>
        
    </section>
    <div class="form-group bottom">
        <button type="button" class="postBtn">发布</button>
    </div>
</body>
<script src="https://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/caret/1.0.0/jquery.caret.min.js"></script>
<script src="/public/js/js-cookies.js"></script>
<script src="/public/js/markdown.js"></script>
<script>
    $(document).ready(function() {
        var simplemde = new SimpleMDE({
            element: document.getElementById("fieldTest"),
            autoDownloadFontAwesome: false,
            status: false
        });
        $(".editor-preview").addClass("markdown-body");
        $(".editor-preview-side").addClass("markdown-body");
       
        $('.postBtn').on('click', function() {
            var text = simplemde.value();
            var form = {
                pid: $('#pid').val(),
                article_title: $('#article_title').val(),
                article_cover: $('#article_cover').val(),
                audio_download_url: $('#audio_download_url').val(),
                audio_url: $('#audio_url').val(),
                audio_size: $('#audio_size').val(),
                audio_time: $('#audio_time').val(),
                mdtext: text,
                mdhtml: simplemde.markdown(text)
            }
            console.log(form);
           var csrftoken = Cookies.get('csrfToken');

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
                url: '/zl/newarticle',
                method: 'POST',
                headers: {
                    "Content-Type": "application/json"
                },
                // 告诉jQuery不要去设置Content-Type请求头
                contentType: false,
                // 告诉jQuery不要去处理发送的数据
                processData: false,
                data: JSON.stringify(form),
                success: function(res) {
                    console.log(res)
                    if(res.success) {
                        window.location.href = "/al/"+form.pid+'/0';
                    }else {
                        alert('添加失败');
                    }
                }
            });
        });
    });
</script>
</html>