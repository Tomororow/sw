package com.zyjz.sysmanage.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.zyjz.remotecontrol.entity.SiteSluiceGateInfo;
import com.zyjz.remotecontrol.entity.SiteSluiceJzMiddDevice;
import com.zyjz.remotecontrol.service.SiteSluiceGateInfoService;
import com.zyjz.site.entity.SiteSluiceDynamicInfo;
import com.zyjz.site.entity.SiteSluiceDynamicInfoExcel;
import com.zyjz.site.service.SiteSluiceDynamicInfoService;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sysmanage.entity.*;
import com.zyjz.sysmanage.service.*;
import com.zyjz.user.entity.SysUser;
import com.zyjz.user.service.UserService;
import com.zyjz.utils.ExportExcel;
import com.zyjz.utils.controller.BaseUtils;
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
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value="/site_sluice_manage")
public class SiteSluiceInfoController {
	
	@Autowired
    SysWaterAreaService sysWaterAreaService;

	@Autowired
	CalCanalInfoService calCanalInfoService;
	
	@Autowired
	SiteWaterService siteWaterService;
	
	@Autowired
	SiteSluiceService siteSluiceService;

	@Autowired
	SiteSluiceGateInfoService siteSluiceGateInfoService;
	
	@Autowired
	BaseParamService baseParamService;
	
	@Autowired
	SiteSluiceDynamicInfoService siteSluiceDynamicInfoService;

	@Autowired
	UserService userService;

	@Autowired
	private SiteVideoInfoService siteVideoInfoService;

	@Autowired
	SiteSluiceTypeService siteSluiceTypeService;

	@Autowired
	SiteMiddleCanalService siteMiddleCanalService;
	
	private static final Logger logger = LoggerFactory.getLogger(SiteSluiceDynamicInfo.class);

	/** 视图解析页面路径 */
	protected static final String SLUICE_SITE_MANAGE = "/sysmanage/site_manage/site_sluice/list";
	
	//add_sluiceManage.jsp
	
	protected static final String ADD_SITE_JSP = "/sysmanage/site_manage/site_sluice/add_sluiceManage";
	protected static final String EDIT_SITE_JSP = "/sysmanage/site_manage/site_sluice/edit_sluiceManage";
	protected static final String VIDEO_SITE_JSP = "/sysmanage/site_manage/site_sluice/videoFrame";

	
	
	
	
	
	private List<String> canalCodes = new ArrayList<String>();
	@RequestMapping(value="/page",produces = "text/html; charset=utf-8")
	public @ResponseBody String siteSluicePage(String canalCode,HttpServletRequest request){
		//查询符合条件的闸门站
		List<SiteSluiceInfo> siteSluiceInfoList = siteSluiceService.findSiteSluiceInfoByCanalCodeJoin(canalCode);
		List<SiteSluiceType> siteSluiceTypes = siteSluiceTypeService.selectAll();
		//查询闸门启闭类型
		Map<Integer, String> sluiceTypeMap = siteSluiceTypes.stream().collect(Collectors
				.toMap(SiteSluiceType::getSluiceTypeCode, SiteSluiceType::getSluiceTypeName));
		//查询所有闸门
		List<SiteSluiceGateInfo> siteSluiceGateInfoList = siteSluiceGateInfoService.selectAll();

		List<SiteSluiceGateInfo> gateInfoList = null;
		for (SiteSluiceInfo sluiceInfo : siteSluiceInfoList) {
			gateInfoList = new ArrayList<>();
			for (SiteSluiceGateInfo siteSluiceGateInfo : siteSluiceGateInfoList) {
				if(sluiceInfo.getId().equals(siteSluiceGateInfo.getSsgiSluiceInfoId())){
					if(siteSluiceGateInfo.getSiteSluiceJzMiddDevice() == null){
						siteSluiceGateInfo.setSiteSluiceJzMiddDevice(new SiteSluiceJzMiddDevice());
					}
					siteSluiceGateInfo.setSluiceTypeName(sluiceTypeMap.get(Integer.valueOf(siteSluiceGateInfo.getSsgiSluiceTypeCode())));
					gateInfoList.add(siteSluiceGateInfo);
				}
			}
			sluiceInfo.setSiteSluiceGateInfoList(gateInfoList);
		}
		return JSONObject.toJSONString(siteSluiceInfoList);
	}
	
	
	//递归拿到所有的水位站
		public void getCanalCode(String id){
			//List<String> canalCodes = new ArrayList<String>();
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
	
	
	//----------------------
	
	/**
	 * <p>Description: 水位站信息表</p>
	 * @author rww
	 *	@data 2017年12月28日 下午3:05:00
	 */
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request){
		
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		return SLUICE_SITE_MANAGE;
	}
	
	
		
	
	/**
	 * 分页导航条
	 * <p>Description: </p>
	 * @author rww
	 *	@data 2017年12月27日 下午6:00:31
	 */
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<SiteSluiceInfo> siteSluicePageNav(HttpServletRequest request){
		PageInfo<SiteSluiceInfo> pages = (PageInfo<SiteSluiceInfo>) request.getSession().getAttribute("siteSluiceInfoPages");
		return pages;
	}
	
