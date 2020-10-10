package com.zyjz.plan.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.plan.entity.*;
import com.zyjz.plan.service.*;
import com.zyjz.sysmanage.entity.CalCanalInfo;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.utils.controller.BaseUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value="/plan_new")
public class PlanNewController {
	
	
	@Autowired
	CalCanalInfoService calCanalInfoService;
	@Autowired
	ForecastWaterService forecastWaterService;
	
	@Autowired
	NeedWaterService needWaterService;
	
	@Autowired
	WaterAuotaService waterAuotaService;
	@Autowired
	WaterPlanNewService waterPlanNewService;
	
	@Autowired
	private SoilsTypeInfoService soilsTypeInfoService;
	
	@Autowired
	private CropsTypeInfoService cropsTypeInfoService;
	
	
	@Autowired
	private CropsGrowthCycleService cropsGrowthCycleService;
	
	
	
	/** 视图解析页面路径 */
	protected static final String WATER_PLAN_JSP = "/plan/water_distribution_new/list";
	protected static final String ADD_PLAN_JSP = "/plan/water_distribution_new/add_plan";
	protected static final String DETAIL_All_JSP = "/plan/water_distribution_new/detail_all";
	
	
	
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request){
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		
		return WATER_PLAN_JSP;
	}
	
	/**
	 * 跳转到添加配水页面
	 * @Title: addPage
	 * @Description: 
	 * @param: @param model
	 * @param: @param canalId
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add_page")
	public String addPage(Model model,String canalId){
		CalCanalInfo calCanalInfo= calCanalInfoService.findCanalByCode(canalId);
		model.addAttribute("canalCode", calCanalInfo.getCanalCode());
		model.addAttribute("canalName", calCanalInfo.getCanalName());
		List<NeedWaterReport> needWaterReportList=needWaterService.findCanaCodeByNeedWaterReportList(calCanalInfo.getCanalCode());
		model.addAttribute("needWaterReportList", needWaterReportList);
		return ADD_PLAN_JSP;
	} 
	@RequestMapping("/getCropsInfo_scientific")
	@ResponseBody
	public Object getCropsInfo_scientific(HttpServletRequest request){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		String soilType=request.getParameter("soilType");
		String cropsType=request.getParameter("cropsType");
		String startDayTime=request.getParameter("startDayTime");//配水开始日期
		String endDayTime=request.getParameter("endDayTime");//配水结束日期
		String area =request.getParameter("area");//农作物面积
		
		String canalCode =request.getParameter("canalCode");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        Date date = new Date();
       int  year=Integer.parseInt(sdf.format(date)) ;
		
		SoilTypeInfo soilTypeInfo =soilsTypeInfoService.findsoilType(soilType);
		//各种农作物标准灌水定额集合
		List<Map<String,BigDecimal>> waterQuotaList = new ArrayList<>();
		//所有提报农作名称
		//拿到河道的需水提报
		List<NeedWaterReport> needWaterReportList= needWaterService.findNeedWaterReportByCanalCodeAndYear(canalCode,year);
		
		List<NeedWaterReport> needWaterReportGroupList= needWaterService.findNeedWaterReportByCanalCodeAndYearGroupByCropsType(canalCode,year);
		
		try {
			for (int i = 0; i < needWaterReportGroupList.size(); i++) {

				String cropsTypeCode = needWaterReportGroupList.get(i)
						.getCropsType();

				CropsTypeInfo cropsTypeInfo = cropsTypeInfoService
						.findCropsTypeByCode(cropsTypeCode);
				//拿到农作物id
				String id = cropsTypeInfo.getId();
				//根据农作物id查询该农作物所有的生长周期
				List<CropsGrowthCycle> cropsGrowthCycleList = cropsGrowthCycleService
						.findCropsTypeIdGrowthCycleList(id);
				for (int j = 0; j < cropsGrowthCycleList.size(); j++) {

					//周期开始月份
					long cycleStartMonth = cropsGrowthCycleList.get(j)
							.getStateDate().getTime();
					//周期结束月份
					long cycleEndMonth = cropsGrowthCycleList.get(j)
							.getEndDate().getTime();

					//配水开始日期月份
					long planStartMonth = format.parse(startDayTime).getTime();
					//配水结束日期月份
					long planEndMonth = format.parse(endDayTime).getTime();
					System.out.println("判断开始---------------------------------");
					if (planStartMonth >= cycleStartMonth
							&& planStartMonth < cycleEndMonth) {
						System.out.println("判断1---------------------------------");
						if (planEndMonth < cycleEndMonth) {//配水周期在生长周期内
							System.out.println("判断2---------------------------------");
							
							//灌水定额
							BigDecimal waterQuota = new BigDecimal("0.00");
							Map<String, BigDecimal> map = new HashMap<>();
							System.out.println("=======配水周期在生长周期内waterQuota========"+waterQuota);
							//M旱作=0.667[蒸发蒸腾量-生育期内有效降水量-生育期内地下水利用量+犁地深度*(生育期开始土壤体积含水率-生育期结束时土壤含水率)]
							BigDecimal evapotranspiration=cropsGrowthCycleList.get(j).getEvapotranspiration();//蒸发蒸腾量
							BigDecimal growthPeriodRainfall= cropsGrowthCycleList.get(j).getGrowthPeriodRainfall();//生育期内有效降水量
							BigDecimal groundwater =cropsGrowthCycleList.get(j).getGroundwater();//生育期内地下水利用量
							BigDecimal soilHight = new BigDecimal( cropsGrowthCycleList.get(j).getComm6());//犁地深度
							BigDecimal growthPeriodSoilStart = cropsGrowthCycleList.get(j).getGrowthPeriodSoilStart();//生育期开始土壤体积含水率
							BigDecimal growthPeriodSoilEnd = cropsGrowthCycleList.get(j).getGrowthPeriodSoilEnd();//生育期结束时土壤含水率
							BigDecimal F667=new BigDecimal("0.667");
							waterQuota=F667.multiply((evapotranspiration.subtract(growthPeriodRainfall).subtract(groundwater)).add((soilHight).multiply((growthPeriodSoilStart.subtract(growthPeriodSoilEnd)))));
							
							map.put(id, waterQuota);

							waterQuotaList.add(map);

						} else if (planEndMonth >= cropsGrowthCycleList.get(j)
								.getEndDate().getTime()
								&& planEndMonth < cropsGrowthCycleList
										.get(j + 1).getEndDate().getTime()) {//相邻周期
							
							//灌水定额
							BigDecimal waterQuota1 = new BigDecimal("0.00");
							Map<String, BigDecimal> map = new HashMap<>();
							System.out.println("=======配水周期在生长周期内waterQuota========"+waterQuota1);
							//M旱作=0.667[蒸发蒸腾量-生育期内有效降水量-生育期内地下水利用量+犁地深度*(生育期开始土壤体积含水率-生育期结束时土壤含水率)]
							BigDecimal evapotranspiration1=cropsGrowthCycleList.get(j).getEvapotranspiration();//蒸发蒸腾量
							BigDecimal growthPeriodRainfall1= cropsGrowthCycleList.get(j).getGrowthPeriodRainfall();//生育期内有效降水量
							BigDecimal groundwater1 =cropsGrowthCycleList.get(j).getGroundwater();//生育期内地下水利用量
							BigDecimal soilHight1 = new BigDecimal( cropsGrowthCycleList.get(j).getComm6());//犁地深度
							BigDecimal growthPeriodSoilStart1 = cropsGrowthCycleList.get(j).getGrowthPeriodSoilStart();//生育期开始土壤体积含水率
							BigDecimal growthPeriodSoilEnd1 = cropsGrowthCycleList.get(j).getGrowthPeriodSoilEnd();//生育期结束时土壤含水率
							BigDecimal F6671=new BigDecimal("0.667");
							waterQuota1=F6671.multiply((evapotranspiration1.subtract(growthPeriodRainfall1).subtract(groundwater1)).add((soilHight1).multiply((growthPeriodSoilStart1.subtract(growthPeriodSoilEnd1)))));
							
							//灌水定额
							BigDecimal waterQuota2 = new BigDecimal("0.00");
							System.out.println("=======配水周期在生长周期内waterQuota========"+waterQuota2);
							//M旱作=0.667[蒸发蒸腾量-生育期内有效降水量-生育期内地下水利用量+犁地深度*(生育期开始土壤体积含水率-生育期结束时土壤含水率)]
							BigDecimal evapotranspiration2=cropsGrowthCycleList.get(j+1).getEvapotranspiration();//蒸发蒸腾量
							BigDecimal growthPeriodRainfall2= cropsGrowthCycleList.get(j+1).getGrowthPeriodRainfall();//生育期内有效降水量
							BigDecimal groundwater2 =cropsGrowthCycleList.get(j+1).getGroundwater();//生育期内地下水利用量
							BigDecimal soilHight2 = new BigDecimal( cropsGrowthCycleList.get(j+1).getComm6());//犁地深度
							BigDecimal growthPeriodSoilStart2 = cropsGrowthCycleList.get(j+1).getGrowthPeriodSoilStart();//生育期开始土壤体积含水率
							BigDecimal growthPeriodSoilEnd2 = cropsGrowthCycleList.get(j+1).getGrowthPeriodSoilEnd();//生育期结束时土壤含水率
							BigDecimal F6672=new BigDecimal("0.667");
							waterQuota2=F6672.multiply((evapotranspiration2.subtract(growthPeriodRainfall2).subtract(groundwater2)).add((soilHight2).multiply((growthPeriodSoilStart2.subtract(growthPeriodSoilEnd2)))));
							map.put(id, waterQuota1.add(waterQuota2));
							waterQuotaList.add(map);

						} else if (planEndMonth >= cropsGrowthCycleList
								.get(j + 1).getEndDate().getTime()) {//中间隔n个周期
							//相隔周期数
							List<CropsGrowthCycle> list = new ArrayList<>();
							System.out.println("判断4---------------------------------");
							for (int k = j + 1; k < cropsGrowthCycleList.size(); k++) {
								list.add(cropsGrowthCycleList.get(k));
								if (planEndMonth >= cropsGrowthCycleList.get(k)
										.getStateDate().getTime()
										&& planEndMonth < cropsGrowthCycleList
												.get(k).getEndDate().getTime()) {
									break;
								}
							}
							//中间间隔周期得灌水
							BigDecimal totalWaterQuota = new BigDecimal("0");
							for (int l = 0; l < list.size(); l++) {
								BigDecimal waterQuota1 = new BigDecimal("0.00");
								Map<String, BigDecimal> map = new HashMap<>();
								//M旱作=0.667[蒸发蒸腾量-生育期内有效降水量-生育期内地下水利用量+犁地深度*(生育期开始土壤体积含水率-生育期结束时土壤含水率)]
								BigDecimal evapotranspiration1=cropsGrowthCycleList.get(l).getEvapotranspiration();//蒸发蒸腾量
								BigDecimal growthPeriodRainfall1= cropsGrowthCycleList.get(l).getGrowthPeriodRainfall();//生育期内有效降水量
								BigDecimal groundwater1 =cropsGrowthCycleList.get(l).getGroundwater();//生育期内地下水利用量
								BigDecimal soilHight1 = new BigDecimal( cropsGrowthCycleList.get(l).getComm6());//犁地深度
								BigDecimal growthPeriodSoilStart1 = cropsGrowthCycleList.get(l).getGrowthPeriodSoilStart();//生育期开始土壤体积含水率
								BigDecimal growthPeriodSoilEnd1 = cropsGrowthCycleList.get(l).getGrowthPeriodSoilEnd();//生育期结束时土壤含水率
								BigDecimal F6671=new BigDecimal("0.667");
								totalWaterQuota=F6671.multiply((evapotranspiration1.subtract(growthPeriodRainfall1).subtract(groundwater1)).add((soilHight1).multiply((growthPeriodSoilStart1.subtract(growthPeriodSoilEnd1)))));

							}

							//灌水定额
							BigDecimal waterQuota1 = new BigDecimal("0.00");
							Map<String, BigDecimal> map = new HashMap<>();
							System.out.println("=======配水周期在生长周期内waterQuota========"+waterQuota1);
							//M旱作=0.667[蒸发蒸腾量-生育期内有效降水量-生育期内地下水利用量+犁地深度*(生育期开始土壤体积含水率-生育期结束时土壤含水率)]
							BigDecimal evapotranspiration1=cropsGrowthCycleList.get(j).getEvapotranspiration();//蒸发蒸腾量
							BigDecimal growthPeriodRainfall1= cropsGrowthCycleList.get(j).getGrowthPeriodRainfall();//生育期内有效降水量
							BigDecimal groundwater1 =cropsGrowthCycleList.get(j).getGroundwater();//生育期内地下水利用量
							BigDecimal soilHight1 = new BigDecimal( cropsGrowthCycleList.get(j).getComm6());//犁地深度
							BigDecimal growthPeriodSoilStart1 = cropsGrowthCycleList.get(j).getGrowthPeriodSoilStart();//生育期开始土壤体积含水率
							BigDecimal growthPeriodSoilEnd1 = cropsGrowthCycleList.get(j).getGrowthPeriodSoilEnd();//生育期结束时土壤含水率
							BigDecimal F6671=new BigDecimal("0.667");
							waterQuota1=F6671.multiply((evapotranspiration1.subtract(growthPeriodRainfall1).subtract(groundwater1)).add((soilHight1).multiply((growthPeriodSoilStart1.subtract(growthPeriodSoilEnd1)))));
							
							
							//灌水定额
							BigDecimal waterQuota2 = new BigDecimal("0.00");
							System.out.println("=======配水周期在生长周期内waterQuota========"+waterQuota2);
							//M旱作=0.667[蒸发蒸腾量-生育期内有效降水量-生育期内地下水利用量+犁地深度*(生育期开始土壤体积含水率-生育期结束时土壤含水率)]
							BigDecimal evapotranspiration2=cropsGrowthCycleList.get(j+1).getEvapotranspiration();//蒸发蒸腾量
							BigDecimal growthPeriodRainfall2= cropsGrowthCycleList.get(j+1).getGrowthPeriodRainfall();//生育期内有效降水量
							BigDecimal groundwater2 =cropsGrowthCycleList.get(j+1).getGroundwater();//生育期内地下水利用量
							BigDecimal soilHight2 = new BigDecimal( cropsGrowthCycleList.get(j+1).getComm6());//犁地深度
							BigDecimal growthPeriodSoilStart2 = cropsGrowthCycleList.get(j+1).getGrowthPeriodSoilStart();//生育期开始土壤体积含水率
							BigDecimal growthPeriodSoilEnd2 = cropsGrowthCycleList.get(j+1).getGrowthPeriodSoilEnd();//生育期结束时土壤含水率
							BigDecimal F6672=new BigDecimal("0.667");
							waterQuota2=F6672.multiply((evapotranspiration2.subtract(growthPeriodRainfall2).subtract(groundwater2)).add((soilHight2).multiply((growthPeriodSoilStart2.subtract(growthPeriodSoilEnd2)))));
							map.put(id, waterQuota1.add(waterQuota2));
							waterQuotaList.add(map);

						}

					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		BigDecimal totalWater = new BigDecimal("0");
		for(int n=0;n<needWaterReportList.size();n++){
			NeedWaterReport needWaterReport=needWaterService.selectByPrimaryKey(needWaterReportList.get(n).getId());
			
			String cropsCode = needWaterReport.getCropsType();
			
			String soilCode =needWaterReport.getSoilType();
			
			SoilTypeInfo soilTypeInfo1=soilsTypeInfoService.findsoilType(soilCode);
			//区域系数
			BigDecimal coefficientSoil = soilTypeInfo1.getCoefficientSoil();
			
			//提报面积
			BigDecimal area2  = needWaterReport.getArea();
			
			//所对应的农作物
			CropsTypeInfo  cropsTypeInfo=cropsTypeInfoService.selectBycropsCode(cropsCode);
			
			BigDecimal waterQuota = new BigDecimal("0");
			for(int m=0;m<waterQuotaList.size();m++){
				if(waterQuotaList.get(m).get(cropsTypeInfo.getId())!=null){
					waterQuota = waterQuota.add(waterQuotaList.get(m).get(cropsTypeInfo.getId()));
				}
			}
			
			totalWater = totalWater.add(waterQuota.multiply(area2));
			
		}
		return totalWater;
	}
	
	
	
	/*@RequestMapping("/getCropsInfo_scientific")
	@ResponseBody
	public Object getCropsInfo_scientific(HttpServletRequest request){		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		String soilType=request.getParameter("soilType");
		String cropsType=request.getParameter("cropsType");
		String startDayTime=request.getParameter("startDayTime");//配水开始日期
		String endDayTime=request.getParameter("endDayTime");//配水结束日期
		String area =request.getParameter("area");//农作物面积
		
		SoilTypeInfo soilTypeInfo =soilsTypeInfoService.findsoilType(soilType);
		
		CropsTypeInfo cropsTypeInfo = cropsTypeInfoService.selectBycropsCode(cropsType);
		List<CropsGrowthCycle> cropsGrowthCycleList=cropsGrowthCycleService.findGrowthCycleBy_soilType_cropsType(cropsTypeInfo.getId(),soilTypeInfo.getId());
		
		System.out.println("==============soilType================"+soilTypeInfo.getId());
		System.out.println("==============cropsType================"+cropsTypeInfo.getId());
		
		System.out.println("==============startDay================"+startDayTime);
		System.out.println("==============startDay================"+endDayTime);
		
		Date st = null;
		Date ed = null;
		try {
			st =format.parse(startDayTime);
			ed = format.parse(endDayTime);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		Date date1 = null;
		Date date2 = null;
		//计算配水天数
		int a = 0;
		try {
			date1 = format.parse(startDayTime);
			date2 = format.parse(endDayTime);
			a = (int) ((date2.getTime()-date1.getTime()) / (1000*3600*24));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("+++++++配水天数++a++++++++++++"+a);
		//double DeCount=0;
		BigDecimal DeCount = new BigDecimal(0);
		for(CropsGrowthCycle cropsGrowthCycle:cropsGrowthCycleList){
			//取每个生育周期的开始时间和结束时间
			Date stateDate =cropsGrowthCycle.getStateDate();
			Date endDate = cropsGrowthCycle.getEndDate();
			
			if(stateDate.before(ed) && endDate.after(st)){
				if(st.getTime()>=stateDate.getTime()&&ed.getTime()>=endDate.getTime()){
					int e =(int) ((st.getTime()-stateDate.getTime())/ (1000*3600*24));
				//	System.out.println("=========半个生育周期内的时间段b========"+b);
					System.out.println("=========半个生育周期内的时间段e========"+e);
					System.out.println("==============生育期名称b================"+cropsGrowthCycle.getCycleName());
					System.out.println("===============生育期每天耗水量b==============="+cropsGrowthCycle.getConsumedWater());
					System.out.println("==============stateDatebb================"+format.format(stateDate));
					System.out.println("==============endDatebb================"+format.format(endDate));
					
					BigDecimal F667=new BigDecimal("0.667");
					BigDecimal number = new BigDecimal(0);
					  
					
					int tadayCount1=Integer.parseInt(cropsGrowthCycle.getComm1())-e;
					// int value=score;
					   number=BigDecimal.valueOf((int)tadayCount1);
					
					   DeCount=DeCount.add(number.divide((new BigDecimal(cropsGrowthCycle.getComm1()))).multiply(cropsGrowthCycle.getNetIrrigationScientific()));
					
				}else if(ed.getTime()<=endDate.getTime() && st.getTime()<=stateDate.getTime()){
					
					System.out.println("==============生育期天数c================"+cropsGrowthCycle.getComm1());
					System.out.println("==============生育期名称c================"+cropsGrowthCycle.getCycleName());
					System.out.println("===============生育期每天耗水量c==============="+cropsGrowthCycle.getConsumedWater());
					
					System.out.println("==============stateDate=cc==============="+format.format(stateDate));
					System.out.println("==============endDate=cc==============="+format.format(endDate));
					//DeCount=DeCount+(Integer.parseInt(cropsGrowthCycle.getComm1()) *cropsGrowthCycle.getConsumedWater());
					DeCount=DeCount.add(cropsGrowthCycle.getNetIrrigationScientific());
				}else if(endDate.getTime()>=st.getTime()&&stateDate.getTime()<=ed.getTime()){
					
					int c =(int) ((st.getTime()-stateDate.getTime()) / (1000*3600*24));
					System.out.println("=========半个生育周期内的时间段d===减掉====="+c);
					System.out.println("==============生育期名称d================"+cropsGrowthCycle.getCycleName());
					System.out.println("==============生育期天数d================"+cropsGrowthCycle.getComm1());
					System.out.println("===============生育期每天耗水量d==============="+cropsGrowthCycle.getConsumedWater());
					System.out.println("==============stateDate==dd=============="+format.format(stateDate));
					System.out.println("==============endDate==dd=============="+format.format(endDate));
					
				//	DeCount=DeCount+(Integer.parseInt(cropsGrowthCycle.getComm1()) *cropsGrowthCycle.getConsumedWater());
					DeCount=DeCount.add(cropsGrowthCycle.getNetIrrigationScientific());
				}else if(stateDate.getTime()>=st.getTime()){
					int c =(int) ((stateDate.getTime()-st.getTime()) / (1000*3600*24));
					System.out.println("=========半个生育周期内的时间段e========"+c);
					System.out.println("==============生育期名称e================"+cropsGrowthCycle.getCycleName());
					System.out.println("===============生育期每天耗水量e==============="+cropsGrowthCycle.getConsumedWater());
					System.out.println("==============stateDate==ee=============="+format.format(stateDate));
					System.out.println("==============endDate==ee=============="+format.format(endDate));
					BigDecimal number = new BigDecimal(0);
					
					int tadayCount1=Integer.parseInt(cropsGrowthCycle.getComm1())-c;
					
					number=BigDecimal.valueOf((int)tadayCount1);
					//DeCount=DeCount+(tadayCount1*cropsGrowthCycle.getConsumedWater());
					 DeCount=DeCount.add(number.divide((new BigDecimal(cropsGrowthCycle.getComm1()))).multiply(cropsGrowthCycle.getNetIrrigationScientific()));
						
				}
			}
			
		}
		BigDecimal areaBg=new BigDecimal(area);
		BigDecimal irrigatingWater=DeCount.multiply(areaBg);
		
		System.out.println("===========DeCount============="+irrigatingWater);
		return irrigatingWater;
	}*/
	
	@RequestMapping("/getCropsInfo_experience")
	@ResponseBody
	public Object getCropsInfo_experience(HttpServletRequest request){		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		String soilType=request.getParameter("soilType");
		String cropsType=request.getParameter("cropsType");
		String startDayTime=request.getParameter("startDayTime");//配水开始日期
		String endDayTime=request.getParameter("endDayTime");//配水结束日期
		String area =request.getParameter("area");//农作物面积
		
		String canalCode =request.getParameter("canalCode");
		
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        Date date = new Date();
       int  year=Integer.parseInt(sdf.format(date)) ;
		
		SoilTypeInfo soilTypeInfo =soilsTypeInfoService.findsoilType(soilType);
		//各种农作物标准灌水定额集合
		List<Map<String,BigDecimal>> waterQuotaList = new ArrayList<>();
		//所有提报农作名称
		//拿到河道的需水提报
		List<NeedWaterReport> needWaterReportList= needWaterService.findNeedWaterReportByCanalCodeAndYear(canalCode,year);
		
		List<NeedWaterReport> needWaterReportGroupList= needWaterService.findNeedWaterReportByCanalCodeAndYearGroupByCropsType(canalCode,year);
		
		try {
			for (int i = 0; i < needWaterReportGroupList.size(); i++) {

				String cropsTypeCode = needWaterReportGroupList.get(i)
						.getCropsType();

				CropsTypeInfo cropsTypeInfo = cropsTypeInfoService
						.findCropsTypeByCode(cropsTypeCode);
				//拿到农作物id
				String id = cropsTypeInfo.getId();
				//根据农作物id查询该农作物所有的生长周期
				List<CropsGrowthCycle> cropsGrowthCycleList = cropsGrowthCycleService
						.findCropsTypeIdGrowthCycleList(id);
				for (int j = 0; j < cropsGrowthCycleList.size(); j++) {

					//周期开始月份
					long cycleStartMonth = cropsGrowthCycleList.get(j)
							.getStateDate().getTime();
					//周期结束月份
					long cycleEndMonth = cropsGrowthCycleList.get(j)
							.getEndDate().getTime();

					//配水开始日期月份
					long planStartMonth = format.parse(startDayTime).getTime();
					//配水结束日期月份
					long planEndMonth = format.parse(endDayTime).getTime();
					System.out.println("判断开始---------------------------------");
					if (planStartMonth >= cycleStartMonth
							&& planStartMonth < cycleEndMonth) {
						System.out.println("判断1---------------------------------");
						if (planEndMonth < cycleEndMonth) {//配水周期在生长周期内
							System.out.println("判断2---------------------------------");
							//waterQuotaList.add();
							//日耗水量
							BigDecimal consumedWater = cropsGrowthCycleList
									.get(j).getConsumedWater();
							//天数
							long day = (format.parse(endDayTime).getTime() - format
									.parse(startDayTime).getTime())
									/ (1000 * 3600 * 24);
							//灌水定额
							BigDecimal waterQuota = consumedWater
									.multiply(new BigDecimal(day));
							//地亩数
							//BigDecimal totalarea = needWaterReportList.get(i).getArea();
							Map<String, BigDecimal> map = new HashMap<>();

							System.out.println("=======配水周期在生长周期内waterQuota========"+waterQuota);
							map.put(id, waterQuota);

							waterQuotaList.add(map);

						} else if (planEndMonth >= cropsGrowthCycleList.get(j)
								.getEndDate().getTime()
								&& planEndMonth < cropsGrowthCycleList
										.get(j + 1).getEndDate().getTime()) {//相邻周期
							System.out.println("判断3---------------------------------");
							long day1 = (cropsGrowthCycleList.get(j)
									.getEndDate().getTime() - format.parse(
									startDayTime).getTime())
									/ (1000 * 3600 * 24);
							long day2 = (format.parse(endDayTime).getTime() - cropsGrowthCycleList
									.get(j).getEndDate().getTime())
									/ (1000 * 3600 * 24);

							//日耗水量
							BigDecimal consumedWater1 = cropsGrowthCycleList
									.get(j).getConsumedWater();
							BigDecimal consumedWater2 = cropsGrowthCycleList
									.get(j + 1).getConsumedWater();

							//灌水定额
							BigDecimal waterQuota1 = consumedWater1
									.multiply(new BigDecimal(day1));
							BigDecimal waterQuota2 = consumedWater2
									.multiply(new BigDecimal(day2));
							System.out.println("=======相邻周期waterQuota1========"+waterQuota1);
							System.out.println("=======相邻周期waterQuota2========"+waterQuota2);

							Map<String, BigDecimal> map = new HashMap<>();

							map.put(id, waterQuota1.add(waterQuota2));

							waterQuotaList.add(map);

						} else if (planEndMonth >= cropsGrowthCycleList
								.get(j + 1).getEndDate().getTime()) {//中间隔n个周期
							//相隔周期数
							List<CropsGrowthCycle> list = new ArrayList<>();
							System.out.println("判断4---------------------------------");
							for (int k = j + 1; k < cropsGrowthCycleList.size(); k++) {
								list.add(cropsGrowthCycleList.get(k));
								if (planEndMonth >= cropsGrowthCycleList.get(k)
										.getStateDate().getTime()
										&& planEndMonth < cropsGrowthCycleList
												.get(k).getEndDate().getTime()) {
									break;
								}
							}
							//中间间隔周期得灌水
							BigDecimal totalWaterQuota = new BigDecimal("0");
							for (int l = 0; l < list.size(); l++) {

								totalWaterQuota = totalWaterQuota.add((list
										.get(l).getConsumedWater())
										.multiply(new BigDecimal((list.get(l)
												.getEndDate().getTime() - list
												.get(l).getEndDate().getTime())
												/ (1000 * 3600 * 24))));

							}

							long day1 = (cropsGrowthCycleList.get(j)
									.getEndDate().getTime() - format.parse(
									startDayTime).getTime())
									/ (1000 * 3600 * 24);
							long day2 = (format.parse(endDayTime).getTime() - cropsGrowthCycleList
									.get(j).getEndDate().getTime())
									/ (1000 * 3600 * 24);

							//日耗水量
							BigDecimal consumedWater1 = cropsGrowthCycleList
									.get(j).getConsumedWater();
							BigDecimal consumedWater2 = cropsGrowthCycleList
									.get(j + 1).getConsumedWater();

							//灌水定额
							BigDecimal waterQuota1 = consumedWater1
									.multiply(new BigDecimal(day1));
							BigDecimal waterQuota2 = consumedWater2
									.multiply(new BigDecimal(day2));
							System.out.println("==========waterQuota1中间隔n个周期============="+waterQuota1);
							System.out.println("==========waterQuota2中间隔n个周期============="+waterQuota2);
							
							totalWaterQuota = (totalWaterQuota.add(waterQuota1))
									.add(waterQuota2);

							Map<String, BigDecimal> map = new HashMap<>();

							map.put(id, totalWaterQuota);

							waterQuotaList.add(map);

						}

					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		BigDecimal totalWater = new BigDecimal("0");
		for(int n=0;n<needWaterReportList.size();n++){
			NeedWaterReport needWaterReport=needWaterService.selectByPrimaryKey(needWaterReportList.get(n).getId());
			
			String cropsCode = needWaterReport.getCropsType();
			
			String soilCode =needWaterReport.getSoilType();
			
			SoilTypeInfo soilTypeInfo1=soilsTypeInfoService.findsoilType(soilCode);
			//区域系数
			BigDecimal coefficientSoil = soilTypeInfo1.getCoefficientSoil();
			
			//提报面积
			BigDecimal area2  = needWaterReport.getArea();
			
			//所对应的农作物
			CropsTypeInfo  cropsTypeInfo=cropsTypeInfoService.selectBycropsCode(cropsCode);
			
			BigDecimal waterQuota = new BigDecimal("0");
			for(int m=0;m<waterQuotaList.size();m++){
				if(waterQuotaList.get(m).get(cropsTypeInfo.getId())!=null){
					waterQuota = waterQuota.add(waterQuotaList.get(m).get(cropsTypeInfo.getId()));
				}
			}
			
			totalWater = totalWater.add(waterQuota.multiply(coefficientSoil).multiply(area2));
			
		}
		return totalWater;
	}
	
	
	@RequestMapping(value="/add")
	public String add(WaterPlanNew waterPlanNew,HttpServletRequest request){
		
		/*int startYear = waterPlan.getStartYear();
		int endYear = waterPlan.getStartYear();
		int startMonth = waterPlan.getStartMonth();
		int startDay = waterPlan.getStartDay();
		int endMonth = waterPlan.getEndMonth();
		int endDay = waterPlan.getEndDay();*/
		
		int startYear = 0;
		int endYear = 0;
		int startMonth = 0;
		int startDay = 0;
		int endMonth = 0;
		int endDay = 0;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy"); //年
		SimpleDateFormat format2 = new SimpleDateFormat("MM");//月
		SimpleDateFormat format3 = new SimpleDateFormat("dd");//天
		
		String startDayTime = request.getParameter("startDayTime");
		String endDayTime = request.getParameter("endDayTime");
		String totalArea = request.getParameter("totalArea");//从页面上获得的总亩数
		
		String waterdutySt = request.getParameter("waterduty");//灌水定额
		BigDecimal waterduty = new BigDecimal(waterdutySt);
		
		
		try {
			Date startDate =format.parse(startDayTime);
			Date endDate =format.parse(endDayTime);
			startYear=Integer.parseInt(format1.format(startDate)); //配水开始年份
			endYear=Integer.parseInt(format1.format(endDate)); //配水结束年份
			
			startMonth=Integer.parseInt(format2.format(startDate)); //配水开始月份
			endMonth=Integer.parseInt(format2.format(endDate)); //配水结束月份
			
			startDay=Integer.parseInt(format3.format(startDate)); //配水开始天
			endDay=Integer.parseInt(format3.format(endDate)); //配水结束天
			
			//设置时间
			waterPlanNew.setStartYear(startYear);
			waterPlanNew.setStartMonth(startMonth);
			waterPlanNew.setStartDay(startDay);
			
			waterPlanNew.setEndYear(endYear);
			waterPlanNew.setEndMonth(endMonth);
			waterPlanNew.setEndDay(endDay);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		int totalDays = getBetweenDays(startYear,endYear,startMonth,endMonth,startDay,endDay);
		
		System.out.println("1111111=========================totalDays==============="+totalDays);
		//设置间隔天数
		waterPlanNew.setTotalDays(totalDays);
		
		BigDecimal riverComeWater = getWaterCome(waterPlanNew,startYear,endYear,startMonth,endMonth,startDay,endDay);
		
		System.out.println("222222=========================riverComeWater==============="+riverComeWater);
		
		
		//设置本段时间河源产水量
		waterPlanNew.setRiverComeWater(riverComeWater);
		//上期结束水库库容
		waterPlanNew.setLastTurnCapacity(new BigDecimal("506.67"));
		
		System.out.println("=============waterPlanNew.getCanalCode()==============="+waterPlanNew.getCanalCode());
		//渠道水权面积
		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalByCode(waterPlanNew.getCanalCode());
		waterPlanNew.setCanalDecisionArea(calCanalInfo.getDecisionArea());
		System.out.println("333333=========================calCanalInfo.getDecisionArea()==============="+calCanalInfo.getDecisionArea());
		//实际配水面积
		List<NeedWaterReport> needWaterReportList = needWaterService.findNeedWaterReportByCanalCodeAndYear(waterPlanNew.getCanalCode(),startYear);
		
		BigDecimal realityArea = new BigDecimal("0");
		for(int i=0;i<needWaterReportList.size();i++){
			realityArea = realityArea.add(needWaterReportList.get(i).getArea());
		}
		System.out.println("444444=========================realityArea==============="+realityArea);
		
		waterPlanNew.setRealityArea(realityArea);
		//配水比例
		waterPlanNew.setMatching(calCanalInfo.getDecisionArea().compareTo(new BigDecimal(0))>0
				?realityArea.divide(calCanalInfo.getDecisionArea(),2,BigDecimal.ROUND_HALF_UP)
				:new BigDecimal(0));
		//平均灌水定额
		/*List<NeedWaterReport> needWaterReportList2 = needWaterService.findNeedWaterReportByCanalCodeAndYear(waterPlanNew.getCanalCode(),startYear);
		List<WaterAuota> waterAuotaList = new ArrayList<WaterAuota>();*/
		/*for(int i=0;i<needWaterReportList2.size();i++){
			String soilTypeCode = needWaterReportList2.get(i).getSoilType();
			String cropsTypeCode = needWaterReportList2.get(i).getCropsType();
			WaterAuota waterAuota=waterAuotaService.findWaterAuotaBySoilAndCrops(soilTypeCode,cropsTypeCode);
			
			waterAuotaList.add(waterAuota);
		}*/
		/*BigDecimal totalAuota = new BigDecimal("0");
		for(int j=0;j<waterAuotaList.size();j++){
			totalAuota = totalAuota.add(waterAuotaList.get(j).getWaterQuota());
		}*/
		System.out.println("44444411=========================realityArea==============="+realityArea);
		
		waterPlanNew.setWaterDistributionQuota(waterduty.divide(new BigDecimal(totalArea),2,BigDecimal.ROUND_HALF_UP));//平均灌水定额
		//农田净用水量
		List<NeedWaterReport> needWaterReportList3 = needWaterService.findNeedWaterReportByCanalCodeAndYear(waterPlanNew.getCanalCode(),startYear);
		BigDecimal soilWaterNetAmount = new BigDecimal("0");
		
		/*for(int i=0;i<needWaterReportList3.size();i++){
			String soilTypeCode = needWaterReportList3.get(i).getSoilType();
			String cropsTypeCode = needWaterReportList3.get(i).getCropsType();
			WaterAuota waterAuota=waterAuotaService.findWaterAuotaBySoilAndCrops(soilTypeCode,cropsTypeCode);
			
		}*/
		BigDecimal zo = new BigDecimal("0");
		soilWaterNetAmount = soilWaterNetAmount.add(new BigDecimal(totalArea).multiply(waterduty));
		waterPlanNew.setSoilWaterNetAmount(soilWaterNetAmount);
		System.out.println("44444422=========================realityArea==============="+realityArea);
		//水利用率
		waterPlanNew.setSoilWaterNetAmountRatio(calCanalInfo.getMathing());
		//农田毛用水量
		waterPlanNew.setSoilWaterAllAmount(soilWaterNetAmount.divide(calCanalInfo.getMathing(),4,BigDecimal.ROUND_HALF_UP));
		//水库需供水量
		BigDecimal life_water_amount = waterPlanNew.getLifeWaterAmount();
		BigDecimal machine_water_amount = waterPlanNew.getMachineWaterAmount();
		BigDecimal forest_water_amount = waterPlanNew.getForestWaterAmount();
		BigDecimal other_water_amount = waterPlanNew.getOtherWaterAmount();
		BigDecimal soil_water_all_amount = waterPlanNew.getSoilWaterAllAmount();
		
		System.out.println("************life_water_amount**************"+life_water_amount);
		System.out.println("************machine_water_amount**************"+machine_water_amount);
		System.out.println("************forest_water_amount**************"+forest_water_amount);
		System.out.println("************other_water_amount**************"+other_water_amount);
		System.out.println("************soil_water_all_amount**************"+soil_water_all_amount);
		
		if(life_water_amount==null){
			life_water_amount=zo;
		}else if(machine_water_amount==null){
			machine_water_amount=zo;
		}else if(forest_water_amount==null){
			forest_water_amount=zo;
		}else if(other_water_amount==null){
			other_water_amount=zo;
		}else if(soil_water_all_amount==null){
			soil_water_all_amount=zo;
		}
		
		BigDecimal need_reservoir_water_amount = (((life_water_amount.add(machine_water_amount)).add(forest_water_amount)).add(other_water_amount)).add(soil_water_all_amount);
		System.out.println("44444433=========================realityArea==============="+realityArea);
		waterPlanNew.setNeedReservoirWaterAmount(need_reservoir_water_amount);
		//本轮结束水库库容
		waterPlanNew.setOwnTurnCapacity((riverComeWater.add(waterPlanNew.getLastTurnCapacity())).subtract(need_reservoir_water_amount));
		
		//创建时间
		waterPlanNew.setCreateTime(new Date());

		//与siteMiddleCanal中间表关联外键
		waterPlanNew.setComm1(new Date().getTime()+waterPlanNew.getCanalCode());
		
		System.out.println("44444455=========================realityArea==============="+realityArea);
		
		int a = waterPlanNewService.addWaterPlanNew(waterPlanNew);

		//中间表数据修改
		//siteMiddleCanal中间表插入或更新
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.updateSiteMiddle("calCanal",waterPlanNew.getCanalCode(),
				"plan_new_code",waterPlanNew.getComm1(),request);
		
		return "redirect:/plan/list?state=33";
	} 
	
	
	
	@RequestMapping(value="/page")
	public @ResponseBody List<WaterPlanNew> page(String canalId,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="10") Integer pageSize){
			//当前点击的区域
			//把当前的区域加入到列表中
//			System.out.println("=========canalId============="+canalId);
//			CalCanalInfo calCanalInfo= calCanalInfoService.findCanalById(canalId);
//			String canalCode = calCanalInfo.getCanalCode();
			PageHelper.startPage(page, pageSize);
//			System.out.println("===========canalCode============="+canalCode);
//			List<WaterPlanNew> list = waterPlanNewService.findWaterPlanByCanalCode(canalCode);
//			System.out.println("==================="+list.size());
//			for(WaterPlanNew WaterPlanNew:list){
//				System.out.println("===================="+WaterPlanNew.getWateringName());
//			}

			List<WaterPlanNew> list = waterPlanNewService.findWaterPlanNewByCanalCodeJoin(canalId);
			PageInfo<WaterPlanNew> pages = new PageInfo<WaterPlanNew>(list);
			request.getSession().setAttribute("waterPlanPages", pages);
		return list;
	}

	@RequestMapping(value = "/get_year_list", produces = "text/html; charset=utf-8")
	public @ResponseBody String getYearList(String canalCode){
		List<NeedWaterReport> needWaterReportList=needWaterService.findCanaCodeByNeedWaterReportList(canalCode);
		Set<Integer> collect = needWaterReportList.stream().map(x -> x.getYear()).collect(Collectors.toSet());
		return JSONObject.toJSONString(collect);
	}

	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<WaterPlanNew> pageNav(HttpServletRequest request){
		PageInfo<WaterPlanNew> pages = (PageInfo<WaterPlanNew>) request.getSession().getAttribute("waterPlanPages");
		return pages;
	}
	
	
	
	@RequestMapping(value="/detail_all_page")
	public String detailAllPage(String canalCode,int startYear,Model model){
		//List<WaterPlan> waterPlanList = waterPlanService.findWaterPlansByCanalCodeAndStartYear(canalCode,startYear);
		//TODO
		CalCanalInfo info = calCanalInfoService.findCanalByCode(canalCode);
		model.addAttribute("canalCode", canalCode);
		model.addAttribute("canalName",info.getCanalName());
		model.addAttribute("startYear", startYear);
		return DETAIL_All_JSP;
	}
	
	
	@RequestMapping(value="/detail_page")
	public @ResponseBody List<WaterPlanNew> detailPage(String canalCode,int startYear,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
			//当前点击的区域
			//把当前的区域加入到列表中
		
			PageHelper.startPage(page, pageSize);
			List<WaterPlanNew> list = waterPlanNewService.findWaterPlanNewsByCanalCodeAndStartYear(canalCode,startYear);
			
			PageInfo<WaterPlanNew> pages = new PageInfo<WaterPlanNew>(list);
			request.getSession().setAttribute("detailPages", pages);
			
		return list;
	}
	
	
	@RequestMapping(value="/detail_page_nav")
	public @ResponseBody PageInfo<WaterPlanNew> detailPageNav(HttpServletRequest request){
		PageInfo<WaterPlanNew> pages = (PageInfo<WaterPlanNew>) request.getSession().getAttribute("detailPages");
		return pages;
	}
	
	
	//判断年份
	//1闰年 0平年
	public int isYear(int y){
		
		if(y%4==0){
			if(y%100==0){
				if(y%400==0){//能被400整除的，是闰年
					return 1;
				}else{ //能被100整除，但不能被400整除的，不是闰年
					return 0;
				}
			}else{//能被4整除，但不能被100整除的，不是闰年
				return 0;
			}
		}else{ //不能被4整除的，不是闰年
			return 0;
		}
		
	}
	//判断月份
	//0 31天  1 30天  2 28天 3 29天
	public int isMonth(int month,int year){
		
		if(month==1||month==3||month==5||month==7||month==8||month==10||month==12){
			return 0;
					
		}else if(month==4||month==6||month==9||month==11){
			return 1;
			
		}else{
			if(isYear(year)==0){
				return 2;//平年
			}else{
				return 3;//闰年
			}
		}
		
	}
	
	public BigDecimal getWaterCome(WaterPlanNew waterPlanNew,int startYear,int endYear,int startMonth,int endMonth,int startDay,int endDay){
		BigDecimal riverComeWater = new BigDecimal("0");
		
		if(startYear==endYear){
			//月份相等
			if(startMonth==endMonth){
				ForecastWaterTable forecastWaterTable = forecastWaterService.findForecastWaterTable(startYear,startMonth,waterPlanNew.getCanalCode());
				if(forecastWaterTable!=null){
					if(startDay<=10&&endDay<=10){
						
						int a = endDay-startDay;
						
						BigDecimal b = new BigDecimal(a);
						
						riverComeWater = b.multiply(forecastWaterTable.getEarlyTen());
						
					}else if(startDay<=10 &&endDay>10&&endDay<=20){
						int a1 = 10-startDay+1;
						
						BigDecimal c1 = new BigDecimal(a1);
						
						int b1 = endDay-10;
						
						BigDecimal d1 = new BigDecimal(b1);
						
						riverComeWater = (c1.multiply(forecastWaterTable.getEarlyTen())).add(d1.multiply(forecastWaterTable.getMiddleTen()));
						
					}else if(startDay<=10&&endDay>20){
						int a2 = 10-startDay+1;
						
						BigDecimal d2 = new BigDecimal(a2);
						
						int b2 = 10;
						
						BigDecimal e2 = new BigDecimal(b2);
						
						int c2 = endDay-20;
						
						BigDecimal f2 = new BigDecimal(c2);
						
						riverComeWater = ((d2.multiply(forecastWaterTable.getEarlyTen())).add(e2.multiply(forecastWaterTable.getMiddleTen()))).add(f2.multiply(forecastWaterTable.getLastTen()));
						
						
					}else if(startDay>10&&startDay<=20&&endDay>10&&endDay<=20){
						
						int a3 = endDay-startDay;
						
						BigDecimal b3 = new BigDecimal(a3);
						
						riverComeWater = b3.multiply(forecastWaterTable.getMiddleTen());
						
					}else if(startDay>10&&startDay<=20&&endDay>20){
						int a4 = 20-startDay+1;
						
						BigDecimal c4 = new BigDecimal(a4);
						int b4 = endDay-20;
						BigDecimal d4 = new BigDecimal(b4);
						
						riverComeWater = (c4.multiply(forecastWaterTable.getEarlyTen())).add(d4.multiply(forecastWaterTable.getMiddleTen()));
						
					}else if(startDay>20&&endDay>20){
						
						int a5 = endDay-startDay;
						
						BigDecimal b5 = new BigDecimal(a5);
						
						riverComeWater = b5.multiply(forecastWaterTable.getLastTen());
					}
				}
				
			//月份不等	
			}else if(endMonth-startMonth==1){
				//前一月
				ForecastWaterTable forecastWaterTable2 = forecastWaterService.findForecastWaterTable(startYear,startMonth,waterPlanNew.getCanalCode());
				//前一月流量
				BigDecimal lastComeWater = new BigDecimal("0");
				if(forecastWaterTable2!=null){
			
				if(startDay<=10){
					long a6 = 10-(long)startDay+1;
					long b6 = 0;
					long c6 = 0;
					
					if(isMonth(startMonth, startYear)==0){
						b6 = 10;
						c6 = 11;
					}else if(isMonth(startMonth, startYear)==1){
						b6 = 10;
						c6 = 10;
					}else if(isMonth(startMonth, startYear)==2){
						b6 = 10;
						c6 = 8;
					}else if(isMonth(startMonth, startYear)==3){
						b6 = 10;
						c6 = 9;
					}
					long d6 = (long) (a6*forecastWaterTable2.getEarlyTen().doubleValue()+b6*forecastWaterTable2.getMiddleTen().doubleValue()+c6*forecastWaterTable2.getLastTen().doubleValue());
					lastComeWater = new BigDecimal(d6);
					
					
				}else if(startDay<=20&&startDay>10){
					long a7 = 20-(long)startDay+1;
					long b7 = 0;
					
					if(isMonth(startMonth, startYear)==0){
						b7 = 11;
					}else if(isMonth(startMonth, startYear)==1){
						b7 = 10;
					}else if(isMonth(startMonth, startYear)==2){
						b7 = 8;
					}else if(isMonth(startMonth, startYear)==3){
						b7 = 9;
					}
					
					long d7 = (long) (a7*forecastWaterTable2.getMiddleTen().doubleValue()+b7*forecastWaterTable2.getLastTen().doubleValue());
					lastComeWater = new BigDecimal(d7);
					
				}else if(startDay>20){
					
					long a8 = 0;
					
					if(isMonth(startMonth, startYear)==0){
						a8 = 31-startDay;
					}else if(isMonth(startMonth, startYear)==1){
						a8 = 30-startDay;
					}else if(isMonth(startMonth, startYear)==2){
						a8 = 28-startDay;
					}else if(isMonth(startMonth, startYear)==3){
						a8 = 29-startDay;
					}
					
					long d8 = (long) (a8*forecastWaterTable2.getLastTen().doubleValue());
					lastComeWater = new BigDecimal(d8);
				}
			}
				//后一月
					
				ForecastWaterTable forecastWaterTable3 = forecastWaterService.findForecastWaterTable(endYear,endMonth,waterPlanNew.getCanalCode());
				//前一月流量
				BigDecimal nextComeWater = new BigDecimal("0");
			if(forecastWaterTable3!=null){
				if(endDay<=10){
					
					long d9 = (long) (endDay*forecastWaterTable3.getLastTen().doubleValue());
					nextComeWater = new BigDecimal(d9);
					
				}else if(endDay<=20&&endDay>10){
					
					long a9 = 10;
					long b9 = endDay-10;
					long c9 = (long) (a9*forecastWaterTable3.getEarlyTen().doubleValue()+b9*forecastWaterTable3.getMiddleTen().doubleValue());
					nextComeWater = new BigDecimal(c9);
					
				}else if(endDay>20){
					
					long a10 = 10;
					long b10 = 10;
					long c10 = endDay-20;
					long d10 = (long) (a10*forecastWaterTable3.getEarlyTen().doubleValue()+b10*forecastWaterTable3.getMiddleTen().doubleValue()+c10*forecastWaterTable3.getLastTen().doubleValue());
					nextComeWater = new BigDecimal(d10);
				}
			}	
				
						
				riverComeWater = nextComeWater.add(lastComeWater);
				
			}else if(endMonth-startMonth>1){
				System.out.println("[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[1111111");
				//首月
				
				System.out.println("[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[======="+startYear+"---"+startMonth+"---");
				System.out.println("[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[======="+waterPlanNew.getCanalCode());
				//首月流量
				BigDecimal oneComeWater = new BigDecimal("0");
				ForecastWaterTable forecastWaterTable4 = forecastWaterService.findForecastWaterTable(startYear,startMonth,waterPlanNew.getCanalCode());
				if(forecastWaterTable4!=null){
					System.out.println("[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[222forecastWaterTable4222"+"======="+forecastWaterTable4.getForecastId());
					if(startDay<=10){
						System.out.println("[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[222222");
						long a11= 10-(long)startDay+1;
						long b11 = 0;
						long c11 = 0;
						
						if(isMonth(startMonth, startYear)==0){
							b11 = 10;
							c11 = 11;
						}else if(isMonth(startMonth, startYear)==1){
							b11 = 10;
							c11 = 10;
						}else if(isMonth(startMonth, startYear)==2){
							b11 = 10;
							c11 = 8;
						}else if(isMonth(startMonth, startYear)==3){
							b11 = 10;
							c11 = 9;
						}
						long d11 = (long) (a11*forecastWaterTable4.getEarlyTen().doubleValue()+b11*forecastWaterTable4.getMiddleTen().doubleValue()+c11*forecastWaterTable4.getLastTen().doubleValue());
						oneComeWater = new BigDecimal(d11);
						
						
					}else if(startDay<=20&&startDay>10){
						long a12 = 20-(long)startDay+1;
						long b12 = 0;
						
						if(isMonth(startMonth, startYear)==0){
							b12 = 11;
						}else if(isMonth(startMonth, startYear)==1){
							b12 = 10;
						}else if(isMonth(startMonth, startYear)==2){
							b12 = 8;
						}else if(isMonth(startMonth, startYear)==3){
							b12= 9;
						}
						
						long d12 = (long) (a12*forecastWaterTable4.getMiddleTen().doubleValue()+b12*forecastWaterTable4.getLastTen().doubleValue());
						oneComeWater = new BigDecimal(d12);
						
					}else if(startDay>20){
						
						long a13 = 0;
						
						if(isMonth(startMonth, startYear)==0){
							a13 = 31-startDay;
						}else if(isMonth(startMonth, startYear)==1){
							a13 = 30-startDay;
						}else if(isMonth(startMonth, startYear)==2){
							a13 = 28-startDay;
						}else if(isMonth(startMonth, startYear)==3){
							a13 = 29-startDay;
						}
						
						long d13 = (long) (a13*forecastWaterTable4.getLastTen().doubleValue());
						oneComeWater = new BigDecimal(d13);
					}
				}
				
				//间隔月
				double d14=0;
				ForecastWaterTable forecastWaterTable5 = null ;
				int midMonth = startMonth+1;
				forecastWaterTable5 = forecastWaterService.findForecastWaterTable(endYear,midMonth,waterPlanNew.getCanalCode());
				if(forecastWaterTable5!=null){
					while(midMonth<endMonth){
						
						int a14=0;
						int b14=0;
						int c14=0;
						
						if(isMonth(midMonth, startYear)==0){
							a14 = 10;
							b14 = 10;
							c14 = 11;
							d14 = d14 + (long) (a14*forecastWaterTable5.getEarlyTen().doubleValue()+b14*forecastWaterTable5.getMiddleTen().doubleValue()+c14*forecastWaterTable5.getLastTen().doubleValue());
							
						}else if(isMonth(midMonth, startYear)==1){
							a14 = 10;
							b14 = 10;
							c14 = 10;
							d14 = d14 + (long) (a14*forecastWaterTable5.getEarlyTen().doubleValue()+b14*forecastWaterTable5.getMiddleTen().doubleValue()+c14*forecastWaterTable5.getLastTen().doubleValue());
						}else if(isMonth(midMonth, startYear)==2){
							a14 = 10;
							b14 = 10;
							c14 = 8;
							d14 = d14 + (long) (a14*forecastWaterTable5.getEarlyTen().doubleValue()+b14*forecastWaterTable5.getMiddleTen().doubleValue()+c14*forecastWaterTable5.getLastTen().doubleValue());
						}else if(isMonth(midMonth, startYear)==3){
							a14 = 10;
							b14 = 10;
							c14 = 9;
							d14 = d14 + (long) (a14*forecastWaterTable5.getEarlyTen().doubleValue()+b14*forecastWaterTable5.getMiddleTen().doubleValue()+c14*forecastWaterTable5.getLastTen().doubleValue());
						}
						
						midMonth=midMonth+1;
					}
				}
				BigDecimal midComeWater = new BigDecimal("0");
				
				
				midComeWater = new BigDecimal(d14);
				
				//尾月
				if(endDay<=10){
					
				}else if(endDay<=20&&endDay>10){
					
				}else if(endDay>20){
					
				}
				
				ForecastWaterTable forecastWaterTable3 = forecastWaterService.findForecastWaterTable(endYear,endMonth,waterPlanNew.getCanalCode());
				//尾月流量
				BigDecimal endComeWater = new BigDecimal("0");
				if(forecastWaterTable3!=null){
					if(endDay<=10){
						
						long d9 = (long) (endDay*forecastWaterTable3.getLastTen().doubleValue());
						endComeWater = new BigDecimal(d9);
						
					}else if(endDay<=20&&endDay>10){
						
						long a9 = 10;
						long b9 = endDay-10;
						long c9 = (long) (a9*forecastWaterTable3.getEarlyTen().doubleValue()+b9*forecastWaterTable3.getMiddleTen().doubleValue());
						endComeWater = new BigDecimal(c9);
						
					}else if(endDay>20){
						long a10 = 10;
						long b10 = 10;
						long c10 = endDay-20;
						long d10 = (long) (a10*forecastWaterTable3.getEarlyTen().doubleValue()+b10*forecastWaterTable3.getMiddleTen().doubleValue()+c10*forecastWaterTable3.getLastTen().doubleValue());
						endComeWater = new BigDecimal(d10);
					}
				}
				riverComeWater = (oneComeWater.add(endComeWater)).add(midComeWater);
			}
		}
		
		return riverComeWater;
	}
	
	
	
	public int getBetweenDays(int startYear,int endYear,int startMoth,int endMonth,int startDay,int endDay){
		Calendar beginCalendar = Calendar.getInstance();
		beginCalendar.set(startYear,startMoth,startDay,0,0,0);      //设定时间为2017年3月3日 1:0:0   
		Calendar endCalendar = Calendar.getInstance();
		endCalendar.set(endYear,endMonth,endDay,0,0,0);       //设定时间为2017年3月3日 14:0:0   
		long beginTime = beginCalendar.getTime().getTime();   
		long endTime = endCalendar.getTime().getTime();   
		long betweenDays = (long)((endTime - beginTime) / (1000 * 60 * 60 *24)); 
		
		return (int)betweenDays;
	}
}


