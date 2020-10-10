package com.zyjz.utils;

/**
 * @ClassName: StringUtils
 * @Description: 字符串工具类
 * @Author: zhaojx
 * @Date: 2018年1月22日 上午9:43:47
 */
public class StringUtils {
	
	/**
	 * @Title: isNullOrEmpty
	 * @Description: 字符串是否为空
	 * @param: @param str
	 * @return: boolean
	 */
	public boolean isNullOrEmpty(String str){
		boolean flag = true;
		if(str != null && !str.trim().equals("")){
			flag = false;
		}
		return flag;
	}
}
