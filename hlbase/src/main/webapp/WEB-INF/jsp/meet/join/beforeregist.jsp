<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>签到</title>

</head>

<body>
	<h4 class="ui-bar ui-bar-a ui-corner-all">
		<p>您可以通过本平台组织会议，并获得技术及推广的支持。在此之前我们需要对组会方的信息进行审核，您必须填写您的真实信息。</p>
	</h4>
	
	<form id="meet_add_form" action="${pageContext.request.contextPath}/meet/join/doregist" method="post" data-validator-option="{theme:'yellow_top_effect'}">
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
            <fieldset class="ui-grid-a">
                    <button  id="btn_sbumit" type="submit" class="ui-btn ui-corner-all ui-btn-a">立即签到</button>
            </fieldset>
        </li>
    </ul>
</form>
<script type="text/javascript">
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	WeixinJSBridge.call('hideOptionMenu');
	});
$(function(){
	/* $('checkbox-1a').bind('click',function(){
		if($(this).attr('checked')=='checked'){
			alert('checked')
			$('#btn_sbumit').removeAttr('disabled')
		}else{
			alert('unchecked')
			$('#btn_sbumit').attr('disabled','')
		}
	}) */
})
</script>
</body>
</html>
