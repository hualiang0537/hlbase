<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${lottery.levelname } ${lottery.name } <c:choose>
		<c:when test="${lottery.state==0 }">未开始</c:when>
		<c:when test="${lottery.state==1 }">进行中</c:when>
		<c:otherwise>已结束</c:otherwise>
	</c:choose></title>

</head>

<body>
	<c:if test="${tip!=null && tip!='' }">
		<p style="color: red">${tip }</p>
	</c:if>
	<form action="${pageContext.request.contextPath}/meet/organize/lottery/doedit" method="post" data-validator-option="{theme:'yellow_top_effect'}">
		<ul data-role="listview" data-inset="true">
			<li class="ui-field-contain"><label for="level" class="select">选择抽奖等级：</label> <select name="level" id="level" <c:if test="${lottery.state!=0 }">disabled="disabled"</c:if>>
					<option value="1" <c:if test="${lottery.level==1 }">selected="selected"</c:if>>一等奖</option>
					<option value="2" <c:if test="${lottery.level==2 }">selected="selected"</c:if>>二等奖</option>
					<option value="3" <c:if test="${lottery.level==3 }">selected="selected"</c:if>>三等奖</option>
					<option value="4" <c:if test="${lottery.level==4 }">selected="selected"</c:if>>四等奖</option>
			</select></li>
			<li class="ui-field-contain"><label for="name">奖品名称:</label> <input data-rule="required;length[1~100]" <c:if test="${lottery.state!=0 }">disabled="disabled"</c:if> value="${lottery.name }" type="text" name="name" id="name" data-clear-btn="true"></li>
			<li class="ui-field-contain"><label for="count">奖品数量:</label> <input data-rule="required;integer[+]" <c:if test="${lottery.state!=0 }">disabled="disabled"</c:if> value="${lottery.count }" type="number" data-clear-btn="true" name="count" id="count"></li>

			<li class="ui-field-contain"><label for="begintime">开始时间:</label> <input <c:if test="${lottery.state!=0 }">disabled="disabled"</c:if> type="text" name="begintime" id="begintime"   placeholder="开始时间"  readonly="readonly" ></li>
			<li class="ui-field-contain"><label for="endtime">结束时间:</label> <input <c:if test="${lottery.state!=0 }">disabled="disabled"</c:if> type="text" name="endtime" id="endtime"  placeholder="结束时间"  readonly="readonly" ></li>
			<li class="ui-body ui-body-b">
				<fieldset class="ui-grid-a">
					<input type="hidden" name="id" value="${lottery.id }"> <input type="hidden" name="meetid" value="${lottery.meetid }">
					<c:choose>
						<c:when test="${lottery.state==0 }">
							<button type="submit" class="ui-btn ui-corner-all ui-btn-a">修改抽奖</button>
						</c:when>
						<c:when test="${lottery.state==1 }">
							<a href="#popupDialog" data-rel="popup" data-position-to="window" data-transition="pop" class="ui-btn ui-corner-all ui-btn-a">停止抽奖</a>
						</c:when>
						<c:otherwise>
							<a href="#" class="ui-btn ui-corner-all ui-btn-a ui-state-disabled">抽奖已结束</a>
						</c:otherwise>
					</c:choose>
					<div data-role="popup" id="popupDialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
						<div data-role="header" data-theme="a">
							<h1>停止抽奖?</h1>
						</div>
						<div role="main" class="ui-content">
							<h3 class="ui-title">确定要停止抽奖吗?</h3>
							<p>停止抽奖后，无法再继续抽奖.</p>
							<a href="javascript:confirmfun(${lottery.id })" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-a"  data-transition="flow">确定</a>
							<a href="#" id="btn-cancel" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-a" data-rel="back">取消</a> 
							
						</div>
					</div>
				</fieldset>
			</li>
		</ul>
	</form>

	<script type="text/javascript">
		document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
			WeixinJSBridge.call('hideOptionMenu');
		});
		function confirmfun(id){
			
			$.ajax({
				url:'${pageContext.request.contextPath}/meet/organize/ajax/lottery/stop/'+id,
				type:'POST',
				dataType:'json',
				cache:false,
				success:function(data){
					$('#btn-cancel').trigger('click')
					if(data.success){
						location.reload(true)
					}else{
						alert(data.msg)
					}
					
				},
				error:function (XMLHttpRequest, textStatus, errorThrown) {
				    alert('error:'+errorThrown)
				}
			})
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
			if('${lottery.begintime}'!=null && '${lottery.begintime}'!=''){
				var year = <fmt:formatDate value="${lottery.begintime }" pattern="yyyy"/>
				var month = <fmt:formatDate value="${lottery.begintime }" pattern="MM"/>
				var day = <fmt:formatDate value="${lottery.begintime }" pattern="dd"/>
				var HH = <fmt:formatDate value="${lottery.begintime }" pattern="HH"/>
				var mm = <fmt:formatDate value="${lottery.begintime }" pattern="mm"/>
				var ss = <fmt:formatDate value="${lottery.begintime }" pattern="ss"/>
				var dbtime = new Date(year,month-1,day,HH,mm,ss);
				 $('#begintime').scroller('setDate', dbtime, true);
			}
			if('${lottery.endtime}'!=null && '${lottery.endtime}'!=''){
				var year = <fmt:formatDate value="${lottery.endtime }" pattern="yyyy"/>
				var month = <fmt:formatDate value="${lottery.endtime }" pattern="MM"/>
				var day = <fmt:formatDate value="${lottery.endtime }" pattern="dd"/>
				var HH = <fmt:formatDate value="${lottery.endtime }" pattern="HH"/>
				var mm = <fmt:formatDate value="${lottery.endtime }" pattern="mm"/>
				var ss = <fmt:formatDate value="${lottery.endtime }" pattern="ss"/>
				var dbtime = new Date(year,month-1,day,HH,mm,ss);
				 $('#endtime').scroller('setDate', dbtime, true);
			}
		$(function() {

		})
	</script>
</body>
</html>
