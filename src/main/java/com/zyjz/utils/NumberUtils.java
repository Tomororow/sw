package com.zyjz.utils;

import java.math.BigDecimal;

/**
 * <p>Description:Number handle utils </p>
 * <p>Company: </p> 
 * @author rww
 *	@data 2018年1月2日 上午11:55:33
 */
public class NumberUtils {
	public static int parseInt(long l){  
        return BigDecimal.valueOf(l).intValue();  
    }  
      
    public static long parseLong(String s) {  
        return Long.parseLong(s.trim());  
    }  
      
    public static BigDecimal getBigDecimal(String s) {  
        return BigDecimal.valueOf(Long.parseLong(s.trim()));  
    }  
}