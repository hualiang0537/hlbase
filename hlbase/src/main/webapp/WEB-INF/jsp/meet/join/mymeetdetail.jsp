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
		<table data-role="table" id="movie-table-custom" data-mode="reflow" class="movie-list ui-responsive">
			<thead>
				<tr>
					<th data-priority="1">开始时间</th>
					<th data-priority="1">结束时间</th>
					<th data-priority="2">地点</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><fmt:formatDate value="${meet.begintime }" pattern="yyyy-MM-dd HH:mm" /></td>
					<td><fmt:formatDate value="${meet.endtime }" pattern="yyyy-MM-dd HH:mm" /></td>
					<td>${meet.address }</td>
				</tr>
			</tbody>
		</table>
	</h4>
	<c:if test="${usermeet.isregist==1 }">
		<a href="${pageContext.request.contextPath }/meet/join/mymeet/mylottery/${meet.id}" data-role="button" data-theme="c">我的奖品</a>
	</c:if>
	<a href="${pageContext.request.contextPath }/meet/join/contacts?meetId=${meet.id}" data-role="button" data-theme="d">查看通讯录</a>
	<script type="text/javascript">
	
	</script>
</body>
</html>
