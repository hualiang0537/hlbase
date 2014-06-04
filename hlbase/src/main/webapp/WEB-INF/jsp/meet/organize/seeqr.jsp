<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>签到二维码</title>
<style type="text/css">
.test {
position: absolute;
left: 50%;
}
</style>
</head>

<body>
	<div  style="text-align: center;">
		<img src="${meet.qrimg }" width="260" height="260"/>
	</div>
	<h4 class="ui-bar ui-bar-a ui-corner-all">
		<p>长按图片将二维码保存到本机，即可用于印刷或投影</p>
	</h4>

	<script type="text/javascript">
		document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
			WeixinJSBridge.call('hideOptionMenu');
		});
		$(function() {

		})
	</script>
</body>
</html>
