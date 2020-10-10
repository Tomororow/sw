package com.zyjz.plan.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zyjz.site.entity.JzMiddDevice;
import com.zyjz.site.entity.SiteWaterDynamicInfo;
import com.zyjz.site.service.JzMiddDeviceService;
import com.zyjz.site.service.SiteSluiceDynamicInfoService;
import com.zyjz.site.service.SiteWaterDynamicService;
import com.zyjz.sitemanage.service.WaterSurveySiteService;
import com.zyjz.sysmanage.entity.CalCanalInfo;
import com.zyjz.sysmanage.entity.SiteWaterInfo;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.sysmanage.service.CanalFlowHightService;
import com.zyjz.sysmanage.service.SiteSluiceService;
import com.zyjz.sysmanage.service.SiteWaterService;
import com.zyjz.user.service.UserService;
import com.zyjz.utils.ExportExcel;
import com.zyjz.video.entity.SiteVideoInfo;
import com.zyjz.video.service.SiteVideoInfoService;
import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RequestMapping("/real-time_supervision")
@Controller
public class RealTimeSupervisionController {
	
	private static final Logger logger = LoggerFactory.getLogger(SiteWaterInfo.class);
	@Autowired
	private CalCanalInfoService calCanalInfoService;
	
	@Autowired
	private WaterSurveySiteService waterSurveySiteService;
	
	@Autowired
	private SiteWaterDynamicService siteWaterDynamicService;

	@Autowired
	private SiteSluiceService  siteSluiceService;
	
	@Autowired
	private SiteSluiceDynamicInfoService siteSluiceDynamicInfoService;
	
	@Autowired
	private CanalFlowHightService canalFlowHightService;
	
	@Autowired
	private SiteWaterService siteWaterService;
	
	@Autowired
	private  JzMiddDeviceService jzMiddDeviceService;

	@Autowired
	private UserService userService;

	/**
	 * 视频站Service
	 */
	@Autowired
	private SiteVideoInfoService siteVideoInfoService;
	
	private static final String LIST = "/plan/real-time_supervision/list";

	private static final String SITE_WATER_DYNAMIC = "/plan/real-time_supervision/list";

	//定义为导出服务的全局list
	List<SiteWaterDynamicInfo> dynamicList = new ArrayList<SiteWaterDynamicInfo>();
	@RequestMapping("/list")
	public String list(Model model,HttpServletRequest request){
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		return LIST;
	}
	//查询树结构
	@RequestMapping(value="/det")
	public String list(Model model){
		List<CalCanalInfo> calCanalInfoList = calCanalInfoService.findAllCanal();
		model.addAttribute("calCanalInfoList", calCanalInfoList);
		
		return SITE_WATER_DYNAMIC;
	}
	
