<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${meet.title }</title>

</head>

<body>
	<h4 class="ui-bar ui-bar-a ui-corner-all">
		<p>
		《${meet.title }》发布成功！您可以在组会者><a href="${pageContext.request.contextPath }/meet/organize/mymeet">我的会议</a>中查看和操作！
		</p>
	</h4>
	<jsp:include page="opts.jsp"></jsp:include>

	<script type="text/javascript">
		document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
			WeixinJSBridge.call('hideOptionMenu');
			WeixinJSBridge.call('hideToolbar');
		});
		$(function() {

		})
	</script>
</body>
</html>
