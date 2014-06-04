<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h4 class="ui-bar ui-bar-a ui-corner-all">
	<table data-role="table" id="movie-table-custom" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th data-priority="1">开始时间</th>
				<th data-priority="2">结束时间</th>
				<th data-priority="3">状态</th>
				<th data-priority="4">报名</th>
				<th data-priority="5">签到</th>
				<th data-priority="6">通讯录</th>
				<!-- <th data-priority="7">抽奖</th> -->
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><fmt:formatDate value="${meet.begintime }" pattern="yyyy-MM-dd HH:mm" /></td>
				<td><fmt:formatDate value="${meet.endtime }" pattern="yyyy-MM-dd HH:mm" /></td>
				<td><c:choose>
						<c:when test="${meet.state==0 }">未开始</c:when>
						<c:when test="${meet.state==1 }">进行中</c:when>
						<c:otherwise>已结束</c:otherwise>
					</c:choose></td>
				<td>${meet.count }人</td>
				<td>${meet.registcount }人</td>
				<td>${meet.contactcount }人</td>
				<!-- <td>一个抽奖未开始</td> -->
			</tr>
		</tbody>
	</table>
</h4>
<fieldset class="ui-grid-a">
	<div class="ui-block-a">
		<a href="${pageContext.request.contextPath }/meet/organize/seeqr/${meet.id}" class="ui-btn ui-corner-all ui-btn-a">签到二维码</a>
	</div>
	<div class="ui-block-b">
		<a href="${pageContext.request.contextPath }/meet/organize/registwall/${meet.id}" class="ui-btn ui-corner-all ui-btn-a">签到墙</a>
	</div>
</fieldset>
<fieldset class="ui-grid-a">
	<div class="ui-block-a">
		<a class="ui-btn ui-corner-all ui-btn-a" href="${pageContext.request.contextPath }/meet/organize/lottery/${meet.id}">抽奖管理</a>
	</div>
	<div class="ui-block-b">
		<a href="${pageContext.request.contextPath }/meet/join/contacts?meetId=${meet.id}" class="ui-btn ui-corner-all ui-btn-a">通讯录</a>
	</div>
</fieldset>
<a href="${pageContext.request.contextPath }/meet/organize/modify/${meet.id}" class="ui-btn ui-shadow">修改会议</a>