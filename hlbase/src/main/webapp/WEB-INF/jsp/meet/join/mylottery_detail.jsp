<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<title>奖品详情</title>

</head>

<body>

	<h3 class="ui-bar ui-bar-a ui-corner-all" style="text-align: center;">
		<p><c:choose>
			<c:when test="${userLottery.iswinner==0 }">
				您本次没有中奖，请再接再厉！
			</c:when>
			<c:otherwise>
				恭喜您中了${lottery.levelname } ${lottery.name }，别忘了联系工作人员领奖！
			</c:otherwise>
		</c:choose></p>
	</h3>

	<script type="text/javascript">
		document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
			WeixinJSBridge.call('hideOptionMenu');
		});
		$(function() {

		})
	</script>
</body>
</html>
	