<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>我的会议</title>

</head>

<body>
	<ul data-role="listview" data-filter="true" data-filter-placeholder="搜索会议" data-inset="true">
		<c:forEach items="${list }" var="meet">
			<li><a href="${pageContext.request.contextPath }/meet/join/mymeet/detail/${meet.id}"><fmt:formatDate value="${meet.begintime }" pattern="MM月dd日" /> ${meet.title }<br /><br />${meet.count }人报名 (<c:choose>
						<c:when test="${meet.state==0 }">未开始</c:when>
						<c:when test="${meet.state==1 }">进行中</c:when>
						<c:when test="${meet.state==2 }">已结束</c:when>
						<c:otherwise>未知</c:otherwise>
					</c:choose>)</a></li>
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
