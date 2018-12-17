<!-悠客 ->
<html>
<head>
    <title>news</title>
    <link rel="stylesheet" href="/public/css/news.css" />
</head>
<body>
    <ul class="news-view view">
        {% for item in list %}
        <li class="item">
            <a href="{{ item.id }}">{{ item.title }}</a>
            <span class="time">({{ helper.relativeTime(item.create_at) }})</span>
        </li>
        {% endfor %}
    </ul>
</body>
<script src="/public/js/common.js"></script>
</html>