package com.zyjz.watersupply.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zyjz.utils.controller.BaseUtils;

/**
 * 预警管理
 * @ClassName: WarningController
 * @Description: 
 * @Author: liyue
 * @Date: 2018年5月10日 下午6:49:38
 */
@Controller
@RequestMapping("/warning")
public class WarningController {

	
	private static final String LIST_JSP = "/watersupply/warning/list";
	
	
	@RequestMapping("/list")
	public Object getWarningList(Model model,HttpServletRequest request){
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		return LIST_JSP;
	}
}
