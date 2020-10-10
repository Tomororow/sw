package com.zyjz.site.controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zyjz.site.entity.CurrentRainCapacity;
import com.zyjz.site.entity.SiteRainDynamicInfo;
import com.zyjz.site.service.SiteRainDynamicInfoService;
import com.zyjz.sysmanage.entity.SiteRainInfo;
import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.service.SiteRainInfoService;
import com.zyjz.sysmanage.service.SysAreaService;

/**
 * @ClassName: SiteRainDynamicInfoController
 * @Description: 雨量站实时监控
 * @Author: zhaojx
 * @Date: 2018年3月1日 下午5:00:45
 */
@Controller
@RequestMapping(value="/rainDynamicInfo")
public class SiteRainDynamicInfoController {

	/** 视图解析页面路径 */
	protected static final String RAIN_MONITOR_CHART_JSP = "/site/rain_monitor/rain_monitor_chart";
	
	@Autowired
	private SysAreaService sysAreaService;
	@Autowired
	private SiteRainInfoService siteRainInfoService;
	@Autowired
	private SiteRainDynamicInfoService siteRainDynamicInfoService;
	
	/**
	 * @Title: monitorChart
	 * @Description: 雨情实时监控图表
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/monitorChart", method=RequestMethod.GET)
	public ModelAndView monitorChart(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView(RAIN_MONITOR_CHART_JSP);
		List<SysArea> sysAreaTreeList = sysAreaService.getAllSysAreaInfo();
		modelAndView.addObject("sysAreaTreeList", sysAreaTreeList);
		return modelAndView;
	}
	
	/**
	 * @Title: getAllRainName
	 * @Description: 初始化加载全部站点信息
	 * @param: @return
	 * @return: List<SiteRainInfo>
	 */
	@RequestMapping(value="/getAllRainName", method=RequestMethod.GET)
	@ResponseBody
	public List<SiteRainInfo> getAllRainName(){
		String areaId = "";
		List<SysArea> sysAreaTreeList = sysAreaService.getAllSysAreaInfo();
		for (int i = 0; i < sysAreaTreeList.size(); i++) {
			areaId = sysAreaTreeList.get(1).getId();
		}
		List<SiteRainInfo> rainSiteNames = siteRainInfoService.getRainNameByAreaId(areaId);
		return rainSiteNames;
	}
	
	/**
	 * @Title: getRainNameByAreaId
	 * @Description: 根据Id查询站点信息
	 * @param: @param request
	 * @param: @return
	 * @return: List<SiteRainInfo>
	 */
	@RequestMapping(value="/getRainNameByAreaId", method=RequestMethod.GET)
	@ResponseBody
	public List<SiteRainInfo> getRainNameByAreaId(HttpServletRequest request){
		String areaId = "";
		String getListId = "";
		String id = request.getParameter("areaId");
		
		List<SysArea> sysAreaTreeList = sysAreaService.getAllSysAreaInfo();
		for (int i = 0; i < sysAreaTreeList.size(); i++) {
			getListId = sysAreaTreeList.get(1).getId();
		}
		if(id != null && !id.equals("")){
			areaId = id;
		}else{
			areaId = getListId;
		}
		
		List<SiteRainInfo> rainSiteNames = siteRainInfoService.getRainNameByAreaId(areaId);
		return rainSiteNames;
	}
	
	/**
	 * @Title: getDynamicInfoByCode
	 * @Description: 根据站点编码获取实时雨情信息
	 * @param: @param request
	 * @param: @return
	 * @return: List<>
	 */
	@RequestMapping(value="/getDynamicInfoByCode", method=RequestMethod.GET)
	@ResponseBody
	public List<SiteRainDynamicInfo> getDynamicInfoByCode(HttpServletRequest request){
		String stationCode = request.getParameter("stationCode");
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String nowDate = sdf.format(new Date());
		
		List<SiteRainDynamicInfo> siteDynamicInfoList = new ArrayList<>();
		if(stationCode != null && !stationCode.equals("")){
			siteDynamicInfoList = siteRainDynamicInfoService.getInfoByDeviceCode(stationCode);
		}
		return siteDynamicInfoList;
	}
	
