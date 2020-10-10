package com.zyjz.plan.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.plan.entity.ForecastWaterTable;
import com.zyjz.plan.entity.NeedWaterReport;
import com.zyjz.plan.entity.WaterAuota;
import com.zyjz.plan.entity.WaterPlan;
import com.zyjz.plan.service.ForecastWaterService;
import com.zyjz.plan.service.NeedWaterService;
import com.zyjz.plan.service.WaterAuotaService;
import com.zyjz.plan.service.WaterPlanService;
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
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value= "/plan")
public class PlanController {
	
	
	@Autowired
	CalCanalInfoService calCanalInfoService;
	@Autowired
	ForecastWaterService forecastWaterService;
	
	@Autowired
	NeedWaterService needWaterService;
	
	@Autowired
	WaterAuotaService waterAuotaService;
	@Autowired
	WaterPlanService waterPlanService;
	
	
	
	/** 视图解析页面路径 */
	protected static final String WATER_PLAN_JSP = "/plan/water_distribution/list";
	protected static final String ADD_PLAN_JSP = "/plan/water_distribution/add_plan";
	protected static final String DETAIL_All_JSP = "/plan/water_distribution/detail_all";
	
	
	
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request){
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		//渠道树
		/*List<CalCanalInfo> calCanalInfoList = calCanalInfoService.findAllCanal();
		model.addAttribute("calCanalInfoList", calCanalInfoList);
		
		for(int j=0;j<calCanalInfoList.size();j++){
			String parentId = calCanalInfoList.get(j).getCanalParentId();
			if(parentId==null||"".equals(parentId)){
				model.addAttribute("canalId", calCanalInfoList.get(j).getId());
				break;
			}
		}*/
		return WATER_PLAN_JSP;
	}
	
	@RequestMapping(value="/add_page")
	public String addPage(Model model,String canalId){
		CalCanalInfo calCanalInfo= calCanalInfoService.findCanalByCode(canalId);
		model.addAttribute("canalCode", calCanalInfo.getCanalCode());
		//List<SoilTypeInfo> soilTypeInfoList =soilTypeService.findAll();
		//model.addAttribute("soilTypeInfoList", soilTypeInfoList);
		return ADD_PLAN_JSP;
	} 
	
	
	
	@RequestMapping(value="/add")
	public String add(WaterPlan waterPlan,HttpServletRequest request){
		
		
		int startYear = waterPlan.getStartYear();
		int endYear = waterPlan.getStartYear();
		int startMonth = waterPlan.getStartMonth();
		int startDay = waterPlan.getStartDay();
		int endMonth = waterPlan.getEndMonth();
		int endDay = waterPlan.getEndDay();
		int totalDays = getBetweenDays(startYear,endYear,startMonth,endMonth,startDay,endDay);
		
		System.out.println("1111111=========================totalDays==============="+totalDays);
		//设置间隔天数
		waterPlan.setTotalDays(totalDays);
		
		BigDecimal riverComeWater = getWaterCome(waterPlan,startYear,endYear,startMonth,endMonth,startDay,endDay);
		
		System.out.println("222222=========================riverComeWater==============="+riverComeWater);
		
		
		//设置本段时间河源产水量
		waterPlan.setRiverComeWater(riverComeWater);
		//上期结束水库库容
		waterPlan.setLastTurnCapacity(new BigDecimal("506.67"));
		//渠道水权面积
		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalByCode(waterPlan.getCanalCode());
		waterPlan.setCanalDecisionArea(calCanalInfo.getDecisionArea());
		System.out.println("333333=========================calCanalInfo.getDecisionArea()==============="+calCanalInfo.getDecisionArea());
		//实际配水面积
		List<NeedWaterReport> needWaterReportList = needWaterService.findNeedWaterReportByCanalCodeAndYear(waterPlan.getCanalCode(),waterPlan.getStartYear());
		
		BigDecimal realityArea = new BigDecimal("0");
		for(int i=0;i<needWaterReportList.size();i++){
			realityArea = realityArea.add(needWaterReportList.get(i).getArea());
		}
		System.out.println("444444=========================realityArea==============="+realityArea);
		
		waterPlan.setRealityArea(realityArea);
		//配水比例
		waterPlan.setMatching(calCanalInfo.getDecisionArea().compareTo(new BigDecimal(0))>0
				?realityArea.divide(calCanalInfo.getDecisionArea(),2,BigDecimal.ROUND_HALF_UP)
				:new BigDecimal(0));
		//平均灌水定额
		List<NeedWaterReport> needWaterReportList2 = needWaterService.findNeedWaterReportByCanalCodeAndYear(waterPlan.getCanalCode(),waterPlan.getStartYear());
		List<WaterAuota> waterAuotaList = new ArrayList<WaterAuota>();
		for(int i=0;i<needWaterReportList2.size();i++){
			String soilTypeCode = needWaterReportList2.get(i).getSoilType();
			String cropsTypeCode = needWaterReportList2.get(i).getCropsType();
			WaterAuota waterAuota=waterAuotaService.findWaterAuotaBySoilAndCrops(soilTypeCode,cropsTypeCode);

			waterAuotaList.add(waterAuota!=null?waterAuota:new WaterAuota());
		}
		BigDecimal totalAuota = new BigDecimal("0");
		for(int j=0;j<waterAuotaList.size();j++){
			totalAuota = totalAuota.add(waterAuotaList.get(j).getWaterQuota()!=null
					?waterAuotaList.get(j).getWaterQuota():new BigDecimal(0));
		}
		System.out.println("44444411=========================realityArea==============="+realityArea);
		
		waterPlan.setWaterDistributionQuota(totalAuota.divide(new BigDecimal(waterAuotaList.size()),2,BigDecimal.ROUND_HALF_UP));
		//农田净用水量
		List<NeedWaterReport> needWaterReportList3 = needWaterService.findNeedWaterReportByCanalCodeAndYear(waterPlan.getCanalCode(),waterPlan.getStartYear());
		BigDecimal soilWaterNetAmount = new BigDecimal("0");
		
		for(int i=0;i<needWaterReportList3.size();i++){
			String soilTypeCode = needWaterReportList3.get(i).getSoilType();
			String cropsTypeCode = needWaterReportList3.get(i).getCropsType();
			WaterAuota waterAuota=waterAuotaService.findWaterAuotaBySoilAndCrops(soilTypeCode,cropsTypeCode);
			if(waterAuota!=null){
				soilWaterNetAmount = soilWaterNetAmount.add(needWaterReportList3.get(i).getArea().multiply(waterAuota.getWaterQuota()));
			}else{
				soilWaterNetAmount = soilWaterNetAmount.add(needWaterReportList3.get(i).getArea().multiply(new BigDecimal(0)));
			}
		}
		waterPlan.setSoilWaterNetAmount(soilWaterNetAmount);
		System.out.println("44444422=========================realityArea==============="+realityArea);
		//水利用率
		waterPlan.setSoilWaterNetAmountRatio(calCanalInfo.getMathing());
		//农田毛用水量
		waterPlan.setSoilWaterAllAmount(soilWaterNetAmount.divide(calCanalInfo.getMathing(),4,BigDecimal.ROUND_HALF_UP));
		//水库需供水量
		BigDecimal life_water_amount = waterPlan.getLifeWaterAmount();
		BigDecimal machine_water_amount = waterPlan.getMachineWaterAmount();
		BigDecimal forest_water_amount = waterPlan.getForestWaterAmount();
		BigDecimal other_water_amount = waterPlan.getOtherWaterAmount();
		BigDecimal soil_water_all_amount = waterPlan.getSoilWaterAllAmount();
		BigDecimal need_reservoir_water_amount = (((life_water_amount.add(machine_water_amount)).add(forest_water_amount)).add(other_water_amount)).add(soil_water_all_amount);
		System.out.println("44444433=========================realityArea==============="+realityArea);
		waterPlan.setNeedReservoirWaterAmount(need_reservoir_water_amount);
		//本轮结束水库库容
		waterPlan.setOwnTurnCapacity((riverComeWater.add(waterPlan.getLastTurnCapacity())).subtract(need_reservoir_water_amount));
		
		//创建时间
		waterPlan.setCreateTime(new Date());

		//与siteMiddleCanal中间表关联外键
		waterPlan.setComm1(new Date().getTime()+waterPlan.getCanalCode());

		System.out.println("44444455=========================realityArea==============="+realityArea);
		
		int a = waterPlanService.addWaterPlan(waterPlan);

		//中间表数据修改
		//siteMiddleCanal中间表插入或更新
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.updateSiteMiddle("calCanal",waterPlan.getCanalCode(),
				"plan_code",waterPlan.getComm1(),request);
		
		return "redirect:/plan/list?state=33";
	} 
	
	
	
	@RequestMapping(value="/page")
	public @ResponseBody List<WaterPlan> page(String canalId,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="10") Integer pageSize){
			//当前点击的区域
			//把当前的区域加入到列表中
		
//			CalCanalInfo calCanalInfo= calCanalInfoService.findCanalById(canalId);
//			String canalCode = calCanalInfo.getCanalCode();
			PageHelper.startPage(page, pageSize);
//			List<WaterPlan> list = waterPlanService.findWaterPlanByCanalCode(canalCode);
			
			List<WaterPlan> list = waterPlanService.findWaterPlanByCanalCodeJoin(canalId);
			
			List<WaterPlan> list2 = new ArrayList<WaterPlan>();
			/*//去重
			for(int i=0;i<list.size()-1;i++){
				if(i==0){
					list2.add(list.get(i));
				}else{
					for(int j = i + 1; j <list.size(); j++){
						System.out.println(list.get(i).getStartYear()+"i====");
						System.out.println(list.get(j).getStartYear()+"j====");
						if(!list.get(i).getStartYear().equals(list.get(j).getStartYear())){
							System.out.println("eee");
							list2.add(list.get(j));
						}
					}
				}
				
			}*/
			
			
			PageInfo<WaterPlan> pages = new PageInfo<WaterPlan>(list);
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
	public @ResponseBody PageInfo<WaterPlan> pageNav(HttpServletRequest request){
		PageInfo<WaterPlan> pages = (PageInfo<WaterPlan>) request.getSession().getAttribute("waterPlanPages");
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
	public @ResponseBody List<WaterPlan> detailPage(String canalCode,int startYear,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
			//当前点击的区域
			//把当前的区域加入到列表中
		
			PageHelper.startPage(page, pageSize);
			List<WaterPlan> list = waterPlanService.findWaterPlansByCanalCodeAndStartYear(canalCode,startYear);
			
			PageInfo<WaterPlan> pages = new PageInfo<WaterPlan>(list);
			request.getSession().setAttribute("detailPages", pages);
			
		return list;
	}
	
	
	@RequestMapping(value="/detail_page_nav")
	public @ResponseBody PageInfo<WaterPlan> detailPageNav(HttpServletRequest request){
		PageInfo<WaterPlan> pages = (PageInfo<WaterPlan>) request.getSession().getAttribute("detailPages");
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
	
	public BigDecimal getWaterCome(WaterPlan waterPlan,int startYear,int endYear,int startMonth,int endMonth,int startDay,int endDay){
		BigDecimal riverComeWater = new BigDecimal("0");
		
		if(startYear==endYear){
			//月份相等
			if(startMonth==endMonth){
				ForecastWaterTable forecastWaterTable = forecastWaterService.findForecastWaterTable(startYear,startMonth,waterPlan.getCanalCode());
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
				ForecastWaterTable forecastWaterTable2 = forecastWaterService.findForecastWaterTable(startYear,startMonth,waterPlan.getCanalCode());
				//前一月流量
				BigDecimal lastComeWater = new BigDecimal("0");
				if(forecastWaterTable2 != null){
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
					
				ForecastWaterTable forecastWaterTable3 = forecastWaterService.findForecastWaterTable(endYear,endMonth,waterPlan.getCanalCode());
				//前一月流量
				BigDecimal nextComeWater = new BigDecimal("0");
				if(forecastWaterTable3 != null){
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
				System.out.println("[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[======="+waterPlan.getCanalCode());
				ForecastWaterTable forecastWaterTable4 = forecastWaterService.findForecastWaterTable(startYear,startMonth,waterPlan.getCanalCode());
				System.out.println("[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[222forecastWaterTable4222"+"======="+forecastWaterTable4.getForecastId());
				//首月流量
				BigDecimal oneComeWater = new BigDecimal("0");
				if(forecastWaterTable4 != null){
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
				forecastWaterTable5 = forecastWaterService.findForecastWaterTable(endYear,midMonth,waterPlan.getCanalCode());
				BigDecimal midComeWater = new BigDecimal("0");
				if(forecastWaterTable5 != null){
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

				midComeWater = new BigDecimal(d14);
				
				//尾月
				if(endDay<=10){
					
				}else if(endDay<=20&&endDay>10){
					
				}else if(endDay>20){
					
				}
				
				ForecastWaterTable forecastWaterTable3 = forecastWaterService.findForecastWaterTable(endYear,endMonth,waterPlan.getCanalCode());
				//尾月流量
				BigDecimal endComeWater = new BigDecimal("0");
				if(forecastWaterTable3 != null){
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