	//Code集合
	private List<String> canalCodes = new ArrayList<String>();
	//实时监测数据的判断与查询(type:1-->水位站;type:2-->闸门站;type：3-->视频站)
	@RequestMapping(value="/selectType",produces = "text/html; charset=utf-8")
	@ResponseBody
	public String selectType(String code,String type){
		Map<String,Object> pageInfo = new HashedMap();
		List<String> Objectlist = new ArrayList<>();
		try{
			//根据水管区code获得canalCode
//			SysUser user = userService.selectBySysWaterAreaCode(code);

			if("1".equals(type)){
				//拿到所有水位站
				List<SiteWaterInfo> listAll = siteWaterService.findSiteWaterByCanalCodesJoin(code);
				//过滤出雷达水位站
				List<SiteWaterInfo> list = listAll.stream().filter(x ->12 == x.getSwiDevicemodelCode()).collect(Collectors.toList());
				for(SiteWaterInfo swi:list){
					Objectlist.add(swi.getDeviceWaterCode());
				}
				if(Objectlist.size()>0){
					List<JzMiddDevice> sdiList=jzMiddDeviceService.selectDevicewaterCode(Objectlist);
					return JSONObject.toJSONString(sdiList);
				}
			}
			if("2".equals(type)){
				//拿到所有水位站
				List<SiteWaterInfo> listMore = siteWaterService.findSiteWaterByCanalCodesJoin(code);
				//过滤出明渠水位站
				List<SiteWaterInfo> listM = listMore.stream().filter(x -> 8 == 	x.getSwiDevicemodelCode()).collect(Collectors.toList());
				for(SiteWaterInfo ssi:listM ){
					Objectlist.add(ssi.getDeviceWaterCode());
				}
				if(Objectlist.size()>0){
					//明渠流量站动态数据查询方法
					List<JzMiddDevice> listSluice=jzMiddDeviceService.selectDevicewaterCode(Objectlist);
					return JSONObject.toJSONString(listSluice);
				}
			}
			if("3".equals(type)){
				List<SiteVideoInfo> resultSiteVideoList = siteVideoInfoService.findSiteVideoByCanalCodeJoin(code);
				return JSONObject.toJSONString(resultSiteVideoList);
			}
			logger.info("动态数据查询成功");
		}catch(Exception e){
			e.printStackTrace();
			logger.info("动态数据查询失败");
		}
		return  "";
	}
	//根据时间段查询
	@RequestMapping(value = "/selectDate",produces = "text/html; charset=utf-8")
	@ResponseBody
	public String selectDate(String startTime,String endTime,String code,@RequestParam(required=true,defaultValue="1") Integer page,
         @RequestParam(required=false,defaultValue="10") Integer pageSize,boolean flag) throws ParseException{
		Page pageHelper = new Page();
		Map<String,Object> pageInfo = new HashedMap();
		Map<String,Object> pageInfe = new HashedMap();
		List<SiteWaterDynamicInfo> swdList = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(startTime==null||startTime==""&&endTime==null||endTime==""){
			endTime = sdf.format(new Date());
			startTime = new SimpleDateFormat("yyyy-MM-dd 00:00:00").format(new Date());
		}
		try{
            pageInfe.put("startTime",startTime);
            pageInfe.put("endTime", endTime);
            pageInfe.put("devicewaterCode", code);
            if(flag){
				pageHelper = PageHelper.startPage(page, pageSize);
            }
            dynamicList = swdList = siteWaterDynamicService.selectDate(pageInfe);
			long sum = pageHelper.getTotal();
            //int sum= siteWaterDynamicService.selectDateLength(pageInfe);
            pageInfo.put("sum", sum);
            pageInfo.put("swdList", swdList);

			logger.info("根据时间段查询成功");
		}catch(Exception e){
			logger.info("根据时间段查询失败",e);
		}
		return JSONObject.toJSONString(pageInfo);
	}
	/**
	 * 获取视频站
	 * @Title: playModel
	 * @Description: 
	 * @param: @param code
	 * @param: @param request
	 * @param: @return
	 * @return: Object
	 * @throws
	 */
	@RequestMapping("/playModel")
	@ResponseBody
	public Object playModel(String code,HttpServletRequest request){
//		if(code.equals("")||code==null){
//			SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
//			code = sysUser.getSyswaterareaCode();
//		}

		//根据水管区code获得canalCode
//		SysUser user = userService.selectBySysWaterAreaCode(code);

//		CalCanalInfo calCanalInfo= calCanalInfoService.findCanalByCode(code);
//		String id = calCanalInfo.getId();
//		getCanalCode(id);
//		canalCodes.add(code);
//		List<SiteVideoInfo> resultSiteVideoList = siteVideoInfoService.findSiteVideoByCanalCodes(canalCodes);
//		canalCodes.clear();
		List<SiteVideoInfo> resultSiteVideoList = siteVideoInfoService.findSiteVideoByCanalCodeJoin(code);

		//将属于闸门站的视频信息筛选出来 0:雷达或明渠视频站;1:闸门视频站
		List<SiteVideoInfo> collect = resultSiteVideoList.stream().filter(x -> "0".equals(x.getDeviceType()) || "2".equals(x.getDeviceType()))
				.collect(Collectors.toList());
		request.setAttribute("resultSiteVideoList", collect);
		return collect;
	}
	
	/**
	 * 根据设备编号查询设备信息
	 * Description: 
	 * @param: @param deviceSerial
	 * @@Title: byDeviceSerialInfo
	 * @param: @return
	 * @return: Object
	 * @throws
	 */
	@RequestMapping("/byDeviceSerialInfo")
	@ResponseBody
	public Object byDeviceSerialInfo(SiteVideoInfo siteVideoInfo,String deviceSerial){
		System.out.println("***********************************"+deviceSerial);
		siteVideoInfo=siteVideoInfoService.byDeviceSerialInfo(deviceSerial);
		System.out.println("***********************************"+siteVideoInfo.getDeviceChannelNumber());
		return siteVideoInfo;
	}
	
	@RequestMapping("/byExport")
	@ResponseBody
	public void excelPosrt(HttpServletResponse response){
		try {
			if(dynamicList.size()>0){
				ExportExcel.exportExcel(dynamicList, "实时监测数据", "实时监测数据",SiteWaterDynamicInfo.class, "实时监测数据.xls", response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//递归拿到所有的水位站
	public void getCanalCode(String id){
		List<CalCanalInfo>  calCanalInfoList = calCanalInfoService.findCanalByPId(id);
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
}








