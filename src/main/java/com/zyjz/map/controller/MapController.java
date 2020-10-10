package com.zyjz.map.controller;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import com.zyjz.site.entity.SiteWaterDynamicInfo;
import com.zyjz.site.service.SiteWaterDynamicService;
import com.zyjz.sysmanage.entity.*;
import com.zyjz.sysmanage.service.*;
import com.zyjz.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyjz.user.service.PermissionService;
import com.zyjz.utils.controller.BaseUtils;



@Controller
@RequestMapping(value="/map")
public class MapController {
	
	@Autowired
	CalCanalInfoService calCanalInfoService;
	
	@Autowired
	SiteWaterService siteWaterService;
	
	@Autowired
	ReservoirManagerService reservoirManagerService;
	@Autowired
	SysAreaService sysAreaService;
	@Autowired
	SiteRainInfoService siteRainInfoService;
	@Autowired
	PermissionService permissionService;

	@Autowired
	SiteWaterDynamicService siteWaterDynamicService;
	@Autowired
	SiteSluiceService siteSluiceService;
	
	
	/** 视图解析页面路径 */
	/*protected static final String MAP_JSP = "/map/electronic_map";*/
	protected static final String CURRENT_WATER_HEIGHT_TABLE = "/map/current_water_height_table";
	protected static final String CURRENT_WATER_SURFACE_HEIGHT_TABLE = "/map/current_water_surface_height_table";
	protected static final String CURRENT_WATER_FLOW_TABLE = "/map/current_water_flow_table";
	protected static final String CURRENT_RESERVOIR_HEIGHT_TABLE = "/map/current_reservoir_height_table";
	protected static final String CURRENT_RESERVOIR_CAPATITY_TABLE = "/map/current_reservoir_capatity_table";
	protected static final String MAP_SHOW_MESSAGE = "/map/map_show_message";
	private static final String WATERINFO = "/map/water_surface_height_table";
	private static final String WATER_FLOW_TABLE = "/map/water_flow_table";
	private static final String PREESURE_HEIGHT = "/map/water_pressure_height_table";
	private static final String CURRENT_SULICE_WATER_TABLE = "/map/current_sulice_water_table";
	private static final String CURRENT_FLOW_TABLE = "/map/current_sulice_flow_table";
	private static final String TOTLE_FLOW = "/map/current_sulice_totle_flow_table";
	private static final String BAIDU_MAP = "/map/baiduMap";
	
	//设定指定任务task在指定时间time执行 schedule(TimerTask task, Date time)  
    public static  void timer1() {  
        Timer timer = new Timer();  
        timer.schedule(new TimerTask() { 
            public void run() {
                System.out.println("-------设定要指定任务--------");  
            } 
        }, 1000);// 设定指定的时间time,此处为2000毫秒  
    } 
	
	/*百度地图*/
	@RequestMapping(value="/map_page")
	public String mapPage(Model model,HttpServletRequest request){
		/*BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);*/
		return BAIDU_MAP;
	}
/*	谷歌地图baidu_map
	@RequestMapping(value="/bai_map")
	public String baiduMap(Model model,HttpServletRequest request,int state){
		
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		
		return MAP_JSP;
	}*/
	