	/**
	 * 跳转到添加页面
	 * @Title: addPage
	 * @Description: 
	 * @param: @param id
	 * @param: @param model
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add_page")
	public String addPage(String id,Model model){
		
		
		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(id);
		List<SiteDeviceModel> siteDeviceModelList = baseParamService.findAllSiteDeviceModel();
		System.out.println("=============sid============="+calCanalInfo.getCanalCode());
		List<SiteWaterInfo> siteWaterInfoList =siteWaterService.findSiteWaterInfoByCanalCode(calCanalInfo.getCanalCode());
		model.addAttribute("calCanalInfo", calCanalInfo);
		model.addAttribute("siteDeviceModelList", siteDeviceModelList);
		
		model.addAttribute("siteWaterInfoList", siteWaterInfoList);
		System.out.println("**************************>"+siteWaterInfoList.size());

		//视频站查询
		List<SiteVideoInfo> allSiteVideoInfo = siteVideoInfoService.findAllSiteVideoInfo();
		List<SiteVideoInfo> collect = allSiteVideoInfo.stream().filter(x -> "1".equals(x.getDeviceType()))
				.collect(Collectors.toList());
		model.addAttribute("SiteVideoInfoList", collect);

		return ADD_SITE_JSP;
	}
	
		/**
		 * 添加闸门站
		 * @Title: add
		 * @Description: 
		 * @param: @param siteWaterInfo
		 * @param: @param model
		 * @param: @param file
		 * @param: @return
		 * @param: @throws IllegalStateException
		 * @param: @throws IOException
		 * @return: String
		 * @throws
		 */
		@RequestMapping(value="/add")
		public String add(HttpServletRequest request, SiteSluiceInfo siteSluiceInfo,Model model,@RequestParam MultipartFile[] file) throws IllegalStateException, IOException{
			
			System.out.println("================add====================="+file.length);
			if(file!=null&&file.length>0){
				for(int i=0;i<file.length;i++){
					System.out.println("rww"+i);
					//设置图片名称不能重复UUID
					String picName = UUID.randomUUID().toString();
					//获取文件名称
					String oriName = file[i].getOriginalFilename();
					if(oriName!=null&&!oriName.equals("")){
					//获取图片后缀
						String extName = oriName.substring(oriName.lastIndexOf("."));
						//开始上传
						file[i].transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
						//将名称存入数据库
						if(i==0){
							siteSluiceInfo.setSsiPhotoBefore(picName + extName);  
						}else if(i==1){
							siteSluiceInfo.setSsiPhotoAfter(picName + extName);
						}
					}
				}
			}
			siteSluiceInfo.setSsiCreateTime(new Date());
			siteSluiceService.insertSelective(siteSluiceInfo);

			//siteMiddleCanal中间表插入或更新
			BaseUtils baseUtils = new BaseUtils();
			baseUtils.updateSiteMiddle("calCanal",siteSluiceInfo.getSsiCanalCode(),
					"device_sluice_code",siteSluiceInfo.getDeviceSluiceCode(),request);
			return "redirect:/site_sluice_manage/list";
		}
	
	
		/**
		 * 跳转到修改页面
		 * @Title: editPage
		 * @Description: 
		 * @param: @param id
		 * @param: @param model
		 * @param: @return
		 * @return: String
		 * @throws
		 */
		@RequestMapping(value="/edit_page")
		public String editPage(String sluiceId,Model model,HttpServletRequest request){
			
			SiteSluiceInfo siteSluiceInfo = siteSluiceService.selectById(sluiceId);
			CalCanalInfo calCanalInfo = calCanalInfoService.findCanalByCode(siteSluiceInfo.getSsiCanalCode());
			List<SiteDeviceModel> siteDeviceModelList = baseParamService.findAllSiteDeviceModel();
			List<SiteWaterInfo> siteWaterInfoList =siteWaterService.findSiteWaterInfoByCanalCode(siteSluiceInfo.getSsiCanalCode());
			model.addAttribute("calCanalInfo", calCanalInfo);
			model.addAttribute("siteSluiceInfo",siteSluiceInfo);
			
			model.addAttribute("siteDeviceModelList", siteDeviceModelList);
			model.addAttribute("siteWaterInfoList", siteWaterInfoList);
			return EDIT_SITE_JSP;
		}
	
		
		@RequestMapping(value="/edit")
		public String edit(HttpServletRequest request, SiteSluiceInfo siteSluiceInfo,Model model,@RequestParam MultipartFile[] file) throws IllegalStateException, IOException{
			//站点修改前中间表数据修改
			int state = updateSiteMiddleCanal(siteSluiceInfo.getId());
			System.out.println("================add====================="+file.length);
			if(file!=null&&file.length>0){
				for(int i=0;i<file.length;i++){
					System.out.println("rww"+i);
					//设置图片名称不能重复UUID
					String picName = UUID.randomUUID().toString();
					//获取文件名称
					String oriName = file[i].getOriginalFilename();
					if(oriName!=null&&!oriName.equals("")){
					//获取图片后缀
						String extName = oriName.substring(oriName.lastIndexOf("."));
						//开始上传
						file[i].transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
						//将名称存入数据库
						if(i==0){
							siteSluiceInfo.setSsiPhotoBefore(picName + extName);  
						}else if(i==1){
							siteSluiceInfo.setSsiPhotoAfter(picName + extName);
						}
					}
				}
			}
			siteSluiceInfo.setSsiEditTime(new Date());
			siteSluiceService.updateByPrimaryKeySelective(siteSluiceInfo);

			//siteMiddleCanal中间表插入或更新
			BaseUtils baseUtils = new BaseUtils();
			baseUtils.updateSiteMiddle("calCanal",siteSluiceInfo.getSsiCanalCode(),
					"device_sluice_code",siteSluiceInfo.getDeviceSluiceCode(),request);
			return "redirect:/site_sluice_manage/list";
		}

