<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>关注珊瑚移动</title>
</head>
<body>

	<div class="ui-body ui-body-a ui-corner-all">
		<p>
			本账号由珊瑚移动<a href="http://www.caymobi.com">www.caymobi.com</a>开发并提供技术支持
		</p>

	</div>
       <a href="weixin://contacts/profile/shanhuyingxiao" data-role="button" data-theme="e" data-icon="star">关注珊瑚移动</a>
	<script type="text/javascript">
	var browser={  
	        versions:function(){  
	        var u = navigator.userAgent, app = navigator.appVersion;  
	        return {  
	        trident: u.indexOf('Trident') > -1,  //IE内核  
	        presto: u.indexOf('Presto') > -1,  //opera内核  
	        webKit: u.indexOf('AppleWebKit') > -1,  //苹果、谷歌内核  
	        gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,  //火狐内核  
	        mobile: !!u.match(/AppleWebKit.*Mobile.*/)||!!u.match(/AppleWebKit/),  //是否为移动终端  
	        ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),  //ios终端  
	        android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1,  //android终端或者uc浏览器  
	        iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1,  //是否为iPhone或者QQHD浏览器  
	        iPad: u.indexOf('iPad') > -1,  //是否iPad  
	        webApp: u.indexOf('Safari') == -1  //是否web应该程序，没有头部与底部  
	        };  
	        }()  
	    }  
	   /*  function downhref(){  
	        if(browser.versions.ios || browser.versions.iPhone || browser.versions.iPad){  
	            window.location = "wapdown.action?type=ios";  
	        }else{  
	            window.location = "wapdown.action?type=android";  
	        }  
	    }   */
		if(!browser.versions.android){
			$('p').html('请在 添加朋友>查找公众号 中搜索“珊瑚移动”，并关注珊瑚移动公众号')
			$('a').hide();
		}
	</script>
</body>
</html>
