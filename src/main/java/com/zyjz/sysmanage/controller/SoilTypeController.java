package com.zyjz.sysmanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/soil")
public class SoilTypeController {

	
	/** 视图解析页面路径 */
	protected static final String SOIL_TYPE_JSP = "/sysmanage/soil_type_info/soil_type";
	
	@RequestMapping(value="/soil_type")
	public String soilType(Model model){
		
		return SOIL_TYPE_JSP;
	}
	
}
