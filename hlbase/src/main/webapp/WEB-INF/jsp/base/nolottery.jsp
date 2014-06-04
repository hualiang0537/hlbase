<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<META HTTP-EQUIV="refresh" CONTENT="5">
<title>抽奖墙</title>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/wall/lottery/v6_common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/wall/lottery/v6_rich_year.css">
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.0.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/comet4j.js"></script>
</head>
<body>
	<div id="wrap_xinxitiao1" class="wrapbg">
		<div id="whole">
			<div id="header" class="clearfix">
				<div class="word-scroll left"></div>
			</div>
			<div id="container">
				<div class="con-inner scrollBox">
					<ul class="user-list" data-to="0" style="position: relative; display: block; -webkit-transform: translate(0, 0px);">
						<div id="choujiangziti">抽奖尚未开始，请等待！</div>

						<div id="jiazaidonghua_button">
							<img src="${pageContext.request.contextPath}/static/wall/lottery/加载动画_old.gif">
						</div>
				</div>
			</div>
		</div>
</body>
</html>
