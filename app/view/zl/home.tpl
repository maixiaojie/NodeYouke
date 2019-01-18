<!-悠客 ->
<html>
<head>     
    <meta name="google-site-verification" content="qlYVR3ZDCGo9wBezx5j03K5gkasYOLQ6isu9Bad-RAo" />   
    <meta http-equiv=Content-Language content=zh-cn>
    <meta data-vue-meta="true" data-vmid="keywords" name="keywords" content="悠客,麦晓杰,开发者,Vue.js,微信小程序"/>
    <meta data-vue-meta="true" data-vmid="description" name="description" content="悠客是另外一个帮助开发者成长的社区，是给开发者用的 Hacker News，给设计师用的 Designer News，和给产品经理用的 Medium。悠客的技术文章由技术大牛和极客共同编辑为你筛选出最优质的干货，其中包括：Android、iOS、前端、后端等方面的内容。用户每天都可以在这里找到技术世界的头条内容。即使你是 GitHub、StackOverflow、开源中国的用户，我们相信你也可以在这里有所收获。"/>
    <title>{{title}} - 另外一个帮助开发者成长的社区</title>
    <meta name="author" content="麦晓杰 | maixiaojie.github.io" />
    <meta name="Copyright" content="Copyright (c) 2016-2019 yk.mcust.cn" />
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/public/css/common.css" />
    <link rel="stylesheet" href="/public/css/home.css" />
    <link rel="stylesheet" href="/public/css/zl/home.css" />
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
     <style>
    #wrapper {
        height: 400px;
        width: 100%;
        position: relative;
        overflow: hidden;
        background: url(/public/img/xuexi.jpg) no-repeat;
        background-size: cover;
        background-position: center;      
        color: #ffffff82;
        font-size: 14px;
        text-shadow: 1px 1px #000;
    }
    .right {
      position: absolute;
      visibility: hidden;
      white-space: nowrap;
      /*left: 700px;*/
      transform: translateX(100%);
    }
    .left {
      position: absolute;
      white-space: nowrap;
      user-select: none;
      transition: transform 7s linear; /* 时间相同 越长的弹幕滑动距离越长 所以越快~ */
    }

  </style>
</head>
<body>
    <nav class="main">
        <div class="container"><a href="/zl" class="brand" title="悠客 - 另外一个帮助开发者成长的社区">悠客专栏 Lite</a> <span></span>
            <div class="login-info">
            <div>
        </div>
    </nav>
    <div id="wrapper">
    </div>
    <section class="body">
        <section class="blocks">
            <div class="zl">
                <h2>专栏</h2>
                <a class="new" href="/addzl">new</a>
            </div>
            <ul class="goods-list">
                {% for item in zl %}
                <li class="goods">
                    <div class="goods-img">
                        <img src="{{item.cover}}">
                    </div>
                    <div class="goods-info">
                        <h6>{{item.title}}</h6>
                        <p>状态：<span>{% if item.status == 1 %} 已完结 {% else %} 同步更新中 {% endif %} </span></p>
                    </div>
                    <div class="other-info">
                        <p>作者：{{item.author}}</p>
                        <p>{{item.intro}}</p>
                    </div>
                    <div class="btn-warpper">
                        <a class="btn" href="/al/{{item.id}}">开始学习<i class="ml5 fa fa-arrow-right"></i></a>
                    </div>
                </li>
                {% endfor %}
            </ul>
            <ul class="mb-goods-list">
                {% for item in zl %}
                <li>
                    <div class="mb-goods-img">
                        <img src="{{item.cover}}">
                    </div>
                    <div class="mb-goods-info">
                        <h6>{{item.title}}</h6>
                        <div class="operate">
                            <div class="other-info">
                                <p>作者：{{item.author}} |  状态：<span>{% if item.status == 1 %}已完结 {% else %}同步更新中 {% endif %}</span></p>
                                <p>{{item.intro}}</p>
                            </div>
                            <div class="btn-warpper">
                                <a class="btn" href="/al/{{item.id}}">开始学习<i class="ml5 fa fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </li>
                {% endfor %}
            </ul>
        </section>
    </section>
