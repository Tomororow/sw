package com.zyjz.plan.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.plan.entity.ForecastWater;
import com.zyjz.plan.entity.ForecastWaterTable;
import com.zyjz.plan.service.ForecastWaterService;
import com.zyjz.sysmanage.service.CalCanalInfoService;

@Controller
@RequestMapping(value="/forecast")
public class ForecastWaterController {
	
	@Autowired
	ForecastWaterService forecastWaterService;
	@Autowired
	CalCanalInfoService calCanalInfoService;
	
	/** 视图解析页面路径 */
	protected static final String FORECAST_ADD_JSP = "/plan/water_forecast/add_forecast_water";
	protected static final String FORECAST_EDIT_JSP = "/plan/water_forecast/edit_forecast_water";
	protected static final String FORECAST_DETAIL_JSP = "/plan/water_forecast/detail_forecast_water";
	
	
	
	@RequestMapping(value="/page")
	public @ResponseBody List<ForecastWater> page(String canalCode,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
		
			PageHelper.startPage(page, pageSize);
			List<ForecastWater> list = forecastWaterService.findForecastWaterByCanalCode(canalCode);
			PageInfo<ForecastWater> pages = new PageInfo<ForecastWater>(list);
			request.getSession().setAttribute("forecastWaterPages", pages);
		
		return list;
	}
	
	
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<ForecastWater> pageNav(HttpServletRequest request){
		PageInfo<ForecastWater> pages = (PageInfo<ForecastWater>) request.getSession().getAttribute("forecastWaterPages");
		return pages;
	}
	
	@RequestMapping(value="/add_page")
	public String addPage(Model model,String canalCode){
		
		model.addAttribute("canalCode", canalCode);
		
		
		
		return FORECAST_ADD_JSP;
	}
	
