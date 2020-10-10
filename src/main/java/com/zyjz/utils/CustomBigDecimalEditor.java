package com.zyjz.utils;

import java.beans.PropertyEditorSupport;

import org.apache.commons.lang.StringUtils;

/**
 * <p>Description:BigDecimal custom property editor </p>
 * <p>Company: </p> 
 * @author rww
 *	@data 2018年1月2日 上午11:57:32
 */
public class CustomBigDecimalEditor extends PropertyEditorSupport {
	
	public void setAsText(String text) throws IllegalArgumentException {  
        if (StringUtils.isEmpty(text)) {  
            setValue(null);  
        } else {  
            setValue(NumberUtils.getBigDecimal(text));  
        }  
    }
	
}
