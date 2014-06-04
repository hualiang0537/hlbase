package hl.base.interceptors;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 权限拦截器
 * 
 * 
 */
public class SecurityInterceptor implements HandlerInterceptor {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = LoggerFactory.getLogger(SecurityInterceptor.class);

	private List<String> excludeUrls;// 不需要拦截的资源

	public List<String> getExcludeUrls() {
		return excludeUrls;
	}

	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}

	/**
	 * 完成页面的render后调用
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception) throws Exception {

	}

	/**
	 * 在调用controller具体方法后拦截
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView) throws Exception {

	}

	/**
	 * 在调用controller具体方法前拦截
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		
		/*//request.getSession().setAttribute("weixinapi_session_user", this.userService.get(1L));
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url = requestUri.substring(contextPath.length());
		
		if (url.indexOf("/base/") > -1|| url.indexOf("/conn") > -1 || contains(excludeUrls,url)) {// 如果要访问的资源是不需要验证的
			return true;
		}

		Object sessionInfo =  request.getSession().getAttribute("weixinapi_session_user");
		if (sessionInfo == null) {// 如果没有登录或登录超时
			logger.info("contextPath:"+contextPath);
			logger.info("requestUri:"+requestUri);
			logger.info("没有登录或登录已超时！");
			response.sendRedirect("/base/oauth?state="+requestUri);
			//request.getRequestDispatcher("/base/oauth?state="+requestUri).forward(request, response);
			return false;
		}

*/
		return true;
	}

	private boolean contains(List<String> excludeUrls2, String url) {
		for (String s : excludeUrls2) {
			if (s.indexOf(url)>-1) {
				return true;
			}
		}
		return false;
	}
}