	@RequestMapping(value="/add")
	public String add(BigDecimal oneEarlyFlow,int oneEarlyYear,BigDecimal oneFrequency,
			          BigDecimal twoEarlyFlow,int twoEarlyYear,BigDecimal twoFrequency,
			          BigDecimal threeEarlyFlow,int threeEarlyYear,BigDecimal threeFrequency,
			          BigDecimal fourEarlyFlow,int fourEarlyYear,BigDecimal fourFrequency,
			          BigDecimal fiveEarlyFlow,int fiveEarlyYear,BigDecimal fiveFrequency,
			          BigDecimal sixEarlyFlow,int sixEarlyYear,BigDecimal sixFrequency,
			          BigDecimal sevenEarlyFlow,int sevenEarlyYear,BigDecimal sevenFrequency,
			          BigDecimal eightEarlyFlow,int eightEarlyYear,BigDecimal eightFrequency,
			          BigDecimal nineEarlyFlow,int nineEarlyYear,BigDecimal nineFrequency,
			          BigDecimal tenEarlyFlow,int tenEarlyYear,BigDecimal tenFrequency,
			          BigDecimal elevenEarlyFlow,int elevenEarlyYear,BigDecimal elevenFrequency,
			          BigDecimal twelveEarlyFlow,int twelveEarlyYear,BigDecimal twelveFrequency,
			          
			          
			          BigDecimal oneMiddleFlow,int oneMiddleYear,
			          BigDecimal twoMiddleFlow,int twoMiddleYear,
			          BigDecimal threeMiddleFlow,int threeMiddleYear,
			          BigDecimal fourMiddleFlow,int fourMiddleYear,
			          BigDecimal fiveMiddleFlow,int fiveMiddleYear,
			          BigDecimal sixMiddleFlow,int sixMiddleYear,
			          BigDecimal sevenMiddleFlow,int sevenMiddleYear,
			          BigDecimal eightMiddleFlow,int eightMiddleYear,
			          BigDecimal nineMiddleFlow,int nineMiddleYear,
			          BigDecimal tenMiddleFlow,int tenMiddleYear,
			          BigDecimal elevenMiddleFlow,int elevenMiddleYear,
			          BigDecimal twelveMiddleFlow,int twelveMiddleYear,
			          
			          
			          BigDecimal oneLastFlow,int oneLastYear,
			          BigDecimal twoLastFlow,int twoLastYear,
			          BigDecimal threeLastFlow,int threeLastYear,
			          BigDecimal fourLastFlow,int fourLastYear,
			          BigDecimal fiveLastFlow,int fiveLastYear,
			          BigDecimal sixLastFlow,int sixLastYear,
			          BigDecimal sevenLastFlow,int sevenLastYear,
			          BigDecimal eightLastFlow,int eightLastYear,
			          BigDecimal nineLastFlow,int nineLastYear,
			          BigDecimal tenLastFlow,int tenLastYear,
			          BigDecimal elevenLastFlow,int elevenLastYear,
			          BigDecimal twelveLastFlow,int twelveLastYear,
			          
			          
			          String createPeople,String remark,String canalCode){
		
		
		ForecastWater forecastWater = new ForecastWater();
			//做时间戳为tableNo
			Date date = new Date();
			forecastWater.setTableNo(date.getTime()+canalCode);
			forecastWater.setCanalCode(canalCode);
			//拿到当前年份
			int year = date.getYear()+1990;
			
			forecastWater.setYear(year);
			forecastWater.setCreateTime(date);
			forecastWater.setCreatePeople(createPeople);
			forecastWater.setRemark(remark);
		int a = forecastWaterService.addForecastWater(forecastWater);
		
		
		int a1 =saveForecastWaterTable(forecastWater.getId(),year,1,oneEarlyFlow,oneEarlyYear,oneMiddleFlow,oneMiddleYear,oneLastFlow,oneLastYear,oneFrequency);
		int a2 =saveForecastWaterTable(forecastWater.getId(),year,2,twoEarlyFlow,twoEarlyYear,twoMiddleFlow,twoMiddleYear,twoLastFlow,twoLastYear,twoFrequency);
		int a3 =saveForecastWaterTable(forecastWater.getId(),year,3,threeEarlyFlow,threeEarlyYear,threeMiddleFlow,threeMiddleYear,threeLastFlow,threeLastYear,threeFrequency);
		int a4 =saveForecastWaterTable(forecastWater.getId(),year,4,fourEarlyFlow,fourEarlyYear,fourMiddleFlow,fourMiddleYear,fourLastFlow,fourLastYear,fourFrequency);
		int a5 =saveForecastWaterTable(forecastWater.getId(),year,5,fiveEarlyFlow,fiveEarlyYear,fiveMiddleFlow,fiveMiddleYear,fiveLastFlow,fiveLastYear,fiveFrequency);
		int a6 =saveForecastWaterTable(forecastWater.getId(),year,6,sixEarlyFlow,sixEarlyYear,sixMiddleFlow,sixMiddleYear,sixLastFlow,sixLastYear,sixFrequency);
		int a7 =saveForecastWaterTable(forecastWater.getId(),year,7,sevenEarlyFlow,sevenEarlyYear,sevenMiddleFlow,sevenMiddleYear,sevenLastFlow,sevenLastYear,sevenFrequency);
		int a8 =saveForecastWaterTable(forecastWater.getId(),year,8,eightEarlyFlow,eightEarlyYear,eightMiddleFlow,eightMiddleYear,eightLastFlow,eightLastYear,eightFrequency);
		int a9 =saveForecastWaterTable(forecastWater.getId(),year,9,nineEarlyFlow,nineEarlyYear,nineMiddleFlow,nineMiddleYear,nineLastFlow,nineLastYear,nineFrequency);
		int a10 =saveForecastWaterTable(forecastWater.getId(),year,10,tenEarlyFlow,tenEarlyYear,tenMiddleFlow,tenMiddleYear,tenLastFlow,tenLastYear,tenFrequency);
		int a11 =saveForecastWaterTable(forecastWater.getId(),year,11,elevenEarlyFlow,elevenEarlyYear,elevenMiddleFlow,elevenMiddleYear,elevenLastFlow,elevenLastYear,elevenFrequency);
		int a12 =saveForecastWaterTable(forecastWater.getId(),year,12,twelveEarlyFlow,twelveEarlyYear,twelveMiddleFlow,twelveMiddleYear,twelveLastFlow,twelveLastYear,twelveFrequency);
		return "redirect:/ten/list?state=31";
	}
	
