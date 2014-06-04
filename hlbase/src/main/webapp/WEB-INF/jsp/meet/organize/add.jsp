<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>发布会议</title>

</head>

<body>
	<h4 class="ui-bar ui-bar-a ui-corner-all">
		<p>珊瑚移动为组会者提供完善的微信营销工具，创建会议后将自动提供该会议专用签到，抽奖，通讯录等功能，经过简单配置还能提供现场抽奖，微信上墙等互动活动！</p>
		<p>还将通过联席会的人脉资源为您带来更多的参会者，让您的会议更上一步台阶！</p>
	</h4>

	<form:form id="meet_add_form" action="${pageContext.request.contextPath}/meet/organize/doadd" method="post" commandName="meet" data-validator-option="{theme:'yellow_top_effect'}">
		<ul data-role="listview" data-inset="true">
			<li class="ui-field-contain"><form:errors path="*" cssStyle="color:red" /></li>
			<li class="ui-field-contain"><label for="title">会议名称:</label> <input type="text" data-clear-btn="true" value="${meet.title }" name="title" data-rule="required;length[1~100]" id="title" placeholder="(必填)会议名称" data-clear-btn="true"></li>
			<li class="ui-field-contain"><label for="address">会议地点:</label> <input type="text" data-clear-btn="true" value="${meet.address }" data-rule="required;length[1~200]" name="address" id="address" data placeholder="(必填)会议地点" data-clear-btn="true"></li>
			<li class="ui-field-contain"><label for="content">会议介绍:</label> <textarea cols="40" data-clear-btn="true" rows="8" name="content" id="content" data-rule="length[0~2000]" placeholder="(选填)会议介绍">${meet.content }</textarea></li>
			<li class="ui-field-contain"><label for="begintime">开始时间:</label> <input type="text" name="begintime" id="begintime" readonly="readonly" data-rule="required;datetime" placeholder="(必填)开始时间"  /></li>
			<li class="ui-field-contain"><label for="endtime">结束时间:</label> <input type="text" name="endtime" id="endtime" readonly="readonly" data-rule="required;datetime" placeholder="(必填)结束时间" /></li>
			<li class="ui-body ui-body-b">
				<fieldset class="ui-grid-a">
					<button type="submit" data-theme="e">发布会议</button>
				</fieldset>
			</li>
		</ul>
	</form:form>
	<script type="text/javascript">
		function  checkfun(){
			var btime = $('#begintime').val().trim();
			var etime = $('#endtime').val().trim();
			if(btime==''||etime==''){
				alert('请选择会议开始/结束时间')
				return false;
			}
			var byyyy = btime.substr(0,4);
			var bMM = btime.substr(5,2);
			var bdd = btime.substr(8,2)
			var bHH = btime.substr(11,2)
			var bmm = btime.substr(14,2)
			var bss = 0
			var b = new Date(byyyy,bMM,bdd,bHH,bmm,bss)
			var eyyyy = etime.substr(0,4);
			var eMM = etime.substr(5,2);
			var edd = etime.substr(8,2)
			var eHH = etime.substr(11,2)
			var emm = etime.substr(14,2)
			var ess = 0
			var e = new Date(eyyyy,eMM,edd,eHH,emm,ess)
			if(e<b){
				alert('结束时间必须大于开始时间')
				return false;
			}
			return true;
		}
		var opt = {
			preset : 'datetime', //日期
			theme : 'IOS', //皮肤样式
			display : 'modal', //显示方式 
			mode : 'Scroller', //日期选择模式
			dateFormat : 'yyyy-mm-dd', // 日期格式
			timeFormat : 'HH:ii',//时间格式
			dateOrder : 'yymmdd', //面板中日期排列格式
			lang : 'zh',
			endYear : 2020
		//结束年份
		};
		$('#begintime').mobiscroll(opt);
		$('#endtime').mobiscroll(opt);
	
		document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
			WeixinJSBridge.call('hideOptionMenu');
		});
	</script>
</body>
</html>
