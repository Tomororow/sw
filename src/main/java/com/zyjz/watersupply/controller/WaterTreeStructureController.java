package com.zyjz.watersupply.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyjz.sitemanage.web.JsonResult;

@RequestMapping("/Water_tree_structure")
@Controller
public class WaterTreeStructureController {
	
	@RequestMapping("/addData")
	@ResponseBody
	public JsonResult addData(HttpServletRequest request){
		String waterWorks = request.getParameter("waterWorks");
		return new JsonResult();
	}

}
