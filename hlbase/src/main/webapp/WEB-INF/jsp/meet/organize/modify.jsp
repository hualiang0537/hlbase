<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>修改会议</title>

</head>

<body>
	<c:choose>
		<c:when test="${meet.state!=0 }">
			<h4 class="ui-bar ui-bar-a ui-corner-all">
				<p>当前会议 <c:choose>
						<c:when test="${meet.state==1 }">进行中</c:when>
						<c:otherwise>已结束</c:otherwise>
					</c:choose>，无法进行修改！</p>
			</h4>
		</c:when>
		<c:otherwise>
			<form:form id="meet_add_form" action="${pageContext.request.contextPath}/meet/organize/domodify" method="post" commandName="meet">
				<ul data-role="listview" data-inset="true">
					<li class="ui-field-contain"><form:errors path="*" cssStyle="color:red" /></li>
					<li class="ui-field-contain"><label for="title">会议名称:</label> <input type="text" data-clear-btn="true" value="${meet.title }" name="title" id="title" placeholder="(必填)会议名称" data-clear-btn="true"></li>
					<li class="ui-field-contain"><label for="address">会议地点:</label> <input type="text" data-clear-btn="true" value="${meet.address }" name="address" id="address" placeholder="(必填)会议地点" data-clear-btn="true"></li>
					<li class="ui-field-contain"><label for="content">会议介绍:</label> <textarea cols="40" data-clear-btn="true" rows="8" name="content" id="content" placeholder="(选填)会议介绍">${meet.content }</textarea></li>
					<li class="ui-field-contain"><label for="begintime">开始时间:</label> <input type="text" name="begintime" id="begintime" readonly="readonly" placeholder="(必填)开始时间" /></li>
					<li class="ui-field-contain"><label for="endtime">结束时间:</label> <input type="text" name="endtime" id="endtime" readonly="readonly" placeholder="(必填)结束时间" /></li>
					<li class="ui-body ui-body-b">
						<fieldset class="ui-grid-a">
							<input type="hidden" name="id" value="${meet.id }"/>
							<button type="submit" class="ui-btn ui-corner-all ui-btn-a">修改会议</button>
						</fieldset>
					</li>
				</ul>
			</form:form>
			<script type="text/javascript">
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
				if('${meet.begintime}'!=null && '${meet.begintime}'!=''){
					var year = <fmt:formatDate value="${meet.begintime }" pattern="yyyy"/>
					var month = <fmt:formatDate value="${meet.begintime }" pattern="MM"/>
					var day = <fmt:formatDate value="${meet.begintime }" pattern="dd"/>
					var HH = <fmt:formatDate value="${meet.begintime }" pattern="HH"/>
					var mm = <fmt:formatDate value="${meet.begintime }" pattern="mm"/>
					var ss = <fmt:formatDate value="${meet.begintime }" pattern="ss"/>
					var dbtime = new Date(year,month-1,day,HH,mm,ss);
					 $('#begintime').scroller('setDate', dbtime, true);
				}
				if('${meet.endtime}'!=null && '${meet.endtime}'!=''){
					var year = <fmt:formatDate value="${meet.endtime }" pattern="yyyy"/>
					var month = <fmt:formatDate value="${meet.endtime }" pattern="MM"/>
					var day = <fmt:formatDate value="${meet.endtime }" pattern="dd"/>
					var HH = <fmt:formatDate value="${meet.endtime }" pattern="HH"/>
					var mm = <fmt:formatDate value="${meet.endtime }" pattern="mm"/>
					var ss = <fmt:formatDate value="${meet.endtime }" pattern="ss"/>
					var dbtime = new Date(year,month-1,day,HH,mm,ss);
					 $('#endtime').scroller('setDate', dbtime, true);
				}
				document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
					WeixinJSBridge.call('hideOptionMenu');
				});
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>