	@RequestMapping(value="/show_message")
	public String showMessage(String id,Model model){
		
		SiteWaterInfo siteWaterInfo = siteWaterService.findSiteWaterInfoById(id);
		model.addAttribute("siteWaterInfo", siteWaterInfo);
		//model.addAttribute("calCanalCode", calCanalInfoList.get(0).getCanalCode());
		return MAP_SHOW_MESSAGE;
	}
	
	
	@RequestMapping(value="ajax_all_site_info")
	public @ResponseBody List<SiteWaterInfo> ajaxAllSiteWater(Model model){
		List<SiteWaterInfo> siteWaterInfoList = siteWaterService.findAllSiteWater();
		//model.addAttribute("siteWaterInfoList", siteWaterInfoList);
		return siteWaterInfoList;
	}
	
	
	private List<String> canalCodes = new ArrayList<String>();
	@RequestMapping(value="ajax_site_info")
	public @ResponseBody List<SiteWaterInfo> ajaxSiteWater(String id, String siteType, Model model){
//		CalCanalInfo calCanalInfo= calCanalInfoService.findCanalById(id);
//		String canalCode = calCanalInfo.getCanalCode();
//		getCanalCode(id);
//		canalCodes.add(canalCode);
//		List<SiteWaterInfo> list = siteWaterService.findSiteWaterByCanalCodes(canalCodes);
//		canalCodes.clear();
		List<SiteWaterInfo> SiteWaterInfoList = siteWaterService.findSiteWaterByCanalCodesJoin(id);
		List<SiteWaterInfo> list = SiteWaterInfoList.stream()
				.filter(x -> siteType.equals(String.valueOf(x.getSiteType()))).collect(Collectors.toList());
		return list;
	} 
	
	
	//递归拿到所有的站点
		public void getCanalCode(String canalId){
			//List<String> canalCodes = new ArrayList<String>();
			List<CalCanalInfo>  calCanalInfoList = calCanalInfoService.findCanalByPId(canalId);
			if(calCanalInfoList!=null&&calCanalInfoList.size()>0){
				for(int i=0;i<calCanalInfoList.size();i++){
					canalCodes.add(calCanalInfoList.get(i).getCanalCode());
					List<CalCanalInfo>  calCanalInfoList2 = calCanalInfoService.findCanalByPId(calCanalInfoList.get(i).getId());
					if(calCanalInfoList2!=null&&calCanalInfoList2.size()>0){
						getCanalCode(calCanalInfoList.get(i).getId());
					}
					
				}
			}
		}
		
		
		@RequestMapping(value="ajax_reservoir_info")
		public @ResponseBody SiteReservoirInfo ajaxReservoir(String id,Model model){
			
			SiteReservoirInfo siteReservoirInfo = reservoirManagerService.findSiteReservoirInfoById(id);
			return siteReservoirInfo;
		} 
		
		@RequestMapping(value="ajax_all_reservoir_info")
		public @ResponseBody List<SiteReservoirInfo> ajaxAllReservoir(String id,Model model){
			
			List<SiteReservoirInfo> siteReservoirInfoList = reservoirManagerService.findAllReservoir();
			return siteReservoirInfoList;
		} 
		
		@RequestMapping(value="ajax_water_site_info")
		public @ResponseBody SiteWaterInfo ajaxWaterSite(String id,Model model){
			
			SiteWaterInfo siteWaterInfo = siteWaterService.findSiteWaterInfoById(id);
			
			return siteWaterInfo;
		}
		
		//@RequestMapping(value="ajax_sluice_site_info")
		//public @ResponseBody SiteSluiceInfo ajaxSluiceSite(String id,Model model){
			
			//SiteWaterInfo siteWaterInfo = siteSluiceService.findSiteWaterInfoById(id);
			
			//return siteWaterInfo;
		//}
		
		private List<String> areaIds = new ArrayList<String>();
		@RequestMapping(value="ajax_site_rain_info")
		public @ResponseBody List<SiteRainInfo> ajaxSiteRainr(String id,Model model){
			System.out.println(id+"3333333333333333333333333333333333333333333");
			SysArea sysArea= sysAreaService.findAreaById(id);
			getAreaIds(id);
			areaIds.add(id);
			List<SiteRainInfo> siteRainInfolist = siteRainInfoService.findSiteRainByAreaIds(areaIds);
			areaIds.clear();
			System.out.println(siteRainInfolist.size()+"44444444444444444");
			return siteRainInfolist;
		} 
		
		//递归拿到所有的站点
			public void getAreaIds(String id){
				//List<String> canalCodes = new ArrayList<String>();
				List<SysArea>  sysAreaList = sysAreaService.findAreaByPId(id);
				if(sysAreaList!=null&&sysAreaList.size()>0){
					for(int i=0;i<sysAreaList.size();i++){
						areaIds.add(sysAreaList.get(i).getId());
						List<SysArea>  sysAreaList2 = sysAreaService.findAreaByPId(sysAreaList.get(i).getId());
						if(sysAreaList2!=null&&sysAreaList2.size()>0){
							System.out.println("33333333333333");
							getAreaIds(sysAreaList.get(i).getId());
						}
						
					}
				}
			}
			
			
			
			
			@RequestMapping(value="ajax_rain_site_info")
			public @ResponseBody SiteRainInfo ajaxRainSite(String id,Model model){
				
				SiteRainInfo siteRainInfo = siteRainInfoService.selectByPrimaryKey(id);
				
				return siteRainInfo;
			} 	
			
			
			@RequestMapping(value="current_water_height_table")
			public String currentWaterHeightTable(){
				
				
				return CURRENT_WATER_HEIGHT_TABLE;
			} 	
			
