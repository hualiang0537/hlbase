<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>修改我的名片</title>

</head>

<body>
	<form id="meet_add_form" action="${pageContext.request.contextPath}/meet/join/contacts/dojoin" method="post" data-validator-option="{theme:'yellow_top_effect'}">
		<ul data-role="listview" data-inset="true">
			<li class="ui-field-contain">
			<label for="username">姓名:</label>
			<input type="text" data-rule="required;length[1~20]" data-clear-btn="true" name="username" id="username" placeholder="(必填)姓名" data-clear-btn="true" value="${user.username}"></li>
			<li class="ui-field-contain">
			<label for="mobilephone">手机号:</label>
			<input type="tel" data-rule="required;mobile" data-clear-btn="true" name="mobilephone" id="mobilephone" placeholder="(必填)手机号" data-clear-btn="true" value="${user.mobilephone}"></li>
			<li class="ui-field-contain">
			<label for="companyname">公司名称:</label>
			<input type="text" data-rule="required;length[1~200]" data-clear-btn="true" name="companyname" id="companyname" placeholder="(必填)公司名称" data-clear-btn="true" value="${user.companyname}"></li>
			<li class="ui-field-contain">
			<label for="post">公司职位:</label>
			<input type="text" data-rule="required;length[1~200]" data-clear-btn="true" name="post" id="post" placeholder="(必填)职位" data-clear-btn="true" value="${user.post}"></li>
			<li class="ui-body ui-body-b">
				<!-- <fieldset class="ui-grid-a">
					<div class="ui-block-a">
						<a class="ui-btn ui-corner-all ui-btn-a" href="javascript:history.go(-1)">取消</a>
					</div>
					<div class="ui-block-b"> -->
						<button  id="btn_sbumit" type="submit" data-theme="e">立即加入通讯录</button>
					<!-- </div>
				</fieldset> -->
			</li>
		</ul>
	</form>
</body>
</html>
