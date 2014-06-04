<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE HTML>
<html>
<head>
<title>注册信息</title>

</head>

<body>
	<h4 class="ui-bar ui-bar-a ui-corner-all">
		<p>您可以通过本平台发布会议，为保护隐私，我们需要对您的基本信息进行审核。</p>
	</h4>
	
	<form:form id="meet_add_form" action="${pageContext.request.contextPath}/meet/organize/doregist" method="post" commandName="puser" data-validator-option="{theme:'yellow_top_effect'}">
    <ul data-role="listview" data-inset="true">
    	 <li class="ui-field-contain">
    	 	<form:errors path="*" cssStyle="color:red"></form:errors>
        </li>
        <li class="ui-field-contain">
        	<label for="username">姓名:</label>
            <input type="text" data-clear-btn="true" data-rule="required;length[1~20]" name="username" id="username" placeholder="(必填)姓名" data-clear-btn="true" value="${puser.username}">
        </li>
         <li class="ui-field-contain">
         	<label for="idnumber">身份证号:</label>
            <input type="tel" data-clear-btn="true" data-rule="required;ID_card" name="idnumber" id="idnumber" placeholder="(必填)身份证号" data-clear-btn="true" value="${puser.idnumber}">
        </li>
        <li class="ui-field-contain">
        	<label for="mobilephone">手机号:</label>
        <input type="tel" data-clear-btn="true" data-rule="required;mobile" name="mobilephone" id="mobilephone" placeholder="(必填)手机号" data-clear-btn="true" value="${puser.mobilephone}">
        </li>
        <li class="ui-field-contain">
        	<label for="companyname">公司名称:</label>
            <input type="text" data-clear-btn="true" data-rule="required;length[1~200]" name="companyname" id="companyname" placeholder="(必填)公司名称" data-clear-btn="true" value="${puser.companyname}">
        </li>
        <li class="ui-field-contain">
        	<label for="post">公司职位:</label>
         	<input type="text" data-clear-btn="true" data-rule="required;length[1~200]" name="post" id="post" placeholder="(必填)职位" data-clear-btn="true" value="${puser.post}">
        </li>
         <li class="ui-field-contain" id="li_last">
         	<input type="checkbox" name="checkbox-1a" id="checkbox-1a" checked="" onclick="this.checked=!this.checked">
   			<label for="checkbox-1a">我已阅读，并保证遵守国家相关法律法规，<a href="javascript:;">《联席会组织规程》</a>及<a href="javascript:;">《珊瑚移动微信营销免责条款》</a>。</label>
        </li>
        <li class="ui-body ui-body-b">
            <fieldset class="ui-grid-a">
                    <button  id="btn_sbumit" type="submit" class="ui-btn ui-corner-all ui-btn-a">提交</button>
            </fieldset>
        </li>
    </ul>
</form:form>

<script type="text/javascript">
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	WeixinJSBridge.call('hideOptionMenu');
	});
$(function(){
	/* $("#a_mianze").click(function(event) {
		$('#popupLogin').trigger('click')
		event.stopPropagation();
        $('#checkbox-1a').attr('checked','checked')
        
    }); */
})
</script>
</body>
</html>