	//获取去实时雨量
		@RequestMapping(value="/current_dynamic_info")
		public @ResponseBody List<CurrentRainCapacity> getCurrentDynamicInfoByCode(String devicerainCode) throws Exception{
			Calendar currentDate = Calendar.getInstance();
			// Date currentDate = new Date();
			 int year = currentDate.get(Calendar.YEAR);
			 int month = currentDate.get(Calendar.MONTH)+1;
			 int date = currentDate.get(Calendar.DAY_OF_MONTH);
			 
			 String startTime = year+"-"+month+"-"+date+" 00:00:00";
			 SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			 Date firstDate = format.parse(startTime); 
			
			List<SiteRainDynamicInfo> siteDynamicInfoList = siteRainDynamicInfoService.findOneDaySiteRainDynamicInfoByDevicerainCodeAndTime(devicerainCode,year+"-"+month+"-"+date+" 00:00:00",year+"-"+month+"-"+date+" 23:59:59");
			System.out.println(siteDynamicInfoList.size()+"==000000");
			
			int addTimeIndex = 30;
			
			CurrentRainCapacity currentRainCapacity = null;
			List<CurrentRainCapacity> currentRainCapacityList = new ArrayList<CurrentRainCapacity>();
			//将雨量分段相加
			for(int i=0;i<48;i++){
				//System.out.println("00000000000000000");
				currentRainCapacity = new CurrentRainCapacity();
				BigDecimal totalCapacity = new BigDecimal("0");
				for(int j=0;j<siteDynamicInfoList.size();j++){
					long srdiCollectTime = siteDynamicInfoList.get(j).getSrdiCollectTime().getTime();
					//System.out.println(srdiCollectTime+"==11111");
					//System.out.println(firstDate.getTime()+addTimeIndex*i*60*1000+"==22222");
					//System.out.println(firstDate.getTime()+addTimeIndex*(i+1)*60*1000+"==33333");
					if(srdiCollectTime>=(firstDate.getTime()+addTimeIndex*i*60*1000) && srdiCollectTime<(firstDate.getTime()+addTimeIndex*(i+1)*60*1000)){
						System.out.println(siteDynamicInfoList.get(j).getTimeRainfall()+"====");
						totalCapacity = totalCapacity.add(siteDynamicInfoList.get(j).getTimeRainfall()); 
					}
				}
				System.out.println(totalCapacity+"---");
				currentRainCapacity.setTotalCapacity(totalCapacity);
				//currentRainCapacity.setTimeFlag(i+1);
				DecimalFormat df=new DecimalFormat("0.00");
				
				currentRainCapacity.setTimeName(df.format((float)((i+1)*30)/60)+"小时");
				currentRainCapacityList.add(currentRainCapacity);
			}
			return currentRainCapacityList;
		}
		
		//累积雨量表
		@RequestMapping(value="/current_site_total_rain")
		public @ResponseBody List<CurrentRainCapacity> getCurrentSiteTotalRainTable(String devicerainCode) throws Exception{
			Calendar currentDate = Calendar.getInstance();
			// Date currentDate = new Date();
			 int year = currentDate.get(Calendar.YEAR);
			 int month = currentDate.get(Calendar.MONTH)+1;
			 int date = currentDate.get(Calendar.DAY_OF_MONTH);
			 
			 String startTime = year+"-"+month+"-"+date+" 00:00:00";
			 SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			 Date firstDate = format.parse(startTime); 
			
			List<SiteRainDynamicInfo> siteDynamicInfoList = siteRainDynamicInfoService.findOneDaySiteRainDynamicInfoByDevicerainCodeAndTime(devicerainCode,year+"-"+month+"-"+date+" 00:00:00",year+"-"+month+"-"+date+" 23:59:59");
			System.out.println(siteDynamicInfoList.size()+"==000000");
			
			int addTimeIndex = 30;
			CurrentRainCapacity currentRainCapacity = null;
			List<CurrentRainCapacity> currentRainCapacityList = new ArrayList<CurrentRainCapacity>();
			for(int i=0;i<48;i++){
				currentRainCapacity = new CurrentRainCapacity();
				BigDecimal totalCapacity = new BigDecimal("0");
				for(int j=0;j<siteDynamicInfoList.size();j++){
					long srdiCollectTime = siteDynamicInfoList.get(j).getSrdiCollectTime().getTime();
					//System.out.println(srdiCollectTime+"==11111");
					//System.out.println(firstDate.getTime()+addTimeIndex*i*60*1000+"==22222");
					//System.out.println(firstDate.getTime()+addTimeIndex*(i+1)*60*1000+"==33333");
					if(srdiCollectTime<(firstDate.getTime()+addTimeIndex*(i+1)*60*1000)){
						System.out.println(siteDynamicInfoList.get(j).getTimeRainfall()+"====");
						totalCapacity = totalCapacity.add(siteDynamicInfoList.get(j).getTimeRainfall()); 
					}
				}
				System.out.println(totalCapacity+"---");
				currentRainCapacity.setTotalCapacity(totalCapacity);
				//currentRainCapacity.setTimeFlag(i+1);
				DecimalFormat df=new DecimalFormat("0.00");
				
				currentRainCapacity.setTimeName(df.format((float)((i+1)*30)/60)+"小时");
				currentRainCapacityList.add(currentRainCapacity);
			}
			
			
			return currentRainCapacityList;
		}
	
	
}