<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE HTML>
<html>
<head>
<title>发布分级抽奖</title>

</head>

<body>
	<form:form id="form" action="${pageContext.request.contextPath}/meet/organize/lottery/doadd" method="post" commandName="p" data-validator-option="{theme:'yellow_top_effect'}">
		<ul data-role="listview" data-inset="true">
			<li class="ui-field-contain"><form:errors path="*" cssStyle="color:red"/></li>
			<li class="ui-field-contain"><label for="level" class="select">选择抽奖等级：</label> <select name="level" id="level">
					<option value="1">一等奖</option>
					<option value="2">二等奖</option>
					<option value="3">三等奖</option>
					<option value="4">四等奖</option>
			</select></li>
			<li class="ui-field-contain"><label for="name">奖品名称:</label> <input placeholder="必填,50个汉字以内" data-rule="required;length[1~100]" type="text" name="name" id="name" data-clear-btn="true" value="${lottery.name }"></li>
			<li class="ui-field-contain"><label for="count">奖品数量:</label> <input type="number" placeholder="奖品数量" data-rule="required;integer[+]" data-clear-btn="true" name="count" id="count" value="${lottery.count }"></li>

			<li class="ui-field-contain">
			<label for="begintime">开始时间:</label>
            <input type="text" name="begintime" id="begintime" data-rule="required;datetime" placeholder="(必填)开始时间" readonly="readonly" />
        </li>
        <li class="ui-field-contain">
        <label for="endtime">结束时间:</label>
         	<input type="text" name="endtime" id="endtime" data-rule="required;datetime" placeholder="(必填)结束时间" readonly="readonly" />
        </li>
        <li class="ui-body ui-body-b">
            <fieldset class="ui-grid-a">
            		<input type="hidden" name="meetid" value="${meet.id }">
                    <button type="submit" data-theme="e">发布抽奖</button>
            </fieldset>
        </li>
		</ul>
	</form:form>
<script type="text/javascript">
	function  checkfun(){
		/* var name = $('#name').val()
		if(name.trim()==''){
			alert('请输入奖品名称')
			return false
		}
		if(name.length>100){
			alert('奖品名称长度在100字符以内')
			return false
		} */
		if($('#count').val().match(/^\d+$/)==null){
			alert('奖品数量输入有误')
			return false
		}
		var btime = $('#begintime').val().trim();
		var etime = $('#endtime').val().trim();
		if(btime==''||etime==''){
			alert('请选择 开始/结束 时间')
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
	$(function(){
		$('#begintime').mobiscroll(opt);
		$('#endtime').mobiscroll(opt);
	})
</script>
</body>
</html>
