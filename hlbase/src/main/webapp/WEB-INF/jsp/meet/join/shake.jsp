<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>摇一摇抽奖</title>

</head>

<body>
	<div class="main">

		<div class="hand">
			<img id="hand" width="320"  src="${pageContext.request.contextPath}/static/img/hand.png" />
		</div>

		<div class="wenzi"></div>
	</div>
	<audio src="${pageContext.request.contextPath}/static/css/yaoyiyao/1.mp3" id='mp3' preload="auto" style="position:fixed;left:99999px;"></audio>
	<div class="boxcontent boxyellow">
    <div class="box">
    <div class="title-green"><span>奖项设置：</span></div>
         <div class="Detail">
            <p>${lottery.levelname}: ${lottery.name}  奖品数量: ${lottery.count}</p>
        </div>
	</div>
</div>
	<link href="${pageContext.request.contextPath}/static/css/guajiang/css/activity-style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/yaoyiyao/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/shake.js"></script>
	<script type="text/javascript">
	    var isyao = 0;
	    var canyao = false;
	    var t ;
	    // alert(window.DeviceMotionEvent)
	    if (window.DeviceMotionEvent != undefined){
	    	canyao = true;
	    }
	   
	    //alert(canyao)
	   if(canyao){
		   window.addEventListener('shake', shakeEventDidOccur, false);
	   }else{
		   alert('您的设备不支持摇一摇，确定后将为您自动提交抽奖')
		   dopost();
	   }
		document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
			WeixinJSBridge.call('hideOptionMenu');
		});
		
		/* window.onload = function() {
				window.addEventListener('shake', shakeEventDidOccur, false);
				//define a custom method to fire when shake occurs.
				function shakeEventDidOccur () {
					//$('#mp3').get(0).currentTime = 0;
					//$('#mp3').get(0).play();
					//window.removeEventListener('shake', shakeEventDidOccur, false);
					$("#mp3").trigger('play');
					$('#hand').attr('src','${pageContext.request.contextPath}/static/img/hand.gif');
					dopost();
				}
			
		}; */
		function shakeEventDidOccur () {
			//$('#mp3').get(0).currentTime = 0;
			//$('#mp3').get(0).play();
			//window.removeEventListener('shake', shakeEventDidOccur, false);
			$("#mp3").trigger('play');
			$('#hand').attr('src','${pageContext.request.contextPath}/static/img/hand.gif');
			dopost();
			setTimeout(afterSuccess,3000)
			
		}
		function afterSuccess(){
			//window.removeEventListener('shake', shakeEventDidOccur, false);
			$('#hand').attr('src','${pageContext.request.contextPath}/static/img/hand.png');
			 //pause playing
			  $("#mp3").trigger('pause');
			  //set play time to 0
			  $("#mp3").prop("currentTime",0);
			 // window.addEventListener('shake', shakeEventDidOccur, false);
			  //clearTimeout(t);
		}
		function dopost(){
			$.ajax({
				url:'${pageContext.request.contextPath}/meet/join/shake/ajax/${lottery.id}',
				type:'post',
				dataType:'json',
				success:function(data){
				//	window.removeEventListener('shake', shakeEventDidOccur, false);
					if(data.success){
						//afterSuccess();
					//	t=setTimeout('afterSuccess',4000)
						/* sleep(3000)
						afterSuccess() */
						//$('#hand').attr('src','${pageContext.request.contextPath}/static/img/hand.png');
						//clearTimeout(t);
						
						//$('#mp3').get(0).currentTime = 0;
						//$('#mp3').get(0).pause();
						//$('#hand').attr('src','${pageContext.request.contextPath}/static/img/hand.png');
					}else{
						alert(data.msg)
						$('#hand').attr('src','${pageContext.request.contextPath}/static/img/hand.png');
					}
				},
				error:function(){
					alert('error')
					window.removeEventListener('shake', shakeEventDidOccur, false);
				}
			})
		}
	</script>
</body>
</html>
