package hl.base.util;

import java.util.Map;

import com.alibaba.fastjson.support.spring.FastJsonJsonView;
/**
 * 解决MappingJacksonJsonView返回的json格式问题
 * @author 
 *
 */
public class CustomMappingJacksonJsonView extends FastJsonJsonView {
	
	 @Override  
	    protected Object filterModel(Map<String, Object> model) {  
	        Map<?, ?> result = (Map<?, ?>) super.filterModel(model); 
	        if (result.size() == 1) {  
	            return result.values().iterator().next();  
	           
	        } else {  
	            return result;  
	        }  
	    }  

}
