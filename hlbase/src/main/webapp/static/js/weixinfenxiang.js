function guid() {
	var s4 = function() {
		return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
	};
	return (s4() + s4() + "-" + s4() + "-" + s4() + "-" + s4() + "-" + s4() + s4() + s4());
	// return parseInt(1000*Math.random());
}
var weChatBridgeReady = {
	init : function() {
		weChatBridgeReady.bindShareWithApp();
		weChatBridgeReady.bindShareWithTimeline();
	},
	bindShareWithApp : function() {
		var a = document.location.href;
		WeixinJSBridge.on("menu:share:appmessage", function(b) {
			var rand = guid();
			// 记录分享信息
			if (contentModel.ajax_share_url != 'undefined' && contentModel.ajax_share_url != "") {
				/*$.ajax({
					type : "get",
					url : contentModel.ajax_share_url + "&share_key=" + rand,
					success : function() {
					}
				});*/
			}
			WeixinJSBridge.invoke("sendAppMessage", {
				appid : "",
				img_url : contentModel.img_url,
				img_width : "120",
				img_height : "120",
				link : contentModel.link + "&share_key=" + rand,
				desc : contentModel.desc,
				title : contentModel.title
			}, function(d) {
				WeixinJSBridge.log(d.err_msg)
			})
		})
	},
	bindShareWithTimeline : function() {
		var a = document.location.href;
		WeixinJSBridge.on("menu:share:timeline", function(b) {
			var rand = guid();
			// 记录分享信息
			if (contentModel.ajax_share_url != 'undefined' && contentModel.ajax_share_url != "") {
				$.ajax({
					type : "get",
					url : contentModel.ajax_share_url + "&share_key=" + rand,
					success : function(msg) {
					}
				});
			}
			WeixinJSBridge.invoke("shareTimeline", {
				img_url : contentModel.tlimg_url,
				img_width : "118",
				img_height : "118",
				link : contentModel.link + "&share_key=" + rand,
				desc : contentModel.desc,
				title : contentModel.title
			}, function(d) {
				WeixinJSBridge.log(d.err_msg)
			})
		})
	}
};
if (typeof WeixinJSBridge != "undefined" && WeixinJSBridge.invoke) {
	weChatBridgeReady.init()
} else {
	document.addEventListener("WeixinJSBridgeReady", weChatBridgeReady.init)
}