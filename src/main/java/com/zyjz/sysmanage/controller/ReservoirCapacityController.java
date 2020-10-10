package com.zyjz.sysmanage.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyjz.sysmanage.entity.ReservoirWaterLevelVolum;
import com.zyjz.sysmanage.entity.SiteReservoirInfo;
import com.zyjz.sysmanage.service.ReservoirCapacityService;
import com.zyjz.sysmanage.service.ReservoirManagerService;

@Controller
@RequestMapping(value="/reservoir_capacity")
public class ReservoirCapacityController {
	
	@Autowired
	ReservoirManagerService reservoirManagerService;

	@Autowired
	ReservoirCapacityService reservoirCapacityService;
	/** 视图解析页面路径 */
	protected static final String RESERVOIR_CAPACITY_JSP = "/plan/reservoir_capacity/list";
	protected static final String ADD_RESERVOIR_JSP =  "/sysmanage/reservoir_manager/add_reservoir";
	
	
	@RequestMapping(value="/list")
	public String list(Model model){
		List<SiteReservoirInfo> siteReservoirInfoList =  reservoirManagerService.findAllReservoir();
		
		List<ReservoirWaterLevelVolum> reservoirWaterLevelVolumList = reservoirCapacityService.findAllReservoirWaterLevelVolumsByReservoirCode("111111");
		model.addAttribute("siteReservoirInfoList", siteReservoirInfoList);
		model.addAttribute("reservoirWaterLevelVolumList", reservoirWaterLevelVolumList);
		
		return RESERVOIR_CAPACITY_JSP;
	}
	
	@RequestMapping(value="/get_relation_data")
	public @ResponseBody List<ReservoirWaterLevelVolum> getRelationData(String reservoirCode){
		
		List<ReservoirWaterLevelVolum> reservoirWaterLevelVolumList = reservoirCapacityService.findAllReservoirWaterLevelVolumsByReservoirCode(reservoirCode);
		
		return reservoirWaterLevelVolumList;
	}
}
