<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${meet.title }</title>

</head>

<body>
	<h5 class="ui-bar ui-bar-a ui-corner-all">
		有${meet.contactcount }人添加了通讯录
		<c:if test="${isjoin!=1 }">，快来添加您的名片吧！ 添加您的名片才能查看别人的完整名片哦！
			<a href="${pageContext.request.contextPath}/meet/join/contacts/join" data-theme="e" data-role="button" data-icon="user">加入通讯录</a>
		</c:if>
	</h5>
	<ul data-role="listview" data-filter="true" data-filter-placeholder="搜索通讯录" data-inset="true">
		<c:forEach items="${list }" var="user">
			<li><a href="${pageContext.request.contextPath}/meet/join/contacts/detail/${user.id}"> <img src="${user.headimgurl }">
					<p><strong>${user.nickname }</strong><br /> ${user.companyname } ${user.post }<br />
						<c:if test="${isjoin==1 }">${user.mobilephone }</c:if>
					</p></a></li>
		</c:forEach>
	</ul>
</body>
</html>