			@RequestMapping("water_surface_height_table")
			public String waterInfo(){
				return WATERINFO;
			}
			
			@RequestMapping("/current_sulice_flow_table")
			public String currentSuliceFlowTable(){
				
				return CURRENT_FLOW_TABLE;
			}
			@RequestMapping("water_flow_table")
				public String wATERFLOWTABLE(){
					return WATER_FLOW_TABLE;
			}
			
			@RequestMapping("water_pressure_height_table")
			public String pREESURE_HEIGHT(){
				return PREESURE_HEIGHT;
		}
			@RequestMapping("/current_sulice_totle_flow_table")
			public String totleFlow(){
				return TOTLE_FLOW;
			}
			
			@RequestMapping(value="current_water_surface_height_table")
			public String currentWaterSurfaceHeightTable(){
				
				
				
				return CURRENT_WATER_SURFACE_HEIGHT_TABLE;
			} 	
			
			@RequestMapping(value="current_water_flow_table")
			public String currentWaterFlowtTable(){
				
				
				
				return CURRENT_WATER_FLOW_TABLE;
			} 
			
			@RequestMapping(value="current_sulice_water_table")
			public String currentSuliceWaterTable(){
				
				return CURRENT_SULICE_WATER_TABLE;
			}
			
			@RequestMapping(value="current_reservoir_height_table")
			public String currentReservoirHeighttTable(){
				
				return CURRENT_RESERVOIR_HEIGHT_TABLE;
			} 
			
			@RequestMapping(value="current_reservoir_capatity_table")
			public String currentReservoirCapatitytTable(){
				
				return CURRENT_RESERVOIR_CAPATITY_TABLE;
			}

