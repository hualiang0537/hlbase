package hl.base.controller;

import hl.base.model.User;
import hl.base.pagemodel.CommJson;
import hl.base.util.StringEscapeEditor;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 基础控制器
 * 
 * 其他控制器继承此控制器获得日期字段类型转换和防止XSS攻击的功能
 * 
 * 
 */
@Controller
public class BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = LoggerFactory.getLogger(BaseController.class);
	@Autowired
	private RedisTemplate<String, String> redisTemplate;
	@Resource(name = "redisTemplate")
	private ValueOperations<String, String> valueOpts;

	@Resource(name = "redisTemplate")
	private ListOperations<String, String> listOperations;

	private static final String PARAM_SIGNATURE = "signature", PARAM_TIMESTAMP = "timestamp", PARAM_NONCE = "nonce", PARAM_ECHOSTR = "echostr";

	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		/**
		 * 自动转换日期类型的字段格式
		 */
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));

		/**
		 * 防止XSS攻击
		 */
		binder.registerCustomEditor(String.class, new StringEscapeEditor(true, false));
	}

	@RequestMapping("/error/{code}")
	public ModelAndView error(@PathVariable String code) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("error_code", code);
		mv.setViewName("error");
		return mv;
	}
	@RequestMapping("/login")
	public ModelAndView login(HttpSession session) throws Exception {
		ModelAndView mv  = new ModelAndView();
		mv.addObject("books", "书本s");
		//context.put("books", "书本s");
		mv.setViewName("login");
		session.setAttribute("user", "json");
		return mv;
	}
	@RequestMapping("/json")
	public ModelAndView json() throws Exception {
		ModelAndView mv  = new ModelAndView("jsonView");
		CommJson json = new CommJson();
		json.setMsg("msg");
		mv.addObject(json);
		return mv;
	}

}
