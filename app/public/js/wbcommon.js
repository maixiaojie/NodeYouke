//新版统计代码获取 (百度统计)
var _hmt = _hmt || [];
(function () {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?277bc67b858f2366a16a915024a908ee";
  var s = document.getElementsByTagName("script")[0];
  s.parentNode.insertBefore(hm, s);
})();
window.onload = function () {
  var renderImg = function () {
    function DPR() {
      if (window.devicePixelRatio && window.devicePixelRatio > 1) {
        return window.devicePixelRatio;
      }
      return 1;
    }

    function parseValue(val) {
      return parseInt(val, 10);
    }
    var dom = document.body;
    var box = window.getComputedStyle(dom);
    var width = parseValue(box.width);
    var height = parseValue(box.height);
    var scaleBy = DPR()
    // 创建自定义 canvas 元素
    const canvas = document.createElement('canvas');
    canvas.width = width * scaleBy;
    canvas.height = height * scaleBy;
    // 设定 canvas css宽高为 DOM 节点宽高
    canvas.style.width = `${width}px`;
    canvas.style.height = `${height}px`;
    // 获取画笔
    const context = canvas.getContext('2d');

    // 将所有绘制内容放大像素比倍
    context.scale(scaleBy, scaleBy);
    var options = {
      backgroundColor: null,
      canvas,
      useCORS: true, // 【重要】开启跨域配置
      allowTaint: true, //允许跨域图片
    }
    html2canvas(dom, options).then(function (canvas) {
      var dataurl = canvas.toDataURL("png", 1.0);
      var img = document.createElement('img');
      img.src = dataurl;
      img.classList = 'saveimg';
      img.style.width = width + 'px';
      img.style.height = height + 'px';
      document.body.appendChild(img);
    });
  };
  setTimeout(function () {
    renderImg()
  }, 500)
}