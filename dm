<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="apple-touch-icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' width='180' height='180'><circle cx='90' cy='90' r='82' fill='%2328a745'/><text x='90' y='102' font-size='80' font-family='SimHei,sans-serif' fill='white' text-anchor='middle'>码</text></svg>"/>
<title>二维码生成器</title>
<style>
*{box-sizing:border-box;font-family:system-ui,sans-serif;}
body{max-width:520px;margin:24px auto;padding:20px;background:#f7f7f7;}
h1{text-align:center;color:#222;font-size:24px;}
textarea{width:100%;padding:12px;font-size:16px;border:1px solid #ccc;border-radius:8px;height:110px;margin:10px 0;}
button{background-color:#28a745;color:white;border:none;padding:12px 22px;border-radius:8px;font-size:17px;margin:6px;cursor:pointer;}
button:hover{background-color:#218838;}
#qrcode{text-align:center;margin-top:24px;}
</style>
</head>
<body>
<h1>二维码生成器</h1>
<textarea id="textInput" placeholder="在这里输入文字、链接……"></textarea>
<br>
<button onclick="createQR()">生成二维码</button>
<button onclick="downloadQR()">保存图片</button>
<div id="qrcode"></div>

<script>
// 简易二维码（纯前端）
function createQR(){
  const val = document.getElementById("textInput").value;
  const box = document.getElementById("qrcode");
  if(!val.trim()){
    box.innerHTML = "<p>请输入内容</p>";
    return;
  }
  // 使用在线生成接口渲染，可直接出图
  box.innerHTML = `<img id="qrImg" src="https://api.qrserver.com/v1/create-qr-code/?size=240x240&data=${encodeURIComponent(val)}" alt="二维码"/>`;
}

function downloadQR(){
  const img = document.getElementById("qrImg");
  if(!img) return;
  const link = document.createElement("a");
  link.href = img.src;
  link.download = "qrcode.png";
  link.click();
}
</script>
</body>
</html>
