<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<META HTTP-EQUIV="refresh" CONTENT="10">
<title>抽奖墙</title>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/wall/lottery/v6_common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/wall/lottery/v6_rich_year.css">
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.0.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/comet4j.js"></script>
</head>
<body>
	<div id="wrap_new" class="wrapbg">
		<div id="whole">
			<div id="header" class="clearfix">
				<a> <span class="logo-t left"><img class="logoScreenLeft" src="${pageContext.request.contextPath}/static/wall/lottery/logo.png" style="position: relative; width: 210px; height: 52px; left: 5px; top: 22px;"></span>
				</a>
				<div class="word-scroll left">
					<div class="clearfix">
						<div class="scrollbox left">
							<ul class="word-list wordList">
								<li class="themeBox" style="display: list-item;font-size:16px;margin-left:100px;line-height:24px;text-align:left;">还有<span style="color: red;font-size: 22px"><c:if test="${leftHour >0 }">${leftHour }小时</c:if>${leftMinute }分钟</span>抽奖开始，<br>大家快准备啦！<br />请先扫描下方二维码签到
								</li>
							</ul>
						</div>
					</div>
				</div>
				<span class="reserved right showIntroBtn"> <img src="${meet.qrimg}" style="max-width:126px;max-height:96px;">
				</span>
			</div>
			<div id="container">
				<div id="kaishichoujiangerweima_image">
					<img src="${meet.qrimg}">
				</div>
			</div>
		</div>
	</div>
</body>
</html>
