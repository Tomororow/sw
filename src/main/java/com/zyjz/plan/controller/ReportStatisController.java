package com.zyjz.plan.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zyjz.site.entity.*;
import com.zyjz.site.service.SiteDayFlowService;
import com.zyjz.site.service.SiteMonthFlowService;
import com.zyjz.site.service.SiteWaterDynamicService;
import com.zyjz.site.service.SiteYearFlowService;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sysmanage.entity.CalCanalInfo;
import com.zyjz.sysmanage.entity.SiteMiddleCanal;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.sysmanage.service.SiteMiddleCanalService;
import com.zyjz.sysmanage.service.SiteWaterService;
import com.zyjz.user.entity.SysUser;
import com.zyjz.user.service.UserService;
import com.zyjz.utils.CommonMethodUtils;
import com.zyjz.utils.ExportExcel;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/report_statis")
public class ReportStatisController {

	private static final String LIST = "/plan/report_statis/list";
	
	private List<String> canCodeList = new ArrayList<>();
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	CalCanalInfoService calCanalInfoService;
	
	@Autowired
	SiteWaterService siteWaterService;
	
	@Autowired
	SiteWaterDynamicService siteWaterDynamicService;

	@Autowired
	UserService userService;

	@Autowired
	SiteMiddleCanalService siteMiddleCanalService;

	@Autowired
	SiteDayFlowService siteDayFlowService;
	@Autowired
	SiteMonthFlowService siteMonthFlowService;
	@Autowired
	SiteYearFlowService siteYearFlowService;

	//格式化格式年月日 时分秒
	private static final String FORMATTER_YMD_HMS = "yyyy-MM-dd HH:mm:ss";
	//格式化格式年月日
	private static final String FORMATTER_YMD = "yyyy-MM-dd";
	//格式化格式年月
	private static final String FORMATTER_YM = "yyyy-MM";
	//格式化格式年
	private static final String FORMATTER_Y = "yyyy";

	@RequestMapping("/list")
	public String index(Model model,HttpServletRequest request){
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		return LIST;
	}
	/**
	 * @throws ParseException 
	 * 
	 * @Title: reportQuery
	 * @Description: 报表统计查询方法
	 * @param: @param waterId
	 * @param: @param leverCode
	 * @param: @param type
	 * @param: @param time
	 * @param: @return
	 * @return: JsonResult
	 * @throws
	 */
	@RequestMapping("/report_query")
	@ResponseBody
	public JsonResult reportQuery(String waterId,String canclCode,String type,String time) throws ParseException{
		String startTime = "";
		String endTime = "";
		String dateTiemOfDay = "";
		long hours = 0;
		List<SiteWaterDynamicInfo> list = new ArrayList<>();
		List<String> canList = new ArrayList<>();
		Map<String,Object> pageInfo = new HashMap<String,Object>();
		SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");

		//页面加载时查询或者点击标签页时触发
		if("ready".equals(time)){
			if(canList!=null){
				endTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
				if("1".equals(type)){
//					startTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date(new Date().getTime()))+" 00:00:00";
					dateTiemOfDay = new SimpleDateFormat("yyyy-MM-dd").format(new Date(new Date().getTime()));
					hours = new Date().getHours();
				}else if("2".equals(type)){
					startTime = new SimpleDateFormat("yyyy-MM").format(new Date(new Date().getTime()))+"-01 00:00:00";
					hours = ((new Date().getTime()-new SimpleDateFormat("yyyy-MM").parse(startTime).getTime())+1000000)/(60*60*24*1000);
				}else{
					startTime = new SimpleDateFormat("yyyy").format(new Date().getTime())+"-01-01 00:00:00";
					hours = new Date().getMonth();
				}
				
			}
		}else{
			Long longNum = Long.parseLong(time);
			switch(type){
			case "1"://日报表
				startTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date(longNum))+" 00:00:00";
				endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date(longNum))+" 23:59:59";
				dateTiemOfDay = new SimpleDateFormat("yyyy-MM-dd").format(new Date(longNum));
				hours = 24;
				break;
			case "2"://月报表
				String [] result = getLastDayOfMonth(new SimpleDateFormat("yyyy-MM").format(new Date(longNum)));
				startTime = new SimpleDateFormat("yyyy-MM").format(new Date(longNum))+"-01 00:00:00";
				endTime = result[0]+" 23:59:59";
				hours = Long.parseLong(result[1]);
				break;
			default://年报表
				startTime = new SimpleDateFormat("yyyy").format(new Date(longNum))+"-01-01 00:00:00";
				endTime = new SimpleDateFormat("yyyy").format(new Date(longNum))+"-12-31 23:59:59";
				hours = 12;
				break;
			}
		}
