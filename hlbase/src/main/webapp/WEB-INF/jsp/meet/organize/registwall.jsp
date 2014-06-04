<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>签到墙</title>

</head>

<body>
	<h4 class="ui-bar ui-bar-a ui-corner-all">请访问网页 ${baseweb }，搜索“${meet.title }”即可投影上墙！</h4>

	<ul data-role="listview" data-inset="true">
	<c:forEach items="${list }" var="user">
		<li><img src="${user.headimgurl }">
			<h2>欢迎${user.nickname }的到来！</h2></li>
	</c:forEach>
	</ul>
	<script type="text/javascript">
		$(function() {
			
		})
	</script>
</body>
</html>