        //修改闸门站安装前图片
        @RequestMapping("/photoBeforeUpdate")
        @ResponseBody
        public JsonResult photoBeforeUpdate(MultipartFile file,HttpServletRequest request){
            SiteSluiceInfo ssi = JSONObject.parseObject(request.getParameter("sluice"), SiteSluiceInfo.class);
            File fils = new File(ssi.getSsiPhotoBefore());
            if(fils.exists()){
                fils.delete();
            }
            //设置图片名称不能重复UUID
            String picName = UUID.randomUUID().toString();
            //获取文件名称
            String oriName = file.getOriginalFilename();
            //获取图片后缀
            String extName = oriName.substring(oriName.lastIndexOf("."));
            try{
                //开始上传
                file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
                ssi.setSsiPhotoBefore(picName+extName);
                ssi.setSsiEditTime(new Date());
                siteSluiceService.updateByPrimaryKeySelective(ssi);
                logger.info("修改成功:"+oriName);
            }catch(Exception e){
                logger.error("修改失败");
            }
            return new JsonResult();
        }

        //修改闸门站安装后图片
        @RequestMapping("/photoAfterUpdate")
        @ResponseBody
        public JsonResult photoAfterUpdate(MultipartFile file,HttpServletRequest request){
            SiteSluiceInfo ssi = JSONObject.parseObject(request.getParameter("sluice"), SiteSluiceInfo.class);
            File fils = new File(ssi.getSsiPhotoAfter());
            if(fils.exists()){
                fils.delete();
            }
            //设置图片名称不能重复UUID
            String picName = UUID.randomUUID().toString();
            //获取文件名称
            String oriName = file.getOriginalFilename();
            //获取图片后缀
            String extName = oriName.substring(oriName.lastIndexOf("."));
            try{
                //开始上传
                file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
                ssi.setSsiPhotoAfter(picName+extName);
                ssi.setSsiEditTime(new Date());
                siteSluiceService.updateByPrimaryKeySelective(ssi);
                logger.info("修改成功:"+oriName);
            }catch(Exception e){
                logger.error("修改失败");
            }
            return new JsonResult();
        }

