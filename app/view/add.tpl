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
</head>
<body>
    <nav class="main">
        <div class="container"><a href="/" class="brand">悠客 Lite</a> <span></span></div>
    </nav>
    <section class="formBody">
        <div class="form-group">
            <input type="text" id="title" class="input" placeholder="标题" />
        </div>
        <div class="form-group">
            <textarea  id="tags" style="display:none;" placeholder="标签：" ></textarea>
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
<script src="https://cdn.bootcss.com/tag-editor/1.0.20/jquery.tag-editor.min.js"></script>
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
        $('#tags').tagEditor({
            initialTags: [],
            maxLength: 20,
            placeholder: '请输入标签：'
        });
        $('.postBtn').on('click', function() {
            var text = simplemde.value();
            var form = {
                title: $('#title').val(),
                tags: $('#tags').tagEditor('getTags')[0].tags.join(','),
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
                url: '/newblog',
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
                        window.location.href = "/";
                    }else {
                        alert('添加失败');
                    }
                }
            });
        });
    });
</script>
</html>