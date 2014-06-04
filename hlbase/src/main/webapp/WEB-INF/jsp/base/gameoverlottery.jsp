<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<title>抽奖墙</title>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/wall/lottery/v6_common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/wall/lottery/v6_rich_year.css">
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.0.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/comet4j.js"></script>
</head>
<body>
	<div id="wrap" class="wrapbg">
		<div id="whole">
			<div id="header" class="clearfix">
				<a> <span class="logo-t left"><img class="logoScreenLeft" src="${pageContext.request.contextPath}/static/wall/lottery/logo.png" style="position: relative; width: 210px; height: 52px; left: 5px; top: 22px;"></span>
				</a>
				<div class="word-scroll left">
					<div class="clearfix">
						<div class="scrollbox left">
							<ul class="word-list wordList">
								<li class="themeBox" style="display: list-item;font-size:26px;text-align:left;margin-left:120px;color:red">${lottery.levelname }：${lottery.name }<br>中奖名单
								</li>

							</ul>
						</div>
					</div>
				</div>
				<span class="reserved right showIntroBtn"> <img src="${meet.qrimg }" style="max-width:126px;max-height:96px;">
				</span>
			</div>
			<div id="container">
				<div class="con-inner scrollBox" <c:if test="${fn:length(users)>3 }">style="height:420px;overflow-y:scroll"</c:if>>
					<ul class="user-list" data-to="0" style="position: relative; display: block; -webkit-transform: translate(0, 0px);margin-bottom:-10px;line-height:65px;">
						<c:forEach items="${users }" var="user">
							<li class="clearfix t-row">
								<div class="userimg left">
									<i class="elem"></i> <span class="elem2"></span> <a href="javascript:void(0);" class="head"> <img class="msgAvatar" src="${user.headimgurl }" width="60" height="60" alt=""></a>
								</div>
								<div class="cont-box left">
									<p class="c-word">
										<a href="javascript:void(0);" class="user-name msgUserName" style="color:white">${user.nickname }</a> <span style="float:right;color:#ffcc66;font-size:32px;margin-right:60px">${lottery.name }</span>
									</p>
								</div>
								<div class="btn-detail messageDetailBtn" style="display: none;">
									<div class="btn-style">
										<a href="javascript:void(0);" class="icon-arrow"></a>
									</div>
								</div>
							</li>
						</c:forEach>
				</div>
				<div style="width: 400px;height: 150px;;position: absolute;top: 80%">
					<a href="javascript:fs()"><div class="mar-right div_fullscreen">全屏播放</div></a>
					<c:if test="${nextLottery!=null }">
						<a href="${pageContext.request.contextPath}/base/web/lotterywall/${meet.id}/${nextLottery.id}"><div class="mar-right div_next">下一抽奖</div></a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function fs() {
			var docElm = document.documentElement;
            if (docElm.requestFullscreen) {
                docElm.requestFullscreen();
            }
            else if (docElm.msRequestFullscreen) {
                docElm.msRequestFullscreen();
            }
            else if (docElm.mozRequestFullScreen) {
                docElm.mozRequestFullScreen();
            }
            else if (docElm.webkitRequestFullScreen) {
                docElm.webkitRequestFullScreen();
            }
		}
	</script>
</body>
</html>