		//单个删除
		@RequestMapping(value="/delete")
		public @ResponseBody String delete(String id){
			//站点修改前中间表数据修改
			int a= updateSiteMiddleCanal(id);
			int state = siteSluiceService.deleteByPrimaryKey(id);
			
			return state+"";
		}
		
		//批量删除
		@RequestMapping(value="/deletes")
		public @ResponseBody String deletes(@RequestParam(value = "ids[]") String[] ids){
			int state=0;
			for(int i=0;i<ids.length;i++){
			 int a = siteSluiceService.deleteByPrimaryKey(ids[i]);
			 state+=a;
			}
			return ""+state;
		}
		
		
		//闸门站数据查询
		@RequestMapping("/sliuce_site")
		@ResponseBody
		public JsonResult sliuceSite(String id){
			Map<String, Object> pageInfo = new HashedMap();
				try {
					CalCanalInfo cci = calCanalInfoService.findCanalById(id);
					getCanalCode(id);
					canalCodes.add(cci.getCanalCode());
					List<SiteSluiceInfo> ssiList = siteSluiceService.selectByPrimaryKey(canalCodes);
					pageInfo.put("ssiList", ssiList);
				} catch (Exception e) {
					e.printStackTrace();
				}
			return new JsonResult(pageInfo);
		}
		
	//闸门站根据ID查询
	@RequestMapping("/slice_id")
	@ResponseBody
	public JsonResult sliceId(String id,String type){
		Map<String,Object> pageInfo = new HashedMap();
		try {
			if("1".equals(type)){
			SiteSluiceInfo ssi = siteSluiceService.selectById(id);
			pageInfo.put("ssi", ssi);
			}else if("2".equals(type)){
			SiteSluiceInfo ssi = siteSluiceService.selectById(id);
			SiteSluiceDynamicInfo ssdi = siteSluiceDynamicInfoService.selectLimit(ssi.getDeviceSluiceCode());
			pageInfo.put("ssi", ssdi);
			}
		logger.info("闸门站数据查询成功");
		} catch (Exception e) {
			logger.error("闸门站数据查询失败",e);
		}
		return new JsonResult(pageInfo);
	}

	/**
	 * 根据渠道查询闸门站数据
 	 * @param canalCode
	 * @return
	 */
	@RequestMapping(value = "/sluice_realTime_list",produces = "text/html; charset=utf-8")
	public @ResponseBody String sluiceRealTimeList(String canalCode){
//		List<SiteSluiceDynamicInfo> siteSluiceDynamicInfoList = siteSluiceDynamicInfoService.selectRealTimeDataList(canalCode);
//		return JSONObject.toJSONString(siteSluiceDynamicInfoList);
		//查询符合条件的闸门站
		List<SiteSluiceInfo> siteSluiceInfoList = siteSluiceService.findSiteSluiceInfoByCanalCodeJoin(canalCode);
		//查询所有闸门
		List<SiteSluiceGateInfo> siteSluiceGateInfoList = siteSluiceGateInfoService.findSluiceGateAndSluiceJzMiddDevice();

		List<SiteSluiceGateInfo> gateInfoList = null;
		for (SiteSluiceInfo sluiceInfo : siteSluiceInfoList) {
			gateInfoList = new ArrayList<>();
			for (SiteSluiceGateInfo siteSluiceGateInfo : siteSluiceGateInfoList) {
				if(sluiceInfo.getId().equals(siteSluiceGateInfo.getSsgiSluiceInfoId())){
					if(siteSluiceGateInfo.getSiteSluiceJzMiddDevice() == null){
						siteSluiceGateInfo.setSiteSluiceJzMiddDevice(new SiteSluiceJzMiddDevice());
					}
					siteSluiceGateInfo.setVideoLength(siteSluiceGateInfo.getSsgiSluiceMovieId().split(",").length);
					gateInfoList.add(siteSluiceGateInfo);
				}
			}
			sluiceInfo.setSiteSluiceGateInfoList(gateInfoList);
		}
		return JSONObject.toJSONString(siteSluiceInfoList);
    }

