package com.zyjz.site.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zyjz.site.entity.SiteSluiceDynamicInfo;
import com.zyjz.site.service.AreaRainfallStationService;
import com.zyjz.site.service.SiteSluiceDynamicInfoService;
import com.zyjz.sysmanage.service.SiteRainInfoService;

/**
 * @ClassName: SiteSluiceDynamicInfoController
 * @Description: 闸门站水情实时监控
 * @Author: zhaojx
 * @Date: 2018年3月4日 上午10:12:42
 */
@Controller
@RequestMapping(value="/siteSluiceDynamicInfo")
public class SiteSluiceDynamicInfoController {

	/** 视图解析页面路径 */
	protected static final String SLUICE_MONITOR_CHART_JSP = "/site/sluice_monitor/sluice_monitor_chart";
	
	@Autowired
	private SiteRainInfoService siteRainInfoService;
	
	@Autowired
	private SiteSluiceDynamicInfoService siteSluiceService;
	@Autowired
	private AreaRainfallStationService areaRainfallStationService;
	
	/**
	 * @Title: monitorChart
	 * @Description: 闸门站水情实时监控图表
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/monitorChart", method=RequestMethod.GET)
	public ModelAndView monitorChart(){
		ModelAndView modelAndView = new ModelAndView(SLUICE_MONITOR_CHART_JSP);
//		List<AreaRainfallStation> areaRainList = areaRainfallStationService.getAreaRainfallStationInfo();
//		modelAndView.addObject("areaRainList", areaRainList);
		return modelAndView;
	}
	//地图闸门实时数据展示
	@RequestMapping("/current")
	@ResponseBody
	public BigDecimal current(String canCode,String type){
		BigDecimal bgData = new BigDecimal("0");
		switch (type) {
		//查询实时水位
		case "1":
			SiteSluiceDynamicInfo ssi = siteSluiceService.selectLimit(canCode);
			bgData = ssi.getAfterWaterLevel();
			break;
		case "2":
			SiteSluiceDynamicInfo sulice = siteSluiceService.selectLimit(canCode);
			bgData = sulice.getInstantTraffic();
			break;
		case "3":
			SiteSluiceDynamicInfo suice = siteSluiceService.selectLimit(canCode);
			bgData = suice.getCumulativeTraffic();
			break;
		default:
			break;
		}
		
		
		return bgData;
	}
}