	//分批保存
	public int saveForecastWaterTable(String forecastId,Integer year,Integer month,BigDecimal earlyTen,
									  Integer earlyTenYear,BigDecimal middleTen,Integer middleTenYear,
									  BigDecimal lastTen,Integer lastTenYear,BigDecimal frequency){
		ForecastWaterTable  forecastWaterTable = new ForecastWaterTable();
		forecastWaterTable.setForecastId(forecastId);
		forecastWaterTable.setYear(year);
		forecastWaterTable.setMonth(month);
		forecastWaterTable.setEarlyTen(earlyTen);
		forecastWaterTable.setEarlyTenYear(earlyTenYear);
		forecastWaterTable.setMiddleTen(middleTen);
		forecastWaterTable.setMiddleTenYear(middleTenYear);
		forecastWaterTable.setLastTen(lastTen);
		forecastWaterTable.setLastTenYear(lastTenYear);
		forecastWaterTable.setFrequency(frequency);
		int a = forecastWaterService.addForecastWaterTable(forecastWaterTable);
		return a;
	}
	
	
	
	@RequestMapping(value="/edit_page")
	public String editPage(Model model,String id){
		ForecastWater forecastWater = forecastWaterService.findForecastWaterById(id);
		ForecastWaterTable forecastWaterTable1= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,1);
		ForecastWaterTable forecastWaterTable2= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,2);
		ForecastWaterTable forecastWaterTable3= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,3);
		ForecastWaterTable forecastWaterTable4= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,4);
		ForecastWaterTable forecastWaterTable5= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,5);
		ForecastWaterTable forecastWaterTable6= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,6);
		ForecastWaterTable forecastWaterTable7= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,7);
		ForecastWaterTable forecastWaterTable8= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,8);
		ForecastWaterTable forecastWaterTable9= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,9);
		ForecastWaterTable forecastWaterTable10= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,10);
		ForecastWaterTable forecastWaterTable11= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,11);
		ForecastWaterTable forecastWaterTable12= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,12);
		
		model.addAttribute("forecastWater", forecastWater);
		model.addAttribute("forecastWaterTable1", forecastWaterTable1);
		model.addAttribute("forecastWaterTable2", forecastWaterTable2);
		model.addAttribute("forecastWaterTable3", forecastWaterTable3);
		model.addAttribute("forecastWaterTable4", forecastWaterTable4);
		model.addAttribute("forecastWaterTable5", forecastWaterTable5);
		model.addAttribute("forecastWaterTable6", forecastWaterTable6);
		model.addAttribute("forecastWaterTable7", forecastWaterTable7);
		model.addAttribute("forecastWaterTable8", forecastWaterTable8);
		model.addAttribute("forecastWaterTable9", forecastWaterTable9);
		model.addAttribute("forecastWaterTable10", forecastWaterTable10);
		model.addAttribute("forecastWaterTable11", forecastWaterTable11);
		model.addAttribute("forecastWaterTable12", forecastWaterTable12);
		
		return FORECAST_EDIT_JSP;
	}
	
	@RequestMapping(value="/edit")
	public String edit(BigDecimal oneEarlyFlow,int oneEarlyYear,BigDecimal oneFrequency,String oneFrequencyId,
			          BigDecimal twoEarlyFlow,int twoEarlyYear,BigDecimal twoFrequency,String twoFrequencyId,
			          BigDecimal threeEarlyFlow,int threeEarlyYear,BigDecimal threeFrequency,String threeFrequencyId,
			          BigDecimal fourEarlyFlow,int fourEarlyYear,BigDecimal fourFrequency,String fourFrequencyId,
			          BigDecimal fiveEarlyFlow,int fiveEarlyYear,BigDecimal fiveFrequency,String fiveFrequencyId,
			          BigDecimal sixEarlyFlow,int sixEarlyYear,BigDecimal sixFrequency,String sixFrequencyId,
			          BigDecimal sevenEarlyFlow,int sevenEarlyYear,BigDecimal sevenFrequency,String sevenFrequencyId,
			          BigDecimal eightEarlyFlow,int eightEarlyYear,BigDecimal eightFrequency,String eightFrequencyId,
			          BigDecimal nineEarlyFlow,int nineEarlyYear,BigDecimal nineFrequency,String nineFrequencyId,
			          BigDecimal tenEarlyFlow,int tenEarlyYear,BigDecimal tenFrequency,String tenFrequencyId,
			          BigDecimal elevenEarlyFlow,int elevenEarlyYear,BigDecimal elevenFrequency,String elevenFrequencyId,
			          BigDecimal twelveEarlyFlow,int twelveEarlyYear,BigDecimal twelveFrequency,String twelveFrequencyId,
			          
			          
			          BigDecimal oneMiddleFlow,int oneMiddleYear,
			          BigDecimal twoMiddleFlow,int twoMiddleYear,
			          BigDecimal threeMiddleFlow,int threeMiddleYear,
			          BigDecimal fourMiddleFlow,int fourMiddleYear,
			          BigDecimal fiveMiddleFlow,int fiveMiddleYear,
			          BigDecimal sixMiddleFlow,int sixMiddleYear,
			          BigDecimal sevenMiddleFlow,int sevenMiddleYear,
			          BigDecimal eightMiddleFlow,int eightMiddleYear,
			          BigDecimal nineMiddleFlow,int nineMiddleYear,
			          BigDecimal tenMiddleFlow,int tenMiddleYear,
			          BigDecimal elevenMiddleFlow,int elevenMiddleYear,
			          BigDecimal twelveMiddleFlow,int twelveMiddleYear,
			          
			          
			          BigDecimal oneLastFlow,int oneLastYear,
			          BigDecimal twoLastFlow,int twoLastYear,
			          BigDecimal threeLastFlow,int threeLastYear,
			          BigDecimal fourLastFlow,int fourLastYear,
			          BigDecimal fiveLastFlow,int fiveLastYear,
			          BigDecimal sixLastFlow,int sixLastYear,
			          BigDecimal sevenLastFlow,int sevenLastYear,
			          BigDecimal eightLastFlow,int eightLastYear,
			          BigDecimal nineLastFlow,int nineLastYear,
			          BigDecimal tenLastFlow,int tenLastYear,
			          BigDecimal elevenLastFlow,int elevenLastYear,
			          BigDecimal twelveLastFlow,int twelveLastYear,
			          
			          
			          ForecastWater forecastWater){
		
		
			//做时间戳为tableNo
			Date date = new Date();
			//拿到当前年份
			forecastWater.setCreateTime(date);
		int a = forecastWaterService.updateForecastWater(forecastWater);
		
		
		int a1 =updateForecastWaterTable(oneFrequencyId,1,oneEarlyFlow,oneEarlyYear,oneMiddleFlow,oneMiddleYear,oneLastFlow,oneLastYear,oneFrequency);
		int a2 =updateForecastWaterTable(twoFrequencyId,2,twoEarlyFlow,twoEarlyYear,twoMiddleFlow,twoMiddleYear,twoLastFlow,twoLastYear,twoFrequency);
		int a3 =updateForecastWaterTable(threeFrequencyId,3,threeEarlyFlow,threeEarlyYear,threeMiddleFlow,threeMiddleYear,threeLastFlow,threeLastYear,threeFrequency);
		int a4 =updateForecastWaterTable(fourFrequencyId,4,fourEarlyFlow,fourEarlyYear,fourMiddleFlow,fourMiddleYear,fourLastFlow,fourLastYear,fourFrequency);
		int a5 =updateForecastWaterTable(fiveFrequencyId,5,fiveEarlyFlow,fiveEarlyYear,fiveMiddleFlow,fiveMiddleYear,fiveLastFlow,fiveLastYear,fiveFrequency);
		int a6 =updateForecastWaterTable(sixFrequencyId,6,sixEarlyFlow,sixEarlyYear,sixMiddleFlow,sixMiddleYear,sixLastFlow,sixLastYear,sixFrequency);
		int a7 =updateForecastWaterTable(sevenFrequencyId,7,sevenEarlyFlow,sevenEarlyYear,sevenMiddleFlow,sevenMiddleYear,sevenLastFlow,sevenLastYear,sevenFrequency);
		int a8 =updateForecastWaterTable(eightFrequencyId,8,eightEarlyFlow,eightEarlyYear,eightMiddleFlow,eightMiddleYear,eightLastFlow,eightLastYear,eightFrequency);
		int a9 =updateForecastWaterTable(nineFrequencyId,9,nineEarlyFlow,nineEarlyYear,nineMiddleFlow,nineMiddleYear,nineLastFlow,nineLastYear,nineFrequency);
		int a10 =updateForecastWaterTable(tenFrequencyId,10,tenEarlyFlow,tenEarlyYear,tenMiddleFlow,tenMiddleYear,tenLastFlow,tenLastYear,tenFrequency);
		int a11 =updateForecastWaterTable(elevenFrequencyId,11,elevenEarlyFlow,elevenEarlyYear,elevenMiddleFlow,elevenMiddleYear,elevenLastFlow,elevenLastYear,elevenFrequency);
		int a12 =updateForecastWaterTable(twelveFrequencyId,12,twelveEarlyFlow,twelveEarlyYear,twelveMiddleFlow,twelveMiddleYear,twelveLastFlow,twelveLastYear,twelveFrequency);
		return "redirect:/ten/list?state=31";
	}
	
	//分批保存
	public int updateForecastWaterTable(String id,Integer month,BigDecimal earlyTen,
									  Integer earlyTenYear,BigDecimal middleTen,Integer middleTenYear,
									  BigDecimal lastTen,Integer lastTenYear,BigDecimal frequency){
		
		ForecastWaterTable  forecastWaterTable = new ForecastWaterTable();
		forecastWaterTable.setId(id);
		forecastWaterTable.setMonth(month);
		forecastWaterTable.setEarlyTen(earlyTen);
		forecastWaterTable.setEarlyTenYear(earlyTenYear);
		forecastWaterTable.setMiddleTen(middleTen);
		forecastWaterTable.setMiddleTenYear(middleTenYear);
		forecastWaterTable.setLastTen(lastTen);
		forecastWaterTable.setLastTenYear(lastTenYear);
		forecastWaterTable.setFrequency(frequency);
		int a = forecastWaterService.updateForecastWaterTable(forecastWaterTable);
		return a;
	}
	
	/**
	 * @Title: detailPage
	 * @Description: 预测详细信息回显renww
	 * @param: @param model
	 * @param: @param id
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/detail_page")
	public String detailPage(Model model,String id){
		ForecastWater forecastWater = forecastWaterService.findForecastWaterById(id);
		ForecastWaterTable forecastWaterTable1= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,1);
		ForecastWaterTable forecastWaterTable2= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,2);
		ForecastWaterTable forecastWaterTable3= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,3);
		ForecastWaterTable forecastWaterTable4= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,4);
		ForecastWaterTable forecastWaterTable5= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,5);
		ForecastWaterTable forecastWaterTable6= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,6);
		ForecastWaterTable forecastWaterTable7= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,7);
		ForecastWaterTable forecastWaterTable8= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,8);
		ForecastWaterTable forecastWaterTable9= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,9);
		ForecastWaterTable forecastWaterTable10= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,10);
		ForecastWaterTable forecastWaterTable11= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,11);
		ForecastWaterTable forecastWaterTable12= forecastWaterService.findForecastWaterTableByForecastIdAndMonth(id,12);
		
		model.addAttribute("forecastWater", forecastWater);
		model.addAttribute("forecastWaterTable1", forecastWaterTable1);
		model.addAttribute("forecastWaterTable2", forecastWaterTable2);
		model.addAttribute("forecastWaterTable3", forecastWaterTable3);
		model.addAttribute("forecastWaterTable4", forecastWaterTable4);
		model.addAttribute("forecastWaterTable5", forecastWaterTable5);
		model.addAttribute("forecastWaterTable6", forecastWaterTable6);
		model.addAttribute("forecastWaterTable7", forecastWaterTable7);
		model.addAttribute("forecastWaterTable8", forecastWaterTable8);
		model.addAttribute("forecastWaterTable9", forecastWaterTable9);
		model.addAttribute("forecastWaterTable10", forecastWaterTable10);
		model.addAttribute("forecastWaterTable11", forecastWaterTable11);
		model.addAttribute("forecastWaterTable12", forecastWaterTable12);
		
		return FORECAST_DETAIL_JSP;
	}
	
	/**
	 * @Title: delete
	 * @Description:删除 
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id){
		
		int a = forecastWaterService.deleteForecastWaterById(id);
		List<ForecastWaterTable> forecastWaterTableList =  forecastWaterService.findForecastWaterTableByForecastId(id);
		for(int i=0;i<forecastWaterTableList.size();i++){
			forecastWaterService.deleteForecastWaterTableByForecastId(forecastWaterTableList.get(i).getForecastId());
		}
		return a+"";
	}
	
}
