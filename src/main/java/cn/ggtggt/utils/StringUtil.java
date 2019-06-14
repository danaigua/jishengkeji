package cn.ggtggt.utils;
/**
 * 字符串的工具类
 * @author JOB
 *
 */
public class StringUtil {
	/**
	 * 判断是否为空
	 * @param str
	 * @return
	 */
	public static boolean isEmtity(String str) {
		if("".equals(str) || str ==null) {
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 判断是否不为空
	 * @param str
	 * @return
	 */
	public static boolean isNotEmtity(String str) {
		if(!isEmtity(str)) {
			return true;
		}else {
			return false;
		}
	}
}
