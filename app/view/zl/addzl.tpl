<html>
<head>
    <title>{{title}}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/common.css" />
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/tag-editor/1.0.20/jquery.tag-editor.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/public/css/add.css" />
</head>
<body>
    <nav class="main">
        <div class="container"><a href="/zl" class="brand">悠客专栏 Lite</a> <span></span></div>
    </nav>
    <section class="formBody">
        <div class="form-group">
            <input type="text" id="title" class="input" placeholder="专栏标题" />
        </div>
        <div class="form-group">
            <input type="text" id="author" class="input" placeholder="专栏作者" />
        </div>
        <div class="form-group">
            <input type="text" id="cover" class="input" placeholder="封面图片地址" />
        </div>
        <div class="form-group">
            <input type="text" id="intro" class="input" placeholder="摘要" />
        </div>
        <div class="form-group">
            是否已更新完：
            <label>是<input type="radio" name="isfineshed" checked value="1" id="" class="" placeholder="" /></label>
            <label>否<input type="radio" name="isfineshed" id="0" class="" placeholder="" /></label>
        </div>
        <div class="form-group">
            <textarea  id="tags" style="display:none;" placeholder="标签：" ></textarea>
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
<script>
    $(document).ready(function() {
        $('#tags').tagEditor({
            initialTags: [],
            maxLength: 20,
            placeholder: '请输入标签：'
        });
        $('.postBtn').on('click', function() {
            var form = {
                title: $('#title').val(),
                author: $('#author').val(),
                cover: $('#cover').val(),
                intro: $('#intro').val(),
                status: $('input[name="isfineshed"]').val(),
                tags: $('#tags').tagEditor('getTags')[0].tags.join(',')
            }
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
                url: '/zl/newzl',
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
                        window.location.href = "/zl";
                    }else {
                        alert('添加失败');
                    }
                }
            });
        });
    });
</script>
</html>