	/**
	 * 查询水位站基本信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/ajax_site_water_dynamic_infoList")
	public @ResponseBody Map<String,List<String>> ajaxHistoryDynamicInfoList(String id){
		//需要返回给前台的数据
		Map<String,List<String>> map = new HashMap<>();

		//时间格式化格式
		SimpleDateFormat sdf_yMdHms = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf_Hm = new SimpleDateFormat("HH:mm");
		Date date = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		//获得前一个小时时间
		c.add(Calendar.HOUR, -1);
		//系统当前时间
		String currentDate = sdf_yMdHms.format(date);
		//系统前一个小时时间
		String afterDate = sdf_yMdHms.format(c.getTime());

		//水位动态表信息查询
		List<SiteWaterDynamicInfo> siteReservoirInfoList = siteWaterDynamicService.findHistoryDynamicInfoList(id,currentDate,afterDate);
		//水位
		List<String> waterLevel = new ArrayList<>();
		//流量
		List<String> instantFlow =new ArrayList<>();
		//时间
		List<String> swdiCreateTime =new ArrayList<>();
		//流速
        List<String> instantSpeed = new ArrayList<>();

		//动态历史数据表存在数据
		if(siteReservoirInfoList.size() > 0){
			//遍历动态历史数据表
			Iterator<SiteWaterDynamicInfo> iterator = siteReservoirInfoList.iterator();

				while (iterator.hasNext()){
					SiteWaterDynamicInfo siteWaterDynamicInfo = iterator.next();
					//水位
					waterLevel.add(siteWaterDynamicInfo.getWaterLevel().toString());
					//流量
					instantFlow.add(siteWaterDynamicInfo.getInstantFlow().toString());
					//时间
					swdiCreateTime.add(sdf_Hm.format(siteWaterDynamicInfo.getSwdiCreateTime()));
					//流速
					instantSpeed.add(siteWaterDynamicInfo.getInstantSpeed()==null?"0":siteWaterDynamicInfo.getInstantSpeed().toString());
				}

			}else{
				int i = 0;
				//默认显示一个小时的数据（12条）
				while( i < 12){
					//水位
					waterLevel.add("0");
					//流量
					instantFlow.add("0");
					//流速
					instantSpeed.add("0");
					c.setTime(c.getTime());
					//获得前一个小时时间
					c.add(Calendar.MINUTE, 5);
					//时间
					swdiCreateTime.add(sdf_Hm.format(c.getTime()));
					i++;
				}
		}
		map.put("waterLevel",waterLevel);
		map.put("instantFlow",instantFlow);
		map.put("swdiCreateTime",swdiCreateTime);
		map.put("instantSpeed",instantSpeed);
		return map;
	}

	/**
	 * 动态查询水位站信息（5分钟一次）
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/ajax_site_water_dynamic_info")
	public @ResponseBody Map<String,String> ajaxHistoryDynamicInfo(String id){
		//需要返回给前台的数据
		Map<String,String> map = new HashMap<>();

		//时间格式化格式
		SimpleDateFormat sdf_yMdHms = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf_Hm = new SimpleDateFormat("HH:mm");
		Date date = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		//获得前5分钟时间
		c.add(Calendar.MINUTE, -5);
		//系统当前时间
		String currentDate = sdf_yMdHms.format(date);
		//系统前5分钟时间
		String afterDate = sdf_yMdHms.format(c.getTime());

		//水位动态表信息查询
		List<SiteWaterDynamicInfo> siteReservoirInfoList =
				siteWaterDynamicService.findHistoryDynamicInfoList(id,currentDate,afterDate);

		//水位
		String waterLevel = "";
		//流量
		String instantFlow ="";
		//瞬时流速
		String instantSpeed ="";
		//累计流量
		String totleFlow ="";
		//时间
		String swdiCreateTime ="";
		//在线状态
		String swdiType = "";
		//测试高度
		String testHeight = "";
		//创建时间
        String uploadTime = "";

		if(siteReservoirInfoList.size() > 0){
			SiteWaterDynamicInfo siteWaterDynamicInfo = siteReservoirInfoList.get(0);
			//水位
			waterLevel = siteWaterDynamicInfo.getWaterLevel().toString();
			//流量
			instantFlow = siteWaterDynamicInfo.getInstantFlow().toString();
			//流速
			instantSpeed = siteWaterDynamicInfo.getInstantSpeed().toString();
			//累计流量
			totleFlow =siteWaterDynamicInfo.getTotleFlow().toString();
			//时间
			swdiCreateTime = sdf_Hm.format(siteWaterDynamicInfo.getSwdiCreateTime());
			//在线状态
			swdiType = siteWaterDynamicInfo.getSwiType();
			//测试高度
			testHeight = siteWaterDynamicInfo.getTestHeight().toString();
			//创建时间
            uploadTime = sdf_yMdHms.format(siteWaterDynamicInfo.getSwdiCreateTime());
		}else{
			//水位
			waterLevel = "0";
			//流量
			instantFlow = "0";
			//流速
			instantSpeed = "0";
			//累计流量
			totleFlow ="0";
			//时间
			swdiCreateTime = sdf_Hm.format(date);
			//在线状态
			swdiType = "0";
			//测试高度
			testHeight = "0";
			//创建时间
            uploadTime = sdf_yMdHms.format(date);

		}
		map.put("waterLevel",waterLevel);
		map.put("instantFlow",instantFlow);
		map.put("instantSpeed",instantSpeed);
		map.put("totleFlow",totleFlow);
		map.put("swdiCreateTime",swdiCreateTime);
		map.put("swdiType",swdiType);
		map.put("testHeight",testHeight);
		map.put("uploadTime",uploadTime);
		return map;
	}

/*	@RequestMapping(value = "/ajax_site_sluice_info")
	public @ResponseBody List<SiteSluiceInfo> ajaxSiteSluice(String id){

		List<SiteSluiceInfo> SiteSluiceList = siteSluiceService.findSiteSluiceInfoByCanalCodeJoin(id);


		return new ArrayList<>();
	}*/
}
