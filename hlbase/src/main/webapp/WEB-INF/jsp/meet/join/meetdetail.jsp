<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${meet.title }</title>

</head>

<body>
	<h4 class="ui-bar ui-bar-a ui-corner-all">
		<table data-role="table" id="movie-table-custom" data-mode="reflow" class="movie-list ui-responsive">
			<thead>
				<tr>
					<th data-priority="1">开始时间</th>
					<th data-priority="1">结束时间</th>
					<th data-priority="2">地点</th>
					<th data-priority="3">会议介绍</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><fmt:formatDate value="${meet.begintime }" pattern="yyyy-MM-dd HH:mm" /></td>
					<td><fmt:formatDate value="${meet.endtime }" pattern="yyyy-MM-dd HH:mm" /></td>
					<td>${meet.address }</td>
					<td>${meet.content }</td>
				</tr>
			</tbody>
		</table>
	</h4>

	<!-- 报名人员 -->
	<ul data-role="listview" data-inset="true">
		<li data-role="list-divider" data-theme="e">报名人员 <span class="ui-li-count">${fn:length(list) }人已报名</span></li>
		<c:forEach items="${list }" var="user">
			<c:if test="${user.openid ==sessionScope.weixinapi_session_user.openid }">
				<c:set value="1" var="issign"></c:set>
			</c:if>
			<li>
				<h2>${user.username }&nbsp; ${user.mobilephone }</h2>
				<p>${user.companyname }&nbsp; ${user.post }</p>

			</li>
		</c:forEach>
	</ul>
	<c:choose>
		<c:when test="${issign!=null && issign==1}">
			<a href="#" class="ui-btn ui-btn-a ui-shadow ui-state-disabled">您已报名</a>
		</c:when>
		<c:otherwise>
			<a href="javascript:signfun()" data-theme="e" data-role="button">我要报名</a>
		</c:otherwise>
	</c:choose>
	<fieldset class="ui-grid-a">
		<div class="ui-block-a">
			<a href="javascript:pupopen()" data-theme="d" data-role="button">发送给朋友</a>
		</div>
		<div class="ui-block-b">
			<a href="javascript:pupopen()" data-theme="d" data-role="button">分享到朋友圈</a>
		</div>

	</fieldset>
	<a href="javascript:goadd()" data-theme="e" data-role="button">发起会议</a>
	<div onclick="pupclose()" id="bg">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/activity.css">
		<script type="text/javascript">
			function pupopen() {
				var e = $(document).scrollTop();
				$("#bg").css("top", e), document.getElementById("bg").style.display = "block"
			}
			function pupclose() {
				document.getElementById("bg").style.display = "none"
			}
			function goadd() {
				location.href = '${pageContext.request.contextPath}/meet/organize/add';
			}

			function signfun() {
				$.ajax({
					url : '${pageContext.request.contextPath}/meet/join/ajax/dosign',
					type : 'post',
					data : {
						meetId : '${meet.id}'
					},
					dataType : 'json',
					success : function(data) {
						//data = $.parseJSON(data)
						alert(data.msg)
						if (data.success) {
							location.reload(true)
						}
					}
				})

			}
		</script>
</body>
</html>
