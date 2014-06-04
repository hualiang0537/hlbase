<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>最新会议</title>

</head>

<body>
	<ul data-role="listview" data-filter="true" data-filter-placeholder="搜索会议" data-inset="true">
		<c:forEach items="${list }" var="meet">
			<li><a href="${pageContext.request.contextPath }/meet/join/latest/meetdetail/${meet.id}"><fmt:formatDate value="${meet.begintime }" pattern="MM月dd日" /> ${meet.title }<br /><br />${meet.count }人报名
				<!-- <span class="ui-li-count">立即报名</span> -->
			 </a></li>
		</c:forEach>
	</ul>
	<script type="text/javascript">
	</script>
</body>
</html>
