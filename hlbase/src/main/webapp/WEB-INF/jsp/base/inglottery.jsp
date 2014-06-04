<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body onload="init()">
	<div id="wrap" class="wrapbg">
		<div id="whole">
			<div id="header" class="clearfix">
				<a> <span class="logo-t left"><img class="logoScreenLeft" src="${pageContext.request.contextPath}/static/wall/lottery/logo.png" style="position: relative; width: 210px; height: 52px; left: 5px; top: 22px;"></span>
				</a>
				<div class="word-scroll left">
					<div class="clearfix">
						<div class="scrollbox left">
							<ul class="word-list wordList">
								<li class="themeBox" style="display: list-item;font-size:16px;text-align:left;margin-left:100px;color:white;line-height:26px;">正在进行${lottery.levelname } ${lottery.name } 抽奖<br>打开摇一摇抽奖，立即晃动你的手机！<br />
								</li>
							</ul>
						</div>
					</div>
				</div>
				<span class="reserved right showIntroBtn"> <img src="${meet.qrimg}" style="max-width:126px;max-height:96px;">
				</span>
			</div>
			<div id="container">
				<div class="con-inner scrollBox">
					<ul class="user-list" id="user-list" data-to="0" style="position: relative; display: block; -webkit-transform: translate(0, 0px);margin-bottom:-10px;line-height:65px;">
						<span id="span_after"></span>
				</div>
				<div style="width: 400px;height: 150px;;position: absolute;top: 80%">
				<a href="javascript:fs()"><div class="mar-right div_fullscreen">全屏播放</div></a>
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
			    console.info(data)
                if(data && data.lotterystate ==3){
               	 //抽奖已结束
               	 location.reload(true);
               	 return;
                }
                 if( data && data.text && data.meetid == '${meet.id}' && data.type==2){
               	  var hml = '';
               	  hml+='<li class="clearfix t-row">';
               	  hml+='<div class="userimg left">';
               	  hml+='<i class="elem"></i> <span class="elem2"></span> <a href="javascript:void(0);" class="head"> <img class="msgAvatar" src="'+data.headimgurl+'" width="60" height="60" alt=""></a>';
               	  hml+='</div>';
               	  hml+='<div class="cont-box left">';
               	  hml+='<p class="c-word">';
               	hml+='<a href="javascript:void(0);" class="user-name msgUserName" style="color:white">'+data.nickname+'</a> <span style="float:right;color:#ffcc66;font-size:32px;margin-right:60px">'+data.text+'</span>';
               	hml+='</p>';
               	hml+='</div>';
               	hml+='<div class="btn-detail messageDetailBtn" style="display: none;"><div class="btn-style"><a href="javascript:void(0);" class="icon-arrow"></a></div></div></li>';
               	  
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
                     if(data.lotterystate ==3){
                    	 //抽奖已结束
                    	 location.reload(true);
                    	 return;
                     }
                      if(data.text && data.meetid == '${meet.id}' && data.type==2){
                    	  var hml = '';
                    	  hml+='<li class="clearfix t-row">';
                    	  hml+='<div class="userimg left">';
                    	  hml+='<i class="elem"></i> <span class="elem2"></span> <a href="javascript:void(0);" class="head"> <img class="msgAvatar" src="'+data.headimgurl+'" width="60" height="60" alt=""></a>';
                    	  hml+='</div>';
                    	  hml+='<div class="cont-box left">';
                    	  hml+='<p class="c-word">';
                    	hml+='<a href="javascript:void(0);" class="user-name msgUserName" style="color:white">'+data.nickname+'</a> <span style="float:right;color:#ffcc66;font-size:32px;margin-right:60px">'+data.text+'</span>';
                    	hml+='</p>';
                    	hml+='</div>';
                    	hml+='<div class="btn-detail messageDetailBtn" style="display: none;"><div class="btn-style"><a href="javascript:void(0);" class="icon-arrow"></a></div></div></li>';
                    	  
                    	  $(hml).hide().insertAfter('#span_after').slideDown(1500,function(){
                    		  var listsize = $('#user-list li').size()
                    		  if(listsize>=4){
                    			  $('#user-list li').eq($('#user-list li').size()-1).slideUp(1500).remove();
                    		  }
                    		  	
                    	  })
                            //$('#msgTotal').text(data.total)
                      }
                      
                }
        });
        JS.Engine.start('${pageContext.request.contextPath}/conn');
		}
	        
		function fs(){
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
