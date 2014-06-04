<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<title>互动墙</title>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/wall/talk/v6_common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/wall/talk/v6_rich_year.css">
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.0.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/comet4j.js"></script>
</head>
<body onload="init()">
	<div id="wrap" class="wrapbg">
		<div id="whole">
			<div id="header" class="clearfix">
				<a> <span class="logo-t left"><img class="logoScreenLeft" src="${pageContext.request.contextPath}/static/wall/talk/logo.png" style="position: relative; width: 210px; height: 52px; left: 5px; top: 22px;"></span>
				</a>
				<div class="word-scroll left">
					<div class="clearfix">
						<div class="scrollbox left">
							<ul class="word-list wordList">
								<li class="themeBox" style="display: list-item;">微信号：联席会<br>关注签到后发送内容即可上墙
								</li>
							</ul>
							<ul class="word-list checkinWordList" style="visibility:hidden;margin-top: -96px;">
								<li class="themeBox" style="display: list-item;">6628创友会全世界会员时刻都在前进！</li>

								<li class="themeBox" style="display: none;">关注微信号：club6628<br>发送含有“签到”两字的内容即可签到
								</li>
							</ul>
						</div>
						<div class="num-t left">
							<p>
								<em class="messageTotal" id="msgTotal" style="color:red;margin-top:5px;font-size:32px">${count }</em>
							</p>
						</div>
					</div>
				</div>
				<span class="reserved right showIntroBtn"> <img src="${meet.qrimg }" style="max-width:126px;max-height:96px;">
				</span>
			</div>
			<div id="container">
				<div class="con-inner scrollBox">
					<ul class="user-list" id="user-list" data-to="0" style="position: relative; display: block; -webkit-transform: translate(0, 0px);">
						<span id="span_after"></span>
						<c:forEach items="${list }" var="talk">
						<li class="clearfix t-row"  style="display:block;">
							<div class="userimg left">
								<i class="elem"></i> <span class="elem2"></span> <a href="javascript:void(0);" class="head"> <img  class="msgAvatar" src="${talk.headimgurl }" width="60" height="60" alt=""></a>
							</div>
							<div class="cont-box left">
								<p class="c-word">
									<a id="nickname" href="javascript:void(0);" class="user-name msgUserName">${talk.nickname }:</a> 
									<span id="text" class="cont displayContent" style="font-size:28px;">${talk.text }</span>
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
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function getMsg(){
			$.ajax({
				url:'${pageContext.request.contextPath}/base/web/talkwall/ajax/${meet.id}',
				type:'post',
				dataType:'json',
				success:function(data){
					  if(data && data.text && data.meetid == '${meet.id}' && data.type!=2){
                    	  var hml = '';
                    	  hml+='<li class="clearfix t-row" style="display:block;">';
                    	  hml+='<div class="userimg left">';
                    		  hml+='<i class="elem"></i> <span class="elem2"></span> <a href="javascript:void(0);" class="head"> <img class="msgAvatar" src="'+data.headimgurl+'" width="60" height="60" alt=""></a>';
                    		  hml+='</div>';
                    		  hml+='<div class="cont-box left">';
                    		  hml+='<p class="c-word">';
                    		  hml+='<a id="nickname" href="javascript:void(0);" class="user-name msgUserName">'+data.nickname+':</a> ';
                    		  hml+='<span id="text" class="cont displayContent" style="font-size:28px;">'+data.text+'</span>';
                    		  hml+='</p>';
                    		  hml+='</div>';
                    		  hml+='<div class="btn-detail messageDetailBtn" style="display: none;">';
                    		  hml+='<div class="btn-style">';
                    		  hml+='<a href="javascript:void(0);" class="icon-arrow"></a>';
                    		  hml+='</div>';
                    		  hml+='</div>';
                    		  hml+='</li>';
                    	  
                    	  $(hml).hide().insertAfter('#span_after').slideDown(1500,function(){
                    		  var listsize = $('#user-list li').size()
                    		  if(listsize>=4){
                    			  $('#user-list li').eq($('#user-list li').size()-1).slideUp(1500).remove();
                    		  }
                    		  	
                    	  })
                            $('#msgTotal').text(data.total)
                      }
				}
			})
		}
		//setInterval(getMsg, 3000);
		function init(){
			JS.Engine.on({
				start : function(cId, aml, engine) {
					var style = engine.getConnector().workStyle;
					style = style === 'stream'?'长连接':'长轮询';
					//console.info(style)
				},
				stop : function(cause, url, cId, engine) {
					//console.info("已停止")
					JS.Engine.start('${pageContext.request.contextPath}/conn');
				},
				talker : function(data, timespan, engine){//侦听一个channel
                     // console.info(data)
                      if(data.text && data.meetid == '${meet.id}' && data.type!=2){
                    	  var hml = '';
                    	  hml+='<li class="clearfix t-row" style="display:block;">';
                    	  hml+='<div class="userimg left">';
                    		  hml+='<i class="elem"></i> <span class="elem2"></span> <a href="javascript:void(0);" class="head"> <img class="msgAvatar" src="'+data.headimgurl+'" width="60" height="60" alt=""></a>';
                    		  hml+='</div>';
                    		  hml+='<div class="cont-box left">';
                    		  hml+='<p class="c-word">';
                    		  hml+='<a id="nickname" href="javascript:void(0);" class="user-name msgUserName">'+data.nickname+':</a> ';
                    		  hml+='<span id="text" class="cont displayContent" style="font-size:28px;">'+data.text+'</span>';
                    		  hml+='</p>';
                    		  hml+='</div>';
                    		  hml+='<div class="btn-detail messageDetailBtn" style="display: none;">';
                    		  hml+='<div class="btn-style">';
                    		  hml+='<a href="javascript:void(0);" class="icon-arrow"></a>';
                    		  hml+='</div>';
                    		  hml+='</div>';
                    		  hml+='</li>';
                    	  
                    	  $(hml).hide().insertAfter('#span_after').slideDown(1500,function(){
                    		  var listsize = $('#user-list li').size()
                    		  if(listsize>=4){
                    			  $('#user-list li').eq($('#user-list li').size()-1).slideUp(1500).remove();
                    		  }
                    		  	
                    	  })
                            $('#msgTotal').text(data.total)
                      }
                      
                }
        });
        JS.Engine.start('${pageContext.request.contextPath}/conn');
		}
	        
		
	</script>
</body>
</html>