//		pageInfo.put("startTime",startTime);
//		pageInfo.put("endTime",endTime);
		pageInfo.put("hours", hours);
//		pageInfo.put("Objectlist", canList);

		pageInfo.put("dateTiemOfDay", dateTiemOfDay);
		list = getListDynamic(type,pageInfo);

		if(list.size() > 0){
            //根据水管区code获得canalCode
            SysUser user = userService.selectBySysWaterAreaCode(waterId);
            //查询出该区域下所有的渠道code
            List<SiteMiddleCanal> siteMiddleCanalList = siteMiddleCanalService.findSiteWaterCodeByCanalCode(user.getCanalCode());
            Set<String> collect = siteMiddleCanalList.stream().map(x -> x.getSiteWaterCode()).collect(Collectors.toSet());
            //将该渠道区域下的水位渠道筛选出来
            list.stream().filter(x->collect.contains(x.getDevicewaterCode()));
            return new JsonResult(list);
        }
		return new JsonResult(new ArrayList<>());
	}
	//计算List
	public List<SiteWaterDynamicInfo> getListDynamic(String type,Map<String,Object> pageInfo){
		List<SiteWaterDynamicInfo> list = new ArrayList<>();
		switch(type){
		case "1"://日报表
			list = siteWaterDynamicService.selectDataAYFlow(pageInfo);
			break;
		case "2"://月报表
			list = siteWaterDynamicService.selectDataMonFlow(pageInfo);
			break;
		default://年报表
			list = siteWaterDynamicService.selectDataYarFlow(pageInfo);
			break;
		}
		
		return list;
	}
	@RequestMapping("/report_excel")
	@ResponseBody
	public JsonResult reportExcel(String canalCode, String deviceType, String type, String time, HttpServletResponse response) throws ParseException{
		//根据当前页面条件重新查询
        String tableData = reportQueryList(canalCode, deviceType, type, time);
		if(tableData!="" && tableData!=null){
			String fileName = "";
			String date ="";
			switch (type){
				case "1"://日报表
					fileName = "日报表";
					List<SiteDayFlowExcel> siteDayFlowExcelList =  JSON.parseArray(tableData, SiteDayFlowExcel.class);
					date = new SimpleDateFormat(FORMATTER_YMD).format(siteDayFlowExcelList.get(0).getCreateTime());
					ExportExcel.exportExcel(siteDayFlowExcelList, date+fileName, date+fileName, SiteDayFlowExcel.class, date+fileName+".xls", response);
					break;
				case "2"://月报表
					fileName = "月报表";
					List<SiteMonthFlowExcel> siteMonthFlowExcelList =  JSON.parseArray(tableData, SiteMonthFlowExcel.class);
					date = new SimpleDateFormat(FORMATTER_YM).format(siteMonthFlowExcelList.get(0).getCreateTime());
					ExportExcel.exportExcel(siteMonthFlowExcelList, date+fileName, date+fileName, SiteMonthFlowExcel.class, date+fileName+".xls", response);
					break;
				case "3"://年报表
					fileName = "年报表";
					List<SiteYearFlowExcel> siteYearFlowExcelList =  JSON.parseArray(tableData, SiteYearFlowExcel.class);
					date = new SimpleDateFormat(FORMATTER_Y).format(siteYearFlowExcelList.get(0).getCreateTime());
					ExportExcel.exportExcel(siteYearFlowExcelList, date+fileName, date+fileName, SiteYearFlowExcel.class, date+fileName+".xls", response);
					break;
				default:;
			}
		}
		return new JsonResult();
	}

	//水管区递归
	public void getSonCanals(String id){
		List<CalCanalInfo>  sysCalCanalInfoList = calCanalInfoService.findCanalByPId(id);
		if(sysCalCanalInfoList!=null&&sysCalCanalInfoList.size()>0){
			for(int i=0;i<sysCalCanalInfoList.size();i++){
				canCodeList.add(sysCalCanalInfoList.get(i).getCanalCode());
				List<CalCanalInfo>  sysCalCanalInfoList2 = calCanalInfoService.findCanalByPId(sysCalCanalInfoList.get(i).getId());
				if(sysCalCanalInfoList2!=null&&sysCalCanalInfoList2.size()>0){
					getSonCanals(sysCalCanalInfoList.get(i).getId());
				}
			}
		}
	}
	/**
     * 当月最后一天
     * @return
     */
	public static String []  getLastDayOfMonth(String yearMonth) {
		String [] result = new String[2];
		int year = Integer.parseInt(yearMonth.split("-")[0]);  //年
		int month = Integer.parseInt(yearMonth.split("-")[1]); //月
		Calendar cal = Calendar.getInstance();
		// 设置年份
		cal.set(Calendar.YEAR, year);
		// 设置月份
		cal.set(Calendar.MONTH, month - 1);
		// 获取某月最大天数
		int lastDay = cal.getActualMaximum(Calendar.DATE);
		// 设置日历中月份的最大天数
		cal.set(Calendar.DAY_OF_MONTH, lastDay);
		// 格式化日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		result[0] = sdf.format(cal.getTime());
		result[1] = ""+lastDay;
		return result;
	}
	
	public static void main(String[] args) {
		for(int i=1;i<=9;i++){
			for(int j=1;j<=i;j++){
				System.out.print(j+"*"+i+"="+(i*j)+"  ");
			}
			System.out.println();
		}

	}

    /**
     *
     * @param canalCode
     * @param deviceType 0:雷达;1:明渠;2:闸门站
     * @param type  1:日报表;2:月报表;3:年报表
     * @param time
     * @return
     */
	@RequestMapping(value = "/reportList", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String reportQueryList(String canalCode,String deviceType, String type, String time) throws ParseException{
		//当前时间
		Date date = new Date();
		if(!"".equals(time)){
			long parseLong = Long.parseLong(time);
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(parseLong);
			date = calendar.getTime();
		}

		//遍历当天日总流量
		Map<String,Object> map = new HashedMap();
		map.put("canalCode", canalCode);
		map.put("year", CommonMethodUtils.timeFormatter(date,"year"));
        int number = getTotal(type,time,new Date());
        if(number != -1){
            switch (type) {
                case "1"://日报表
					map.put("month",CommonMethodUtils.timeFormatter(date,"month"));
					map.put("day",CommonMethodUtils.timeFormatter(date,"day"));
                    List<SiteDayFlow> siteDayFlowList = siteDayFlowService.selectSiteDayFlowListByCanalCode(map);
					siteDayFlowList.forEach(x->x.setAvgDayFlow(x.getDayFlow().divide(new BigDecimal(number),3, BigDecimal.ROUND_HALF_UP)));
                    if(siteDayFlowList.size() > 0){
                        return JSONObject.toJSONString(siteDayFlowList.stream().filter(x->deviceType.equals(x.getDeviceType())).collect(Collectors.toList()));
                    }
                    break;
                case "2"://月报表
					map.put("month",CommonMethodUtils.timeFormatter(date,"month"));
                    List<SiteMonthFlow> siteMonthFlowList = siteMonthFlowService.selectSiteMonthFlowListByCanalCode(map);
					siteMonthFlowList.forEach(x->x.setAvgMonthFlow(x.getMonthFlow().divide(new BigDecimal(number),3, BigDecimal.ROUND_HALF_UP)));
                    if(siteMonthFlowList.size() > 0){
						return JSONObject.toJSONString(siteMonthFlowList.stream().filter(x->deviceType.equals(x.getDeviceType())).collect(Collectors.toList()));
                    }
                    break;
                case "3"://年报表
                    List<SiteYearFlow> siteYearFlowList = siteYearFlowService.selectSiteYearFlowListByCanalCode(map);
					siteYearFlowList.forEach(x->x.setAvgYearFlow(x.getYearFlow().divide(new BigDecimal(number),3, BigDecimal.ROUND_HALF_UP)));
                    if(siteYearFlowList.size() > 0){
						return JSONObject.toJSONString(siteYearFlowList.stream().filter(x->deviceType.equals(x.getDeviceType())).collect(Collectors.toList()));
                    }
                    break;
                default:;
            }
		}
		return "";
	}

	/**
	 * 获取日期小时，天，月数
	 * @param type
	 * @param time
	 * @return
	 */
	private int getTotal(String type,String time,Date date){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int total = -1;
		if(!StringUtils.isEmpty(time)){
			if("1".equals(type)){ //日报表
				time = new SimpleDateFormat(FORMATTER_YMD).format(Long.parseLong(time));
				String currenDate = new SimpleDateFormat(FORMATTER_YMD).format(date);
				if(time.compareTo(currenDate)==0){
					//获取当天小时数
					total = calendar.get(Calendar.HOUR_OF_DAY);
				}else if(time.compareTo(currenDate)<0){
					//获取指定小时数
					total = 24;
				}
			}
			if("2".equals(type)){//月报表
				time = new SimpleDateFormat(FORMATTER_YM).format(Long.parseLong(time));
				String currenDate = new SimpleDateFormat(FORMATTER_YM).format(date);
				if(time.compareTo(currenDate)==0){
					//获取当月是第几天
					total = calendar.get(Calendar.DAY_OF_MONTH);
				}else if(time.compareTo(currenDate)<0){
					//获取指定月天数
					total = LocalDate.now().withMonth(LocalDate.parse(time+"-01").getMonthValue()).lengthOfMonth();
				}
			}
			if ("3".equals(type)) {//年报表
				time = new SimpleDateFormat(FORMATTER_Y).format(Long.parseLong(time));
				String currenDate = new SimpleDateFormat(FORMATTER_Y).format(date);
				if (time.compareTo(currenDate) == 0) {
					//获取当年月数
					total = calendar.get(Calendar.MONTH) + 1;
				} else if (time.compareTo(currenDate) < 0) {
					//获取指定年月数
					total = 12;
				}
			}
		}else{
			if("1".equals(type)){ //日报表
				//获取当天小时数
				total = calendar.get(Calendar.HOUR_OF_DAY);
			}
			if("2".equals(type)){//月报表
				//获取当月天数
				total = calendar.get(Calendar.DAY_OF_MONTH);
			}
			if("3".equals(type)){//年报表
				//获取当年月数
				total = calendar.get(Calendar.MONTH) + 1;
			}
		}
		return total;
	}

	@RequestMapping(value = "/history_data_query", produces = "text/html; charset=utf-8")
	public @ResponseBody String historyDataQuery(String startTime,String endTime,String code,String type,String deviceType){
		String resultData = new String();
		SimpleDateFormat dateFormat =null;
		Date localDate = new Date();

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(localDate);
		//获取下一天
		calendar.add(Calendar.DATE,1);
		Date nextDate = calendar.getTime();
		//获取下一月
		calendar.add(Calendar.MONTH,1);
		Date nextMonth = calendar.getTime();
		//获取下一年
		calendar.add(Calendar.YEAR,1);
		Date nextYear = calendar.getTime();

		Map<String,Object> pageInfo = new HashedMap();
		try{
			switch (type){
				case "1"://日报表
					dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					pageInfo.put("devicewaterCode", code);
					pageInfo.put("startTime",startTime.isEmpty()?dateFormat.format(localDate):startTime);
					pageInfo.put("endTime", endTime.isEmpty()?dateFormat.format(nextDate):endTime);
					List<SiteWaterDynamicInfo> dynamicInfos = siteWaterDynamicService.selectDate(pageInfo);
					switch (deviceType){
						case "0"://雷达水位站
							resultData =  JSONObject.toJSONString(dynamicInfos.stream().filter(x -> "0".equals(x.getSwiType())).collect(Collectors.toList()));
							break;
						case "1"://明渠流量站
							resultData =  JSONObject.toJSONString(dynamicInfos.stream().filter(x -> "".equals(x.getSwiType())).collect(Collectors.toList()));
							break;
						case "2"://雷达流速一体机
							resultData =  JSONObject.toJSONString(dynamicInfos.stream().filter(x -> "1".equals(x.getSwiType())).collect(Collectors.toList()));
							break;
					}
					break;
				case "2"://月报表
					List<SiteDayFlow> siteDayFlows = new ArrayList<>();
					pageInfo.put("waterCode", code);
					pageInfo.put("deviceType", deviceType);
					dateFormat = new SimpleDateFormat("yyyy-MM");
					int startYear = CommonMethodUtils.timeFormatter(startTime.isEmpty()?localDate:dateFormat.parse(startTime),"year");
					int startMonth = CommonMethodUtils.timeFormatter(startTime.isEmpty()?localDate:dateFormat.parse(startTime),"month");
					int endYear = CommonMethodUtils.timeFormatter(endTime.isEmpty()?dateFormat.parse(dateFormat.format(nextDate)):dateFormat.parse(endTime),"year");
					int endMonth = CommonMethodUtils.timeFormatter(endTime.isEmpty()?dateFormat.parse(dateFormat.format(nextDate)):dateFormat.parse(endTime),"month");
					if(startYear < endYear){
						pageInfo.put("year",startYear);
						pageInfo.put("month",startMonth);
						pageInfo.put("nextMonth",12);
						List<SiteDayFlow> siteDayFlows1 = siteDayFlowService.selectReportDetailData(pageInfo);
						siteDayFlows.addAll(siteDayFlows1);
						pageInfo.put("year",endYear);
						pageInfo.put("month",0);
						pageInfo.put("nextMonth",endMonth);
						List<SiteDayFlow> siteDayFlows2 = siteDayFlowService.selectReportDetailData(pageInfo);
						siteDayFlows.addAll(siteDayFlows2);
					}
					if(startYear == endYear){
						pageInfo.put("year",startYear);
						pageInfo.put("month",startMonth);
						pageInfo.put("nextMonth",endMonth);
						siteDayFlows = siteDayFlowService.selectReportDetailData(pageInfo);
					}
					resultData = JSONObject.toJSONString(siteDayFlows);
					break;
				case "3"://年报表
					pageInfo.put("waterCode", code);
					pageInfo.put("deviceType", deviceType);
					dateFormat = new SimpleDateFormat("yyyy");
					 startYear = CommonMethodUtils.timeFormatter(startTime.isEmpty()?localDate:dateFormat.parse(startTime),"year");
					 endYear = CommonMethodUtils.timeFormatter(endTime.isEmpty()?dateFormat.parse(dateFormat.format(nextYear)):dateFormat.parse(endTime),"year");
					pageInfo.put("year",startYear);
					pageInfo.put("nextYear",endYear);
					List<SiteMonthFlow> siteMonthFlows = siteMonthFlowService.selectReportDetailData(pageInfo);
					resultData = JSONObject.toJSONString(siteMonthFlows);
					break;
			}
		}catch (Exception e){}
		return resultData;
	}

	@RequestMapping("/history_report_excel")
	@ResponseBody
	public JsonResult historyReportExcel(String startTime,String endTime,String code,String type,String deviceType,HttpServletResponse response) throws ParseException{
		//根据当前页面条件重新查询
		String tableData = historyDataQuery(startTime, endTime, code, type, deviceType);
		if(tableData!="" && tableData!=null){
			String fileName = "";
			String date ="";
			switch (type){
				case "1"://日报表
					fileName = "站点日详细";
					List<SiteWaterDynamicInfoExcel> dynamicInfos =  JSON.parseArray(tableData, SiteWaterDynamicInfoExcel.class);
					date = new SimpleDateFormat(FORMATTER_YMD).format(new Date());
					ExportExcel.exportExcel(dynamicInfos, date+fileName, code, SiteWaterDynamicInfoExcel.class, date+fileName+".xls", response);
					break;
				case "2"://月报表
					fileName = "站点月详细";
					List<SiteDayFlowDialogExcel> SiteDayFlowDialogExcels =  JSON.parseArray(tableData, SiteDayFlowDialogExcel.class);
					date = new SimpleDateFormat(FORMATTER_YM).format(SiteDayFlowDialogExcels.get(0).getCreateTime());
					ExportExcel.exportExcel(SiteDayFlowDialogExcels, date+fileName, date+fileName, SiteDayFlowDialogExcel.class, date+fileName+".xls", response);
					break;
				case "3"://年报表
					fileName = "站点年详细";
					List<SiteMonthFlowDialogExcel> SiteMonthFlowDialogExcels =  JSON.parseArray(tableData, SiteMonthFlowDialogExcel.class);
					date = new SimpleDateFormat(FORMATTER_Y).format(SiteMonthFlowDialogExcels.get(0).getCreateTime());
					ExportExcel.exportExcel(SiteMonthFlowDialogExcels, date+fileName, date+fileName, SiteMonthFlowDialogExcel.class, date+fileName+".xls", response);
					break;
				default:;
			}
		}
		return new JsonResult();
	}
}













