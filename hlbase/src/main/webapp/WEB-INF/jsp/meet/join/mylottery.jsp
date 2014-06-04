<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<title>我的抽奖</title>

</head>

<body>

	<ul data-role="listview" data-inset="true">
		<li data-role="list-divider" data-theme="e">我的抽奖 <span class="ui-li-count">${fn:length(list) }</span></li>
		<c:forEach items="${list }" var="lottery">
			<li><a href="${pageContext.request.contextPath }/meet/join/mymeet/mylottery/detail/${lottery.id}">
					<h2>${lottery.levelname }${lottery.name }</h2>
					<p>
						<strong><c:choose>
								<c:when test="${lottery.state==0 }">未开始</c:when>
								<c:when test="${lottery.state==1 }">进行中</c:when>
								<c:otherwise>已结束</c:otherwise>
							</c:choose></strong>
					</p>
					<p>
						<fmt:formatDate value="${lottery.begintime }" pattern="yyyy-MM-dd HH:mm" />
						~
						<fmt:formatDate value="${lottery.endtime }" pattern="yyyy-MM-dd HH:mm" />
					</p>

			</a></li>
		</c:forEach>
	</ul>

	<script type="text/javascript">
		document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
			WeixinJSBridge.call('hideOptionMenu');
		});
		$(function() {

		})
	</script>
</body>
</html>