	/**
	 * 查询某个闸门的历史数据
	 * @param ssdiSluiceGateCode
	 * @return
	 */
	@RequestMapping(value = "/sluice_history_list",produces = "text/html; charset=utf-8")
	public @ResponseBody String historyDataSelect(String ssdiSluiceGateCode){
		List<SiteSluiceDynamicInfo> siteSluiceDynamicInfoList = siteSluiceDynamicInfoService.selectHistoryDataList(ssdiSluiceGateCode);
		sluiceExportList = siteSluiceDynamicInfoList;
		return JSONObject.toJSONString(siteSluiceDynamicInfoList);
	}

	/**
	 * 按闸门站编码或名称查询闸门数据
	 * @param code 闸门站编码
	 * @param name 闸门站名称
	 * @return
	 */
	@RequestMapping(value = "/sluice_condition_query",produces = "text/html; charset=utf-8")
    public @ResponseBody String sluiceConditionQuery(String canalCode, String code, String name, HttpServletRequest request){
		if("".equals(canalCode) || canalCode == null){
			SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
			canalCode = sysUser.getCanalCode();
		}
		//查询符合条件的闸门站
		List<SiteSluiceInfo> siteSluiceInfoList = siteSluiceService.findSiteSluiceInfoByCanalCodeByCodeOrName(canalCode, code, name);

		//查询所有闸门
		List<SiteSluiceGateInfo> siteSluiceGateInfoList = siteSluiceGateInfoService.findSluiceGateAndSluiceJzMiddDevice();

		List<SiteSluiceGateInfo> gateInfoList = null;
		for (SiteSluiceInfo sluiceInfo : siteSluiceInfoList) {
			gateInfoList = new ArrayList<>();
			for (SiteSluiceGateInfo siteSluiceGateInfo : siteSluiceGateInfoList) {
				if(sluiceInfo.getId().equals(siteSluiceGateInfo.getSsgiSluiceInfoId())){
					if(siteSluiceGateInfo.getSiteSluiceJzMiddDevice() == null){
						siteSluiceGateInfo.setSiteSluiceJzMiddDevice(new SiteSluiceJzMiddDevice());
					}
					gateInfoList.add(siteSluiceGateInfo);
				}
			}
			sluiceInfo.setSiteSluiceGateInfoList(gateInfoList);
		}
		return JSONObject.toJSONString(siteSluiceInfoList);
    }

	/**
	 * 根据时间段查询历史数据
	 * @param code
	 * @param startTime
	 * @param endTime
	 * @return
	 */
    @RequestMapping(value = "/sluice_query_time",produces = "text/html; charset=utf-8")
    public @ResponseBody String sluiceQueryByTime(String code, String startTime, String endTime){
		Map<String, Object> map = new HashMap<>();
		//开始日期
		map.put("startTime",startTime);
        //结束日期
		map.put("endTime",endTime);
        //渠道闸门code
		map.put("Objectlist",Arrays.asList(code));
		List<SiteSluiceDynamicInfo> siteSluiceDynamicInfoList = siteSluiceDynamicInfoService.selectDate(map);
		sluiceExportList = siteSluiceDynamicInfoList;
		return JSONObject.toJSONString(siteSluiceDynamicInfoList);
	}

    /**
     * 历史数据导出到Excel
     * @param response
     */
	//存储需要导出的闸门站数据
	List<SiteSluiceDynamicInfo> sluiceExportList = new ArrayList<>();
	@RequestMapping("/sluice_excel_export")
	public void sluiceExcelExport(String sluiceName, HttpServletResponse response){
        List<SiteSluiceDynamicInfoExcel> sluiceExportExcelList = new ArrayList<>();
        //数据转存到Excel导出list
        for (SiteSluiceDynamicInfo info : sluiceExportList) {
            SiteSluiceDynamicInfoExcel ssdi = new SiteSluiceDynamicInfoExcel();
            ssdi.setDevicesluiceCode(info.getDevicesluiceCode());
            ssdi.setDeviceSluiceName(sluiceName);
            ssdi.setSsdiSluiceGateCode(info.getSsdiSluiceGateCode());
            ssdi.setSsdiNetState(info.getSsdiNetState()==0?"离线":"在线");
            ssdi.setBeforeWaterLevel(info.getBeforeWaterLevel());
            ssdi.setAfterWaterLevel(info.getAfterWaterLevel());
            ssdi.setSluiceInstantSpeed(info.getSluiceInstantSpeed());
            ssdi.setSluiceInstantFlow(info.getSluiceInstantFlow());
            ssdi.setSluiceHeight(info.getSluiceHeight());
            ssdi.setGateLoada(info.getGateLoada());
            ssdi.setGateLoadb(info.getGateLoadb());
            ssdi.setSsdiCollectTime(info.getSsdiCollectTime());
            sluiceExportExcelList.add(ssdi);
        }
        //Excel导出
		ExportExcel.exportExcel(sluiceExportExcelList, "渠道闸门历史数据", "数据统计",
                SiteSluiceDynamicInfoExcel.class, "渠道闸门数据统计.xls", response);
	}