</body>
<script src="/public/js/common.js"></script>
<script>
/**
 * 设置 弹幕DOM池 每一个通道最多六条弹幕
**/

const MAX_DM_COUNT = 6;
const CHANNEL_COUNT = 10;

let domPool = [];
let danmuPool = [
  '前方大量弹幕来袭，请做好准备！', '2333333', '2333333', '2333333', '2333333', '2333333', 
  '好好学习， 天天向上。',  '2333333', '2333333', '2333333', '2333333', '2333333', '2333333',
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。', 
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。',
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。', 
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。', 
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。', 
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。', 
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。', 
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。', 
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。', 
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。',
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。',
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。',
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。',
  '好好学习， 天天向上。', '好好学习， 天天向上。', '好好学习， 天天向上。',
  '好好学习， 天天向上。'
];
let hasPosition = [];

/**
 * 做一下初始化工作
 */
function init() {
  let wrapper = document.getElementById('wrapper')
  // 先new一些span 重复利用这些DOM
  for (let j = 0; j < CHANNEL_COUNT; j++) {
    let doms = [];
    for (let i = 0; i < MAX_DM_COUNT; i++) {
      // 要全部放进wrapper
      let dom = document.createElement('span');
      wrapper.appendChild(dom);
      // 初始化dom的位置 通过设置className
      dom.className = 'right';
      // DOM的通道是固定的 所以设置好top就不需要再改变了
      dom.style.top = j * 20 + 'px';
      // 放入改通道的DOM池
      doms.push(dom);
      // 每次到transition结束的时候 就是弹幕划出屏幕了 将DOM位置重置 再放回DOM池
      dom.addEventListener('transitionend', () => {
        dom.className = 'right';
        // dom.style.transition = null;
        // dom.style.left = null;
        dom.style.transform = null;

        domPool[j].push(dom);
      });
    }
    domPool.push(doms);
  }
  // hasPosition 标记每个通道目前是否有位置
  for (let i = 0; i < CHANNEL_COUNT; i++) {
    hasPosition[i] = true;
  }
}

/**
 * 获取一个可以发射弹幕的通道 没有则返回-1
 */
function getChannel() {
  for (let i = 0; i < CHANNEL_COUNT; i++) {
    if (hasPosition[i] && domPool[i].length) return i;
  }
  return -1;
}

/**
 * 根据DOM和弹幕信息 发射弹幕
 */
function shootDanmu(dom, text, channel) {
  console.log('biu~ [' + text + ']');
  dom.innerText = text;
  // 如果为每个弹幕设置 transition 可以保证每个弹幕的速度相同 这里没有保证速度相同
  // dom.style.transition = `transform ${7 + dom.clientWidth / 100}s linear`;

  // dom.style.left = '-' + dom.clientWidth + 'px';
  // 设置弹幕的位置信息 性能优化 left -> transform
  dom.style.transform = `translateX(${-dom.clientWidth}px)`;
  dom.className = 'left';
  
  hasPosition[channel] = false;
  // 弹幕全部显示之后 才能开始下一条弹幕
  // 大概 dom.clientWidth * 10 的时间 该条弹幕就从右边全部划出到可见区域 再加1秒保证弹幕之间距离
  setTimeout(() => {
    hasPosition[channel] = true;
  }, dom.clientWidth * 10 + 1000);
}

window.onload = function() {

  init();
  // 每隔1ms从弹幕池里获取弹幕（如果有的话）并发射
  setInterval(() => {
    let channel;
    if (danmuPool.length && (channel = getChannel()) != -1) {
      let dom = domPool[channel].shift();
      let danmu = danmuPool.shift();
      shootDanmu(dom, danmu, channel);
    }
  }, 1);

}
 
</script>
</html>