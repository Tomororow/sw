package com.zyjz.faultwarning.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zyjz.utils.controller.BaseUtils;

@RequestMapping("/fault_warning")
@Controller
public class faultInforController {
	
	private static final String FAULTLIST = "/faultwarning/fault_infor/list";
	@RequestMapping("/list")
	public String faultList(Model model,HttpServletRequest request){
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		return FAULTLIST;
	}
}
