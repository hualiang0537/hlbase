<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${user.username }的微名片</title>

</head>

<body>
	<div id="ok">
		<img src="${pageContext.request.contextPath}/static/img/ok.png">
		<div id="ok_text"></div>
	</div>
	<div id='tishi'></div>
	<div id="main">
		
		<div id="vcard">
			<!-- <div class="bsc">
				<div class="wz">分享次数</div>
				<div class="sz">4</div>
			</div> -->
			<div class="top">
				<div class="touxiang" style="background:url('${user.headimgurl}') no-repeat;background-size:102%;"></div>
				<div class="xingming">${user.username}</div>
				<div class="job">
					<span class="gongsi">${user.city}</span> <span class="zhiwu">${user.country} ${user.province}</span>
				</div>
				<div class="tw"></div>
			</div>
			<div class="info">

				<div class="phone">
					<span>手机：</span><a href='tel:${user.mobilephone}'>${user.mobilephone}</a>
				</div>
				<div class="mail">
					<span>公司：</span>${user.companyname}
				</div>
				<div class="address">
					<span>职位：</span>${user.post}
				</div>
			</div>
		</div>
		<div class="anniu_green">
			<a href="javascript:pupopen();">
				<dl class="clearfix">
					<span class="white"> 分享 </span>
				</dl>
			</a>
		</div>
		<c:if test="${sessionScope.weixinapi_session_user.id!=user.id }">
		<div class="anniu_grey">
			<a href="${pageContext.request.contextPath}/meet/join/contacts/detail/${sessionScope.weixinapi_session_user.id}">
				<dl class="clearfix">
					<span class="black"> 查看我的名片 </span>
				</dl>
			</a>
		</div>
		</c:if>
		<!-- <div class="clearfix">
	<div class="text_left">
		<dl>
			<a style="color:#000" href="/index.php?g=Wap&m=Vcard&a=checkpwd&id=1765"><div style="width: 104px;margin:0px auto;text-align: center;">
					修改微名片
			</div></a>
		</dl>
	</div>
</div> -->
		<div class="clear"></div>
		<div id="bg" onclick="pupclose()"></div>
		<link href="${pageContext.request.contextPath}/static/css/contacts.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript">
			function tishi(e, t) {
				$("#tishi").css("top", t / 2 - $("#tishi").height() / 2), $("#tishi").css("left", e / 2 - $("#tishi").width() / 2), $("#ok").css("top", t / 2 - $("#ok").height() / 2 - 50), $("#ok").css("left", e / 2 - $("#ok").width() / 2)
			}
			function tanchutishi(e) {
				$("#tishi").html(e), $("#tishi").fadeIn(1500), setTimeout(function() {
					$("#tishi").fadeOut(1500)
				}, 1e3)
			}
			function tanchuok(e) {
				$("#ok_text").html(e), $("#ok").css("display", "block"), setTimeout(function() {
					$("#ok").css("display", "none")
				}, 1e3)
			}
			function pupopen() {
				var e = $(document).scrollTop();
				$("#bg").css("top", e), document.getElementById("bg").style.display = "block"
			}
			function pupclose() {
				document.getElementById("bg").style.display = "none"
			}
			function guan() {
				$(".tmbj").css("display", "none"), $(".pop").css("display", "none")
			}
			$(function() {
				var e = $(window).height(), t = $(window).width();
				tishi(t, e), $(window).resize(function() {
					e = $(window).height(), t = $(window).width(), tishi(t, e)
				});
			}), $(window).scroll(function() {
				var e = $(document).scrollTop();
				$("#bg").css("top", e)
			})
		</script>
		<link href="${pageContext.request.contextPath}/static/css/vcard.css" type="text/css" rel="stylesheet" />
		<%-- <script language="JavaScript" src="${pageContext.request.contextPath}/static/js/weixinfenxiang.js" type="text/javascript" charset="utf-8"></script> --%>
</body>
</html>
