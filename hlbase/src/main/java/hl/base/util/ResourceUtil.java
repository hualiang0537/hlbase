package hl.base.util;

import java.util.Locale;
import java.util.ResourceBundle;


/**
 * 项目参数工具类
 * 更改配置文件后 无需重启,30秒后自动更新
 * 
 */
public class ResourceUtil {

	private final static MyResourceBundleControl ctl = new MyResourceBundleControl();
	
	/**
	 * @param args
	 * @throws InterruptedException 
	 */
	public static void main(String[] args) throws InterruptedException {
		System.out.println(ResourceUtil.getValue("sessionAgent"));
		Thread.sleep(8000);
		System.out.println(ResourceUtil.getValue("sessionAgent"));
	}
	
	public static String getValue(String key){
		return getBundle().getString(key);
	}
	
	private static ResourceBundle getBundle(){
		return ResourceBundle.getBundle("config", Locale.getDefault(), ctl);
	}

	/**
	 * 重载控制器，每秒钟重载一次
	 */
	private static class MyResourceBundleControl extends ResourceBundle.Control {

		/**
		 * 每30秒钟检查一次
		 */
		@Override
		public long getTimeToLive(String baseName, Locale locale) {
			return 1000*30;
		}

		@Override
		public boolean needsReload(String baseName, Locale locale,
				String format, ClassLoader loader,
				ResourceBundle bundle, long loadTime) {
			return true;
		}
	}
	
}
