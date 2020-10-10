package com.zyjz.watersupply.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyjz.utils.controller.BaseUtils;
import com.zyjz.watersupply.entity.WaterTreeStructure;
import com.zyjz.watersupply.service.WaterTreeStructureService;
/**
 * 供水监控
 * @ClassName: WaterSupplyController
 * @Description: 
 * @Author: liyue
 * @Date: 2018年5月10日 下午6:47:02
 */
@Controller
@RequestMapping("/waterMonitoring")
public class WaterSupplyController {

	
	private static final String LIST_JSP = "/watersupply/waterMonitoring/list";
	
	private static final Logger logger = LoggerFactory.getLogger(WaterTreeStructure.class);
	
	@Autowired
	private WaterTreeStructureService waterTreeStructureService;
	
	@RequestMapping("/getWaterSupplyList")
	public Object getWaterSupplyList(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return LIST_JSP;
	}
	
	
		
}













