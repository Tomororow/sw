package com.zyjz.site.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;

import com.zyjz.sysmanage.entity.SiteWaterInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyjz.site.entity.CurrentRainCapacity;
import com.zyjz.site.entity.SiteWaterDynamicInfo;
import com.zyjz.site.service.SiteWaterDynamicService;
import com.zyjz.sysmanage.entity.CalCanalInfo;
import com.zyjz.sysmanage.entity.CanalFlowHight;
import com.zyjz.sysmanage.entity.ReservoirWaterLevelVolum;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.sysmanage.service.CanalFlowHightService;
import com.zyjz.sysmanage.service.ReservoirCapacityService;
import com.zyjz.sysmanage.service.SiteWaterService;

@Controller
@RequestMapping(value="/site_water_dynamic_info")
public class SiteWaterDynamicInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(SiteWaterDynamicInfo.class);
	
	@Autowired
	CalCanalInfoService calCanalInfoService;
	
	@Autowired
	SiteWaterDynamicService siteWaterDynamicService;
	
	@Autowired
	SiteWaterService siteWaterService;
	
	@Autowired
	CanalFlowHightService canalFlowHightService;
	
	@Autowired
	ReservoirCapacityService reservoirCapacityService;
	
	/** 视图解析页面路径 */
	protected static final String SITE_WATER_DYNAMIC =  "/site/water_site/site_water_dynamic";
	
	
	
	
	// 第三种方法：设定指定任务task在指定延迟delay后进行固定频率peroid的执行。  
    // scheduleAtFixedRate(TimerTask task, long delay, long period)  
	@RequestMapping(value="/timer")
	@ResponseBody
    public static Object timer() {
        Timer timer = new Timer();
        Map<String, Object> resultMap=new HashMap<>();
        Map<String, Object> dateMap=new HashMap<>();
        String instantVelocity="";//瞬时流速
        String instantFlow="";//瞬时流量
        String level="";//
        String gateWidth="";//闸门开度
        String totalFlow="";//累计流量
        Date createDate ;//获取时间
        try {
			timer.scheduleAtFixedRate(new TimerTask() {  
			    public void run() {  
			        System.out.println("-------设定要指定任务--------");  
			        
			        
			        
			    }  
			}, 1000, 2000);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("data", "");
	        resultMap.put("msg","1002");
	        resultMap.put("success", false);
		}
        resultMap.put("data", "");
        resultMap.put("msg","1002");
        resultMap.put("success", true);
        return resultMap;
    } 
	
	
	
	
	@RequestMapping(value="/list")
	public String list(Model model){
		List<CalCanalInfo> calCanalInfoList = calCanalInfoService.findAllCanal();
		model.addAttribute("calCanalInfoList", calCanalInfoList);
		
		return SITE_WATER_DYNAMIC;
	}
	//实时水位
	@RequestMapping(value="/current")
	public @ResponseBody BigDecimal getCurrentDynamic(String devicewaterCode,HttpServletRequest request,String type){
		BigDecimal bgWater = null;
		try{
			SiteWaterDynamicInfo siteWaterDynamicInfo = siteWaterDynamicService.findCurrentDataByDevicewaterCode(devicewaterCode);
			SiteWaterInfo swi = siteWaterService.findSiteWaterInfoByCode(devicewaterCode);
			switch (type) {
			//查询实时水位
			case "1":
				 bgWater = (swi.getSiteDepth().subtract(siteWaterDynamicInfo.getTestHeight())).divide(new BigDecimal("100"));
				 request.getSession().setAttribute("siteWaterDynamicInfo", siteWaterDynamicInfo);
				break;
				//查询实时流量
			case "2":
				BigDecimal bg = (swi.getSiteDepth().subtract(siteWaterDynamicInfo.getTestHeight())).divide(new BigDecimal("100"));
				List<CanalFlowHight> flowList = canalFlowHightService.findCanalFlowHightsByWaterSiteId(siteWaterDynamicInfo.getSiteWaterId());
				for(CanalFlowHight cfh:flowList){
					int a = bg.compareTo(cfh.getDownerLimit());
					int b = bg.compareTo(cfh.getUpperLimit());
					if((a==-1)&&(b==1||b==0)){
						bgWater = cfh.getFlow();
					}
				}
				break;
				//查询累计流量
			default:
				String startDate = new SimpleDateFormat("yyyy-MM-dd 00:00:00").format(new Date());
				String endDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
				List<SiteWaterDynamicInfo> swds = siteWaterDynamicService.findOneDayDataByDevicewaterCode(devicewaterCode, startDate, endDate);
				List<CanalFlowHight> flowlist = canalFlowHightService.findCanalFlowHightsByWaterSiteId(siteWaterDynamicInfo.getSiteWaterId());
				BigDecimal bgSum = new BigDecimal("0");
				for(SiteWaterDynamicInfo ssdc:swds){
					for(CanalFlowHight cfh:flowlist){
						int x = swi.getSiteDepth().subtract(ssdc.getTestHeight()).compareTo(cfh.getDownerLimit());
						int y = swi.getSiteDepth().subtract(ssdc.getTestHeight()).compareTo(cfh.getUpperLimit());
						if(x==1||x==0&&y==-1||y==0){
							bgSum = bgSum.add(cfh.getFlow());
						}
					}
					bgWater = bgSum;
				}
				break;
			}
			logger.info("地图实时数据查询成功！"+type);
		}catch(Exception e){
			logger.info("地图实时数据查询！");
		}
		
		
		return bgWater;
	}
	//(swi.getSiteDepth().subtract(siteDynamicInfoList.get(j).getTestHeight())).divide(new BigDecimal("100"));
	
	//水库当前水位站数据
	@RequestMapping(value="/current_reservoir")
	public @ResponseBody SiteWaterDynamicInfo getCurrentReservoirDynamic(String siteWaterId,HttpServletRequest request){
		
		SiteWaterInfo siteWaterInfo=siteWaterService.findSiteWaterInfoById(siteWaterId);
		SiteWaterDynamicInfo siteWaterDynamicInfo = siteWaterDynamicService.findCurrentDataByDevicewaterCode(siteWaterInfo.getDeviceWaterCode());
		System.out.println(siteWaterDynamicInfo.getWaterLevel()+"==============================================================");
		request.getSession().setAttribute("siteReservoirDynamicInfo", siteWaterDynamicInfo);
		return siteWaterDynamicInfo;
	}
	
	
	
	/*@RequestMapping(value="/cycle_data")
	public @ResponseBody List<SiteWaterDynamicInfo> getCycleDataDynamic(String devicewaterCode,int time){
		Date currentDate = new Date();
		Calendar c = new GregorianCalendar();
		c.setTime(currentDate);//设置参数时间
		c.add(Calendar.SECOND,-time);//把日期往后增加SECOND 秒.整数往后推,负数往前移动
		Date lastDate =c.getTime(); //这个时间就是日期往后推一天的结果
		SimpleDateFormat sdf = new SimpleDateFormat();
		
		//拿到前一段时间的数据
		List<SiteWaterDynamicInfo> siteWaterDynamicInfoList = siteWaterDynamicService.findTimeInnerDataByDevicewaterCodeAndTime(devicewaterCode,sdf.format(currentDate),sdf.format(lastDate));
		
		return siteWaterDynamicInfoList;
	}*/
	
	
	
	
	
	@RequestMapping(value="/one_day_data")
	public @ResponseBody List<SiteWaterDynamicInfo> getOneDayData(String devicewaterCode) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date a = sdf.parse("2018-01-02 00:00:00");
		Date b = sdf.parse("2018-01-02 23:59:59");
		
		List<SiteWaterDynamicInfo> siteWaterDynamicInfoList = siteWaterDynamicService.findOneDayDataByDevicewaterCode("111","2018-01-02 00:00:00","2018-01-02 23:59:59");
		return siteWaterDynamicInfoList;
	}
	
	//获取实时水位
	@RequestMapping(value="/cycle_data")
	public @ResponseBody List<CurrentRainCapacity> getCycleData(String devicewaterCode,int time,String type) throws ParseException{
		Calendar currentDate = Calendar.getInstance();
		// Date currentDate = new Date();
		 int year = currentDate.get(Calendar.YEAR);
		 int month = currentDate.get(Calendar.MONTH)+1;
		 int date = currentDate.get(Calendar.DAY_OF_MONTH);
		 int hour = currentDate.get(Calendar.HOUR);
		 int minute =  currentDate.get(Calendar.MINUTE);
		 int second = currentDate.get(Calendar.SECOND);
		 int millis = (int) currentDate.getTimeInMillis();
		// findTimeInnerDataByDevicewaterCodeAndTime
		 
		 String startTime = year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
		 
		 SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		 Date firstDate = format.parse(startTime); 
		 //查询开始时间
		 long firstTime = firstDate.getTime();
		 //查询结束时间
		 long lastTime = firstTime-time*1000;
		 //Long time=new Long(445555555); 
		 String endTime = format.format(lastTime);
		    //Date date=format.parse(d);  
		  //  System.out.println("Format To String(Date):"+d);  
		  //  System.out.println("Format To Date:"+date);  
		
		//查询一段以内的数据
		List<SiteWaterDynamicInfo> siteDynamicInfoList = siteWaterDynamicService.findOneDayDataByDevicewaterCode(devicewaterCode,endTime,startTime);
		SiteWaterInfo swi = siteWaterService.findSiteWaterInfoByCode(devicewaterCode);
		int addTimeIndex = 1000;
		//数据容器
		CurrentRainCapacity currentRainCapacity = null;
		List<CurrentRainCapacity> currentRainCapacityList = new ArrayList<CurrentRainCapacity>();
		for(int i=0;i<time;i++){
			currentRainCapacity = new CurrentRainCapacity();
			BigDecimal totalCapacity = new BigDecimal("0");
			for(int j=0;j<siteDynamicInfoList.size();j++){
				long SwdiCreateTime = siteDynamicInfoList.get(j).getSwdiCreateTime().getTime();
				if(SwdiCreateTime>=(lastTime+i*1000)&&SwdiCreateTime<(lastTime+(i+1)*1000)){
					if("1".equals(type)){
						totalCapacity = (swi.getSiteDepth().subtract(siteDynamicInfoList.get(j).getTestHeight())).divide(new BigDecimal("100"));
					}else if("2".equals(type)){
						BigDecimal bg = (swi.getSiteDepth().subtract(siteDynamicInfoList.get(j).getTestHeight())).divide(new BigDecimal("100"));
						List<CanalFlowHight> flowList = canalFlowHightService.findCanalFlowHightsByWaterSiteId(siteDynamicInfoList.get(j).getSiteWaterId());
						for(CanalFlowHight cfh:flowList){
							int a = bg.compareTo(cfh.getDownerLimit().add(new BigDecimal("0.1")));
							int b = bg.compareTo(cfh.getUpperLimit().add(new BigDecimal("0.1")));
							if(a==1&&a==0&&b==-1&&b==0){
								totalCapacity = cfh.getFlow();
							}
						}
					}
					
				}
			}
			currentRainCapacity.setTotalCapacity(totalCapacity);
			currentRainCapacityList.add(currentRainCapacity);
		}
		return currentRainCapacityList;
	}
	
	/**
	 * 获取实时水位  李玥
	 * @Title: cycleData
	 * @Description: 
	 * @param: @param devicewaterCode
	 * @param: @return
	 * @return: List<SiteWaterDynamicInfo>
	 * @throws
	 */
	@RequestMapping("/cycleData")
	@ResponseBody
	public List<SiteWaterDynamicInfo> cycleData(String devicewaterCode){
		List<SiteWaterDynamicInfo> siteDynamicInfoList = siteWaterDynamicService.cycleData(devicewaterCode);
		return siteDynamicInfoList;
	}
	
	   //水库获取去实时水位
		@RequestMapping(value="/cycle_data_reservoir")
		public @ResponseBody List<CurrentRainCapacity> getCycleDataReservoir(String siteWaterId,int time) throws ParseException{
			
			SiteWaterInfo siteWaterInfo=siteWaterService.findSiteWaterInfoById(siteWaterId);
			
			Calendar currentDate = Calendar.getInstance();
			// Date currentDate = new Date();
			 int year = currentDate.get(Calendar.YEAR);
			 int month = currentDate.get(Calendar.MONTH)+1;
			 int date = currentDate.get(Calendar.DAY_OF_MONTH);
			 
			 int hour = currentDate.get(Calendar.HOUR);
			 int minute =  currentDate.get(Calendar.MINUTE);
			 int second = currentDate.get(Calendar.SECOND);
			 int millis = (int) currentDate.getTimeInMillis();
			// findTimeInnerDataByDevicewaterCodeAndTime
			 
			 String startTime = year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
			 
			 SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			 Date firstDate = format.parse(startTime); 
			 //查询开始时间
			 long firstTime = firstDate.getTime();
			 //查询结束时间
			 long lastTime = firstTime-time*1000;
			 //Long time=new Long(445555555); 
			 String endTime = format.format(lastTime);  
			    //Date date=format.parse(d);  
			  //  System.out.println("Format To String(Date):"+d);  
			  //  System.out.println("Format To Date:"+date);  
			 
			//查询一段以内的数据
			List<SiteWaterDynamicInfo> siteDynamicInfoList = siteWaterDynamicService.findOneDayDataByDevicewaterCode(siteWaterInfo.getDeviceWaterCode(),endTime,startTime);
			int addTimeIndex = 1000;
			//数据容器
			CurrentRainCapacity currentRainCapacity = null;
			List<CurrentRainCapacity> currentRainCapacityList = new ArrayList<CurrentRainCapacity>();
			for(int i=0;i<time;i++){
				currentRainCapacity = new CurrentRainCapacity();
				BigDecimal totalCapacity = new BigDecimal("0");
				for(int j=0;j<siteDynamicInfoList.size();j++){
					long swdiCollectTime = siteDynamicInfoList.get(j).getSwdiCollectTime().getTime();
					if(swdiCollectTime>=(lastTime+i*1000)&&swdiCollectTime<(lastTime+(i+1)*1000)){
						totalCapacity = siteDynamicInfoList.get(j).getWaterLevel();
					}
				}
				currentRainCapacity.setTotalCapacity(totalCapacity);
				currentRainCapacityList.add(currentRainCapacity);
			}
			return currentRainCapacityList;
		}
	
	@RequestMapping(value="/current_flow")
	public @ResponseBody String getCurrentFlow(String devicewaterCode,HttpServletRequest request){
		
		SiteWaterDynamicInfo siteWaterDynamicInfo = (SiteWaterDynamicInfo) request.getSession().getAttribute("siteWaterDynamicInfo");
		//SiteWaterDynamicInfo siteWaterDynamicInfo = siteWaterDynamicService.findCurrentDataByDevicewaterCode(devicewaterCode);
		
		//BigDecimal waterLevel = siteWaterDynamicInfo.getWaterLevel();
		
		SiteWaterInfo siteWaterInfo = siteWaterService.findSiteWaterInfoByCode(devicewaterCode);
		
		//水位高度
		double waterLevel = (siteWaterInfo.getSiteDepth().doubleValue())-(siteWaterDynamicInfo.getWaterLevel().doubleValue());
		
		String flowFunctionCode = siteWaterInfo.getFlowFunctionCode();
		
		double flow=0;
		if(flowFunctionCode=="O"){
			
			
		}else if(flowFunctionCode=="F"){
			//拿到渠断面形状
			String fractureAppearanceCode = siteWaterInfo.getFractureAppearanceCode();
			switch (fractureAppearanceCode) {
				case "O":
					break;
				case "T":
					flow = getT(siteWaterInfo,waterLevel);
					break;
				case "J":
					flow = getJ(siteWaterInfo,waterLevel);
		            break;
				case "U":
					flow = getU(siteWaterInfo,waterLevel);
					break;
				case "TU":
					flow = getTU(siteWaterInfo,waterLevel);
					break;
				default:
					break;
				}
		}else if(flowFunctionCode=="R"){
			
			List<CanalFlowHight> canalFlowHightList = canalFlowHightService.findCanalFlowHightsByWaterSiteId(siteWaterInfo.getId());
			//当前水位
			BigDecimal waterLevel2 = siteWaterDynamicInfo.getWaterLevel();
			for(int i=0;i<canalFlowHightList.size();i++){
				if((waterLevel2.compareTo(canalFlowHightList.get(i).getUpperLimit())==-1||waterLevel2.compareTo(canalFlowHightList.get(i).getUpperLimit())==0)&&waterLevel2.compareTo(canalFlowHightList.get(i).getDownerLimit())==1){
					
					BigDecimal a = canalFlowHightList.get(i).getFlow();
					flow = a.doubleValue();
				}
			}
		}
		return flow+"";
	}
	
	//根据实时水位获取实时库容
	
	@RequestMapping(value="/current_reservoir_capatity")
	public @ResponseBody CurrentRainCapacity getCurrentReservoirCapatityDynamic(String siteWaterId,String deviceReservoirCode,HttpServletRequest request){
		
		SiteWaterDynamicInfo siteWaterDynamicInfo = (SiteWaterDynamicInfo) request.getSession().getAttribute("siteReservoirDynamicInfo");
		
		
		SiteWaterInfo siteWaterInfo=siteWaterService.findSiteWaterInfoById(siteWaterId);
		//SiteWaterDynamicInfo siteWaterDynamicInfo = siteWaterDynamicService.findCurrentDataByDevicewaterCode(siteWaterInfo.getDeviceWaterCode());
		
		//将水位转化成库容
		List<ReservoirWaterLevelVolum> reservoirWaterLevelVolumList = reservoirCapacityService.findAllReservoirWaterLevelVolumsByReservoirCode(deviceReservoirCode);
		System.out.println(reservoirWaterLevelVolumList.size()+"11111");
		System.out.println(deviceReservoirCode+"==2222");
		System.out.println(reservoirWaterLevelVolumList.get(0).getVolume()+"==333");
		CurrentRainCapacity currentRainCapacity=new CurrentRainCapacity();
		BigDecimal a = siteWaterDynamicInfo.getWaterLevel();
		System.out.println(a+"====34343434");
		for(int k=0;k<reservoirWaterLevelVolumList.size();k++){
			BigDecimal b = reservoirWaterLevelVolumList.get(k).getWaterHightLevel();//上限
			
			if(k==0){
				if((a.compareTo(new BigDecimal("0"))==0||a.compareTo(new BigDecimal("0"))==1)&&a.compareTo(b)==-1){
					System.out.println(reservoirWaterLevelVolumList.get(k).getVolume()+"====444");
					currentRainCapacity.setTotalCapacity(reservoirWaterLevelVolumList.get(k).getVolume());
				}
			}else{
				BigDecimal c = reservoirWaterLevelVolumList.get(k-1).getWaterHightLevel();//下限
				if((a.compareTo(c)==0||a.compareTo(c)==1)&&a.compareTo(b)==-1){
					currentRainCapacity.setTotalCapacity(reservoirWaterLevelVolumList.get(k).getVolume());
				}
			}
		}
		return currentRainCapacity;
	}
	
	
	 //水库获取去实时水位
	@RequestMapping(value="/cycle_data_reservoir_capatity")
	public @ResponseBody List<CurrentRainCapacity> getCycleDataReservoirCapatity(String siteWaterId,String deviceReservoirCode,int time) throws ParseException{
		
		SiteWaterInfo siteWaterInfo=siteWaterService.findSiteWaterInfoById(siteWaterId);
		
		Calendar currentDate = Calendar.getInstance();
		// Date currentDate = new Date();
		 int year = currentDate.get(Calendar.YEAR);
		 int month = currentDate.get(Calendar.MONTH)+1;
		 int date = currentDate.get(Calendar.DAY_OF_MONTH);
		 
		 int hour = currentDate.get(Calendar.HOUR);
		 int minute =  currentDate.get(Calendar.MINUTE);
		 int second = currentDate.get(Calendar.SECOND);
		 int millis = (int) currentDate.getTimeInMillis();
		// findTimeInnerDataByDevicewaterCodeAndTime
		 
		 String startTime = year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
		 
		 SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		 Date firstDate = format.parse(startTime); 
		 //查询开始时间
		 long firstTime = firstDate.getTime();
		 //查询结束时间
		 long lastTime = firstTime-time*1000;
		 //Long time=new Long(445555555); 
		 String endTime = format.format(lastTime);  
		    //Date date=format.parse(d);  
		  //  System.out.println("Format To String(Date):"+d);  
		  //  System.out.println("Format To Date:"+date);  
		 
		//查询一段以内的数据
		List<SiteWaterDynamicInfo> siteDynamicInfoList = siteWaterDynamicService.findOneDayDataByDevicewaterCode(siteWaterInfo.getDeviceWaterCode(),endTime,startTime);
		int addTimeIndex = 1000;
		//数据容器
		CurrentRainCapacity currentRainCapacity = null;
		List<CurrentRainCapacity> currentRainCapacityList = new ArrayList<CurrentRainCapacity>();
		for(int i=0;i<time;i++){
			currentRainCapacity = new CurrentRainCapacity();
			BigDecimal totalCapacity = new BigDecimal("0");
			for(int j=0;j<siteDynamicInfoList.size();j++){
				long swdiCollectTime = siteDynamicInfoList.get(j).getSwdiCollectTime().getTime();
				if(swdiCollectTime>=(lastTime+i*1000)&&swdiCollectTime<(lastTime+(i+1)*1000)){
					totalCapacity = siteDynamicInfoList.get(j).getWaterLevel();
				}
			}
			currentRainCapacity.setTotalCapacity(totalCapacity);
			currentRainCapacityList.add(currentRainCapacity);
		}
		
		//将水位转化成库容
		List<ReservoirWaterLevelVolum> reservoirWaterLevelVolumList = reservoirCapacityService.findAllReservoirWaterLevelVolumsByReservoirCode(deviceReservoirCode);
		
		for(int l=0;l<currentRainCapacityList.size();l++){
			
			for(int k=0;k<reservoirWaterLevelVolumList.size();k++){
				BigDecimal a = currentRainCapacityList.get(l).getTotalCapacity();
				BigDecimal b = reservoirWaterLevelVolumList.get(k).getWaterHightLevel();//上限
				
				if(k==0){
					if((a.compareTo(new BigDecimal("0"))==0||a.compareTo(new BigDecimal("0"))==1)&&a.compareTo(b)==-1){
						currentRainCapacityList.get(l).setTotalCapacity(reservoirWaterLevelVolumList.get(k).getVolume());
					}
				}else{
					BigDecimal c = reservoirWaterLevelVolumList.get(k-1).getWaterHightLevel();//下限
					if((a.compareTo(c)==0||a.compareTo(c)==1)&&a.compareTo(b)==-1){
						currentRainCapacityList.get(l).setTotalCapacity(reservoirWaterLevelVolumList.get(k).getVolume());
					}
				}
			}
		}
		
		
		
		return currentRainCapacityList;
	}
	
	
	
	
	
	
	
	
	
	//矩形渠计算========================================================
	public double getJ(SiteWaterInfo siteWaterInfo, double waterLevel){
		//渠底宽度
		BigDecimal siteCanalBottomLenth = siteWaterInfo.getSiteCanalBottomLenth();
		double siteCanalBottomLenth2 = siteCanalBottomLenth.doubleValue();
		//侧壁夹角
		
		double siteCanalWellpaperAngle2 = 0;
		//水力斜坡度
		BigDecimal hydraulicSlope = siteWaterInfo.getHydraulicSlope();
		double hydraulicSlope2 = hydraulicSlope.doubleValue();
		//糙率
		BigDecimal rounghness = siteWaterInfo.getRounghness();
		double rounghness2 = rounghness.doubleValue();
		//修正系数
		BigDecimal ratio = siteWaterInfo.getRatio();
		double ratio2 = ratio.doubleValue();
		
		double h = waterLevel;//梯形高
		double w1 = siteCanalBottomLenth2;//梯形上低
		double a1 = siteCanalWellpaperAngle2-90;//夹角
		double w2 = h*Math.tan(a1)*2+w1;//下底
		double w3 = h/Math.cos(a1);//斜边长度
		
		double w4 = (w1+w3)*h/2;//面积
		double w5 = w2+2*w3;//湿周
		
		//Rh
		double Rh = w4/w5;
		//k
		double k = ratio2;
		//n
		double n = rounghness2;
		//S
		double S =hydraulicSlope2;
		//流速
		double v = (k/n)*Math.pow(Rh, 2/3)*Math.pow(S, 0.5);
		//流量
		double q = v*w4;
		
		return q;
	}
	
	
	
	
	//T形计算公式
	public double getT(SiteWaterInfo siteWaterInfo,double waterLevel){
		//渠底宽度
		BigDecimal siteCanalBottomLenth = siteWaterInfo.getSiteCanalBottomLenth();
		double siteCanalBottomLenth2 = siteCanalBottomLenth.doubleValue();
		//侧壁夹角
		BigDecimal siteCanalWellpaperAngle = siteWaterInfo.getSiteCanalWellpaperAngle(); 
		double siteCanalWellpaperAngle2 = siteCanalWellpaperAngle.doubleValue();
		//水力斜坡度
		BigDecimal hydraulicSlope = siteWaterInfo.getHydraulicSlope();
		double hydraulicSlope2 = hydraulicSlope.doubleValue();
		//糙率
		BigDecimal rounghness = siteWaterInfo.getRounghness();
		double rounghness2 = rounghness.doubleValue();
		//修正系数
		BigDecimal ratio = siteWaterInfo.getRatio();
		double ratio2 = ratio.doubleValue();
		
		double h = waterLevel;//梯形高
		double w1 = siteCanalBottomLenth2;//梯形上低
		double a1 = siteCanalWellpaperAngle2-90;//夹角
		double w2 = h*Math.tan(a1)*2+w1;//下底
		double w3 = h/Math.cos(a1);//斜边长度
		
		double w4 = (w1+w3)*h/2;//面积
		double w5 = w2+2*w3;//湿周
		
		//Rh
		double Rh = w4/w5;
		//k
		double k = ratio2;
		//n
		double n = rounghness2;
		//S
		double S =hydraulicSlope2;
		//流速
		double v = (k/n)*Math.pow(Rh, 2/3)*Math.pow(S, 0.5);
		//流量
		double q = v*w4;
		
		return q;
		
		
	}
	
	
	
	//U计算公式
	public double getU(SiteWaterInfo siteWaterInfo,double waterLevel){
		//测点空高
		BigDecimal siteDepth = siteWaterInfo.getSiteDepth();
		double siteDepth2 = siteDepth.doubleValue();
		
		//渠底宽度
		BigDecimal siteCanalBottomLenth = siteWaterInfo.getSiteCanalBottomLenth();
		double siteCanalBottomLenth2 = siteCanalBottomLenth.doubleValue();
		
		//U底高度
		BigDecimal siteCanalBottomUHeight = siteWaterInfo.getSiteCanalBottomUHeight();
		double siteCanalBottomUHeight2 = siteCanalBottomUHeight.doubleValue();
		
		//侧壁夹角
		double siteCanalWellpaperAngle2 = 0;
		//U底半径
		BigDecimal siteCanalBottomUR = siteWaterInfo.getSiteCanalBottomUR();
		double siteCanalBottomUR2 = siteCanalBottomUR.doubleValue();
		//水力斜坡度
		BigDecimal hydraulicSlope = siteWaterInfo.getHydraulicSlope();
		double hydraulicSlope2 = hydraulicSlope.doubleValue();
		//糙率
		BigDecimal rounghness = siteWaterInfo.getRounghness();
		double rounghness2 = rounghness.doubleValue();
		//修正系数
		BigDecimal ratio = siteWaterInfo.getRatio();
		double ratio2 = ratio.doubleValue();
		
		
		//计算横截面积
		
		if(waterLevel>=siteCanalBottomUHeight2){//水深大于U底高度
			//计算U底面积
			//弦长计算
			double l1 = siteCanalBottomUHeight2;//U底高度
			double l2 = siteCanalBottomLenth2/2;//渠底宽度一半
			double l3 = Math.sqrt(Math.pow(l1, 2)+Math.pow(l2, 2));//勾股定理
			//计算等腰三角形的底角
			double b1 = Math.atan(l2/l1);
			//圆心角一半
			double a1=180-2*b1;
			//U底半径
			double c1 = (Math.sin(a1))/l2;
			//u底横截面积=扇形面积-三角形的面积
			double d1 = (siteCanalBottomLenth2*(c1-l1))/2;//三角形面积
			double d2 = (Math.PI*(Math.pow(c1, 2))*(a1/360))*2;//扇形面积
			double d3 = d2-d1;//u底面积
			double d4 =  2*Math.PI*c1*(a1/360)*2  ;//u底弧长
			
			//计算U底以上梯形的面积
			
			double e1 = 180-siteCanalWellpaperAngle2-90;//斜坡夹角
			double e2 = waterLevel-siteCanalBottomUHeight2;//梯形高度
			
			double e3 = siteCanalBottomLenth2+2*e2*Math.tan(e1);//梯形下底
			
			double e4 = ((siteCanalBottomLenth2+e3)*e2)/2;//梯形面积
			
			double e5 =  (e2/(Math.cos(e1)))*2;//梯形两个斜边长度
			//总面积为
			double f = d3+e4;
			//湿周
			double f2=d4+e5;
			//Rh
			double Rh = f/f2;
			//k
			double k = ratio2;
			//n
			double n = rounghness2;
			//S
			double S =hydraulicSlope2;
			//流速
			double v = (k/n)*Math.pow(Rh, 2/3)*Math.pow(S, 0.5);
			//流量
			double q = v*f;
			
			return q;
		}else{//水深小于U底高度
			
			//计算水面宽度
			double g1 = siteCanalBottomUR2;//u底半径
			
			double g2 = siteCanalBottomUR2-waterLevel;//圆心到水面的距离
			
			double g3 = Math.sqrt(Math.pow(g1, 2)-Math.pow(g2, 2)); //勾股定理
			
			double g4 = g3*2;//水面的宽度
			
			double g5 = g4*g2/2;//三角形面积
			
			double g6 = Math.asin(g3/g1);//圆心角一半
			
			double g7 = Math.PI*Math.pow(g1, 2)*((g6*2)/360);//扇形面积
			
			double g8 = g7-g5;//水的横截面积
			
			double g9 = 2*Math.PI*g1*((g6*2)/360);//湿周
			
			//Rh
			double Rh2 = g8/g9;
			//k
			double k = ratio2;
			//n
			double n = rounghness2;
			//S
			double S2 =hydraulicSlope2;
			//流速
			double v2 = (k/n)*Math.pow(Rh2, 2/3)*Math.pow(S2, 0.5);
			//流量
			double q2 = v2*g8;
			
			return q2;
		}
		
		//return 1;
	}
		
	
	
	
	//TU计算公式
	public double getTU(SiteWaterInfo siteWaterInfo,double waterLevel){
		
		//测点空高
		BigDecimal siteDepth = siteWaterInfo.getSiteDepth();
		double siteDepth2 = siteDepth.doubleValue();
		
		//渠底宽度
		BigDecimal siteCanalBottomLenth = siteWaterInfo.getSiteCanalBottomLenth();
		double siteCanalBottomLenth2 = siteCanalBottomLenth.doubleValue();
		
		//U底高度
		BigDecimal siteCanalBottomUHeight = siteWaterInfo.getSiteCanalBottomUHeight();
		double siteCanalBottomUHeight2 = siteCanalBottomUHeight.doubleValue();
		
		//侧壁夹角
		BigDecimal siteCanalWellpaperAngle = siteWaterInfo.getSiteCanalWellpaperAngle(); 
		double siteCanalWellpaperAngle2 = siteCanalWellpaperAngle.doubleValue();
		//U底半径
		BigDecimal siteCanalBottomUR = siteWaterInfo.getSiteCanalBottomUR();
		double siteCanalBottomUR2 = siteCanalBottomUR.doubleValue();
		//水力斜坡度
		BigDecimal hydraulicSlope = siteWaterInfo.getHydraulicSlope();
		double hydraulicSlope2 = hydraulicSlope.doubleValue();
		//糙率
		BigDecimal rounghness = siteWaterInfo.getRounghness();
		double rounghness2 = rounghness.doubleValue();
		//修正系数
		BigDecimal ratio = siteWaterInfo.getRatio();
		double ratio2 = ratio.doubleValue();
		
		
		//计算横截面积
		
		if(waterLevel>=siteCanalBottomUHeight2){//水深大于U底高度
			//计算U底面积
			//弦长计算
			double l1 = siteCanalBottomUHeight2;//U底高度
			double l2 = siteCanalBottomLenth2/2;//渠底宽度一半
			double l3 = Math.sqrt(Math.pow(l1, 2)+Math.pow(l2, 2));//勾股定理
			//计算等腰三角形的底角
			double b1 = Math.atan(l2/l1);
			//圆心角一半
			double a1=180-2*b1;
			//U底半径
			double c1 = (Math.sin(a1))/l2;
			//u底横截面积=扇形面积-三角形的面积
			double d1 = (siteCanalBottomLenth2*(c1-l1))/2;//三角形面积
			double d2 = (Math.PI*(Math.pow(c1, 2))*(a1/360))*2;//扇形面积
			double d3 = d2-d1;//u底面积
			double d4 =  2*Math.PI*c1*(a1/360)*2  ;//u底弧长
			
			//计算U底以上梯形的面积
			
			double e1 = 180-siteCanalWellpaperAngle2-90;//斜坡夹角
			double e2 = waterLevel-siteCanalBottomUHeight2;//梯形高度
			
			double e3 = siteCanalBottomLenth2+2*e2*Math.tan(e1);//梯形下底
			
			double e4 = ((siteCanalBottomLenth2+e3)*e2)/2;//梯形面积
			
			double e5 =  (e2/(Math.cos(e1)))*2;//梯形两个斜边长度
			//总面积为
			double f = d3+e4;
			//湿周
			double f2=d4+e5;
			//Rh
			double Rh = f/f2;
			//k
			double k = ratio2;
			//n
			double n = rounghness2;
			//S
			double S =hydraulicSlope2;
			//流速
			double v = (k/n)*Math.pow(Rh, 2/3)*Math.pow(S, 0.5);
			//流量
			double q = v*f;
			
			return q;
		}else{//水深小于U底高度
			
			//计算水面宽度
			double g1 = siteCanalBottomUR2;//u底半径
			
			double g2 = siteCanalBottomUR2-waterLevel;//圆心到水面的距离
			
			double g3 = Math.sqrt(Math.pow(g1, 2)-Math.pow(g2, 2)); //勾股定理
			
			double g4 = g3*2;//水面的宽度
			
			double g5 = g4*g2/2;//三角形面积
			
			double g6 = Math.asin(g3/g1);//圆心角一半
			
			double g7 = Math.PI*Math.pow(g1, 2)*((g6*2)/360);//扇形面积
			
			double g8 = g7-g5;//水的横截面积
			
			double g9 = 2*Math.PI*g1*((g6*2)/360);//湿周
			
			//Rh
			double Rh2 = g8/g9;
			//k
			double k = ratio2;
			//n
			double n = rounghness2;
			//S
			double S2 =hydraulicSlope2;
			//流速
			double v2 = (k/n)*Math.pow(Rh2, 2/3)*Math.pow(S2, 0.5);
			//流量
			double q2 = v2*g8;
			
			return q2;
		}
		
		//return 1;
	}
}
