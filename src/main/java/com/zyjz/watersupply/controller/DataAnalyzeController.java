package com.zyjz.watersupply.controller;

import com.alibaba.fastjson.JSONObject;
import com.zyjz.site.entity.SiteMonthFlow;
import com.zyjz.site.service.SiteMonthFlowService;
import com.zyjz.utils.CommonMethodUtils;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 数据分析
 * @ClassName: DataAnalyzeController
 * @Description: 
 * @Author: liyue
 * @Date: 2018年5月11日 上午9:45:01
 */
@Controller
@RequestMapping("/dataAnalyze")
public class DataAnalyzeController {

	@Autowired
	SiteMonthFlowService siteMonthFlowService;

	private static final String ANALYZE_JSP = "/watersupply/data_analyze/list";
	
	//跳转至数据分析页面
	@RequestMapping("/data_analyze")
	public String analyze(Model model,HttpServletRequest request){
		return 	ANALYZE_JSP;
	}

	/**
	 * 总用水量查询
	 */
	@RequestMapping(value = "/total_water_consumption_query", produces =  "text/html; charset=utf-8")
	public @ResponseBody String totalWaterConsumptionQuery(String canalCode){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
		Calendar cal = Calendar.getInstance();//得到一个Calendar的实例
		Date currentYearDate = new Date();
		cal.setTime(currentYearDate); //设置时间为当前时间
		Map<String, Object> map = new HashedMap();
		map.put("canalCode", canalCode);
		map.put("year", CommonMethodUtils.timeFormatter(currentYearDate,"year"));
		//当年年引水量
		List<SiteMonthFlow> currentYearFlowList = siteMonthFlowService.selectCountYearFlowPerMonth(map);

		//获取前一年
		cal.add(Calendar.YEAR,-1);
		Date previousYearDate = cal.getTime();
		map.put("year", CommonMethodUtils.timeFormatter(previousYearDate,"year"));
		List<SiteMonthFlow> previousYearFlowList = siteMonthFlowService.selectCountYearFlowPerMonth(map);

		//数据封装
		Map<String,Object> dataMap = new HashedMap();
		Integer[] monthArrayBar = {1,2,3,4,5,6,7,8,9,10,11,12};
		String[] monthArrayPie = {"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"};
		//柱状图x轴
		dataMap.put("xDataBar",monthArrayBar);
		dataMap.put("xDataPie",monthArrayPie);
		//当年柱状图
		Map<Integer, BigDecimal> currentYearFlowMap = currentYearFlowList.stream().collect(Collectors.toMap(SiteMonthFlow::getInMonth, SiteMonthFlow::getTotalFlowPerMonth));
		dataMap.put("currentLegendBar",new String[]{dateFormat.format(currentYearDate)+"年用量"});
		dataMap.put("currentYDataBar",Arrays.stream(monthArrayBar).map(x -> currentYearFlowMap.getOrDefault(x, new BigDecimal(0.000))).collect(Collectors.toList()).toArray());

		//上一年柱状图
		Map<Integer, BigDecimal> previousYearFlowMap = previousYearFlowList.stream().collect(Collectors.toMap(SiteMonthFlow::getInMonth, SiteMonthFlow::getTotalFlowPerMonth));
		dataMap.put("previousLegendBar",new String[]{dateFormat.format(previousYearDate)+"年用量"});
		dataMap.put("previousYDataBar",Arrays.stream(monthArrayBar).map(x -> previousYearFlowMap.getOrDefault(x, new BigDecimal(0.000))).collect(Collectors.toList()).toArray());
		return JSONObject.toJSONString(dataMap);
	}
}