	@RequestMapping(value="/videoFrame")
	public String videoFrame(){
		return VIDEO_SITE_JSP;
	}

	/**
	 * 获取闸门站视频信息
	 * @param canalCode 渠道code
	 * @return
	 */
	@RequestMapping(value = "/select_video_list",produces = "text/html; charset=utf-8")
	public @ResponseBody String videoDataList(String canalCode){
		//查询出所有视频站
		List<SiteVideoInfo> siteVideoInfoList = siteVideoInfoService.findSiteVideoByCanalCodeJoin(canalCode);
		//将属于闸门站的视频信息筛选出来 0:雷达或明渠视频站;1:闸门视频站
		List<SiteVideoInfo> collect = siteVideoInfoList.stream().filter(x -> "1".equals(x.getDeviceType()) || "2".equals(x.getDeviceType()))
				.collect(Collectors.toList());
		return JSONObject.toJSONString(collect);
	}

	/**
	 * 查询闸门启闭类型
	 * @return
	 */
	@RequestMapping(value = "/query_sluice_type",produces = "text/html; charset=utf-8")
	public @ResponseBody String sluiceTypesQuery(){
		List<SiteSluiceType> siteSluiceTypes = siteSluiceTypeService.selectAll();
		return JSONObject.toJSONString(siteSluiceTypes);
	}

	/**
	 * 闸门新增
	 * @param sluiceGateInfo
	 * @return
	 */
	@RequestMapping(value="/sluice_gate_add")
	public @ResponseBody String sluiceGateAdd(String sluiceGateInfo) {
		SiteSluiceGateInfo siteSluiceGateInfo = JSONObject.parseObject(sluiceGateInfo, SiteSluiceGateInfo.class);
		siteSluiceGateInfo.setId(UUID.randomUUID().toString().replaceAll("-",""));
		siteSluiceGateInfo.setSsgiSluiceTypeCode(siteSluiceGateInfo.getSluiceTypeName());
		siteSluiceGateInfo.setSsgiSecretKey("zyjzjs1234567890");
		return siteSluiceGateInfoService.insertSelective(siteSluiceGateInfo) + "";
	}
    /**
     * 闸门修改
     * @param sluiceGateInfo
     * @return
     */
	@RequestMapping(value="/sluice_gate_edit")
	public @ResponseBody String sluiceGateEdit(String sluiceGateInfo) {
		SiteSluiceGateInfo siteSluiceGateInfo = JSONObject.parseObject(sluiceGateInfo, SiteSluiceGateInfo.class);
		return siteSluiceGateInfoService.updateByPrimaryKeySelective(siteSluiceGateInfo) + "";
	}
    /**
     * 闸门删除
     * @param id
     * @return
     */
	@RequestMapping(value="/sluice_gate_delete")
	public @ResponseBody String sluiceGateDelete(String id) {
		return siteSluiceGateInfoService.deleteByPrimaryKey(id) + "";
	}

	/**
	 * 站点修改时中间表的数据修改
	 * @param id
	 * @return
	 */
	private int updateSiteMiddleCanal(String id){
		int state = 0;
		SiteSluiceInfo siteSluiceInfoById = siteSluiceService.selectById(id);
		if(siteSluiceInfoById != null){
			String code = "'"+siteSluiceInfoById.getDeviceSluiceCode()+"'";
			List<SiteMiddleCanal> siteMiddleCanalList = siteMiddleCanalService.selectMiddleCanalInfoByCode(code, "device_video_code");
			if(siteMiddleCanalList.size()>0){
				for (SiteMiddleCanal canal : siteMiddleCanalList) {
					canal.setDeviceSluiceCode("");
					int i = siteMiddleCanalService.updateByPrimaryKeySelective(canal);
					if(i == 1){
						logger.info("中间表id:"+canal.getId()+" 的数据更新成功");
					}else{
						logger.info("中间表id:"+canal.getId()+" 的数据更新失败");
					}
					state+=i;
				}
			}
		}
		return state;
	}
}






