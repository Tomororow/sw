package com.zyjz.sysmanage.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zyjz.sysmanage.entity.*;
import com.zyjz.sysmanage.service.*;
import com.zyjz.user.entity.SysUser;
import com.zyjz.user.service.UserService;
import net.sf.json.JSONArray;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.utils.ExportExcel;
import com.zyjz.utils.controller.BaseUtils;

@Controller
@RequestMapping(value="/site_water_manage")
public class SiteWaterInfoController {
	
	@Autowired
    SysWaterAreaService sysWaterAreaService;
	@Autowired
	CalCanalInfoService calCanalInfoService;
	@Autowired
	SiteWaterService siteWaterService;
	@Autowired
	BaseParamService baseParamService;
	
	@Autowired
	SysAreaService sysAreaService;
	
	@Autowired
	CanalFlowHightService canalFlowHightService;

    @Autowired
    UserService userService;

	@Autowired
	SiteMiddleCanalService siteMiddleCanalService;

	private static final Logger logger = LoggerFactory.getLogger(SiteWaterInfoController.class);
	
	
	/** 视图解析页面路径 */
	protected static final String SITE_MANAGE_JSP = "/sysmanage/site_manage/site_water/list";
	protected static final String ADD_SITE_JSP = "/sysmanage/site_manage/site_water/add_waterSite";
	protected static final String EDIT_SITE_JSP = "/sysmanage/site_manage/site_water/edit_waterSite";
	//protected static final String EDIT_SITE_JSP = "/sysmanage/site_manage/edit_waterSite";
	protected static final String WATER_SITE_MANAGE = "/sysmanage/site_manage/water_site_manage";
	protected static final String ADD_SysWaterArea_JSP = "/sysmanage/sys_water_area/add_water_area";
	protected static final String EDIT_FLOW_PAGE = "/sysmanage/site_manage/site_water/edit_flow_page";
	
	/**
	 * <p>Description: 水位站信息表</p>
	 * @author rww
	 *	@data 2017年12月28日 下午3:05:00
	 */
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request){
		
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		return SITE_MANAGE_JSP;
	}

    @RequestMapping(value="/water_tree", produces = "text/html; charset=utf-8")
    @ResponseBody
    public String waterAreaTree(String waterId,String waterCode,HttpServletRequest request){
        BaseUtils baseUtils = new BaseUtils();
        String treeList = baseUtils.waterTreeList(waterCode,waterId,request);
        return treeList;
    }
	
	private List<String> canalCodes = new ArrayList<String>();
	@RequestMapping(value="/page",produces = "text/html; charset=utf-8")
	public @ResponseBody String siteWaterPage(String canalCode,HttpServletRequest request){

		//根据水管区code获得canalCode
//		SysUser user = userService.selectBySysWaterAreaCode(id);
        List<SiteWaterInfo> list = new ArrayList<>();
        List<SiteWaterInfo> siteWaterlist = siteWaterService.findSiteWaterByCanalCodesJoin(canalCode);
        if(siteWaterlist != null && siteWaterlist.size()>0){
            //过滤出雷达水位站
            list = siteWaterlist.stream().filter(x -> 5 == 	x.getSwiDevicemodelCode() || 12 == x.getSwiDevicemodelCode()).collect(Collectors.toList());
        }
		return JSONObject.toJSONString(list);
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
	
	/**
	 * 分页导航条
	 * <p>Description: </p>
	 * @author rww
	 *	@data 2017年12月27日 下午6:00:31
	 */
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<SiteWaterInfo> siteWaterPageNav(HttpServletRequest request){
		PageInfo<SiteWaterInfo> pages = (PageInfo<SiteWaterInfo>) request.getSession().getAttribute("siteWaterInfoPages");
		return pages;
	}


	@RequestMapping(value="/add_page")
	public String addPage(String id,Model model){
		//保存行政区id
//		List<String> sysWaterAreaIdList = Arrays.asList(id);
        CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(id);
//        CalCanalInfo calCanalInfo = new CalCanalInfo();
//        if(CalCanalInfoList.size()>0){
//			calCanalInfo = CalCanalInfoList.get(0);
//		}
        List<SiteDeviceModel> siteDeviceModelList = baseParamService.findAllSiteDeviceModel();
		
		model.addAttribute("calCanalInfo", calCanalInfo);
		model.addAttribute("siteDeviceModelList", siteDeviceModelList);
		return ADD_SITE_JSP;
	}
	
	//添加水位站
	@RequestMapping(value="/add")
	@Transactional
	public String add(SiteWaterInfo siteWaterInfo,FormListObject list,Model model,@RequestParam MultipartFile[] file
            ,HttpServletRequest request) throws IllegalStateException, IOException{
		
		
		System.out.println(file.length);
		
		//SiteWaterInfo siteWaterInfo = list.getSiteWaterInfo();
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
						siteWaterInfo.setSwiPhotoBefore(picName + extName);
					}else if(i==1){
						siteWaterInfo.setSwiPhotoAfter(picName + extName);
					}
				}
			}
		}
		
		
		siteWaterInfo.setSwiCreateTime(new Date());
		
		int result = siteWaterService.addSiteWaterInfo(siteWaterInfo);

		//siteMiddleCanal中间表插入或更新
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.updateSiteMiddle("calCanal",siteWaterInfo.getSwiCanalCode(),
                "site_water_code",siteWaterInfo.getDeviceWaterCode(),request);

		if(result==1){
			List<CanalFlowHight> canalFlowHightList = list.getCanalFlowHightList(); 
			System.out.println("======canalFlowHightList.size()========="+canalFlowHightList.size()+"------------canalFlowHightList----------"+canalFlowHightList);
			if(canalFlowHightList.size()>=2&&canalFlowHightList!=null){
				CanalFlowHight canalFlowHight = new CanalFlowHight();
				for(int i=0;i<canalFlowHightList.size();i++){
					canalFlowHight=canalFlowHightList.get(i);
					canalFlowHight.setCreateTime(new Date());
					canalFlowHight.setWaterSiteId(siteWaterInfo.getId());
					canalFlowHightService.addCanalFlowHight(canalFlowHight);
				}
			}
		}
		return "redirect:/site_water_manage/list?state=21";
	}
	
	
	@RequestMapping(value="/edit_page")
	public String editPage(String id,Model model){
		SiteWaterInfo siteWaterInfo = siteWaterService.findSiteWaterInfoById(id);
		model.addAttribute("siteWaterInfo", siteWaterInfo);
		List<SiteDeviceModel> siteDeviceModelList = baseParamService.findAllSiteDeviceModel();
		
		model.addAttribute("siteDeviceModelList", siteDeviceModelList);
		return EDIT_SITE_JSP;
	}
	
	
	//水位站编辑保存=====
	@RequestMapping(value="/edit")
	public String edit(SiteWaterInfo siteWaterInfo,FormListObject list,@RequestParam MultipartFile[] file,HttpServletRequest request) throws Exception{
		if(file!=null&&file.length>0){
			for(int i=0;i<file.length;i++){
				if(file[i].getSize()!=0){
					//设置图片名称不能重复UUID
					String picName = UUID.randomUUID().toString();
					//获取文件名称
					String oriName = file[i].getOriginalFilename();
					//获取图片后缀
					String extName = oriName.substring(oriName.lastIndexOf("."));
					//开始上传
					file[i].transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
					//将名称存入数据库
					if(i==0){
						siteWaterInfo.setSwiPhotoBefore(picName + extName);
					}else if(i==1){
						siteWaterInfo.setSwiPhotoAfter(picName + extName);
					}
				}
			}
		}

		//站点修改前中间表数据修改
		int state = updateSiteMiddleCanal(siteWaterInfo.getId());

		siteWaterInfo.setSwiEditTime(new Date());	
		int result =siteWaterService.updateSiteWaterInfo(siteWaterInfo);
		if(result==1){
			List<CanalFlowHight> canalFlowHightList = list.getCanalFlowHightList(); 
			System.out.println("======canalFlowHightList.size()========="+canalFlowHightList.size()+"------------canalFlowHightList----------"+canalFlowHightList);
			if(canalFlowHightList.size()>=2&&canalFlowHightList!=null){
				CanalFlowHight canalFlowHight = new CanalFlowHight();
				for(int i=0;i<canalFlowHightList.size();i++){
					canalFlowHight=canalFlowHightList.get(i);
					canalFlowHight.setCreateTime(new Date());
					canalFlowHight.setWaterSiteId(siteWaterInfo.getId());
					canalFlowHightService.addCanalFlowHight(canalFlowHight);
				}
			}
		}

		//站点修改后中间表数据修改
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.updateSiteMiddle("calCanal",siteWaterInfo.getSwiCanalCode(),
				"site_water_code",siteWaterInfo.getDeviceWaterCode(),request);

		return "redirect:/site_water_manage/list?state=21";
	}
	/*水位流量关系表修改跳转页面*/
	@RequestMapping("/edit_flow_page")
	public String editFlowPage(String waterId,Model model){
		model.addAttribute("waterId", waterId);
		return EDIT_FLOW_PAGE;
	}
	/*根据id查询水位流量关系表*/
	@RequestMapping(value="/edit_page_data")
	@ResponseBody
	public JsonResult editPage(String id){
		List<CanalFlowHight>  canalFlowList = new ArrayList<>();
		if(!"".equals(id)){
			canalFlowList = canalFlowHightService.findCanalFlowHightsByWaterSiteId(id);
		}
		return new JsonResult(canalFlowList);
	}
	/*根据id查询水位流量关系表*/
	@RequestMapping(value="/edit_page_update")
	@ResponseBody
	public JsonResult editPageUpdate(String calList){
		if(!"".equals(calList)){
			JSONArray jSONArray = JSONArray.fromObject(calList);
			List<CanalFlowHight> jsonList =  (List<CanalFlowHight>) jSONArray.toCollection(jSONArray, CanalFlowHight.class);
			for(int i=0;i<jsonList.size();i++){
				CanalFlowHight canFlow = new CanalFlowHight();
				canFlow.setId(jsonList.get(i).getId());
				canFlow.setWaterSiteId(jsonList.get(i).getWaterSiteId());
				canFlow.setFlow(jsonList.get(i).getFlow());
				canFlow.setUpperLimit(jsonList.get(i).getUpperLimit());
				canFlow.setDownerLimit(jsonList.get(i).getDownerLimit());
				canFlow.setUpdateTime(new Date());
				canFlow.setRemark("修改水位流量关系表");
				int row = canalFlowHightService.updateByPrimaryKeySelective(canFlow);
			}
		}
		return new JsonResult();
	}
	
	@RequestMapping("/downLoadExcel")
	public void downLoadExcel(HttpServletResponse response){
		List<String> list = new ArrayList<>();
		ExportExcel.exportExcel(list, "水位流量关系表模板","水位流量关系表",CanalFlowHightExcel.class,"水位流量关系表Excel模板.xls",response );
	}
	
	@RequestMapping("/excel_import")
	@ResponseBody
	public String excelImport(MultipartHttpServletRequest request){
		String message = "";
		String waterId = request.getParameter("waterId");
		try{
			List<CanalFlowHightExcel>  canalList = ExportExcel.importExcel(request.getFile("file"),1, 1,CanalFlowHightExcel.class );
			if(canalList!=null&&canalList.size()!=0){
				for(int i=0;i<canalList.size();i++){
					CanalFlowHight calalFlow = new CanalFlowHight();
					calalFlow.setUpperLimit(canalList.get(i).getUpperLimit());
					calalFlow.setDownerLimit(canalList.get(i).getDownerLimit());
					calalFlow.setFlow(canalList.get(i).getFlow());
					calalFlow.setCreateTime(new Date());
					calalFlow.setWaterSiteId(waterId);
					canalFlowHightService.insertSelective(calalFlow);
				}
				message = "success";
			}
			if(!"success".equals(message)){
				message = "warn";
			}
		}catch(Exception ex){
			message = "error";
		}
		return message;
	}
	//水位站单个删除
	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id){
		//站点修改前中间表数据修改
		int a= updateSiteMiddleCanal(id);

		int state = siteWaterService.delete(id);

		return state+"";
	}
	
	//水位站物批量删除
	@RequestMapping(value="/deletes")
	public @ResponseBody String deletes(@RequestParam(value = "ids[]") String[] ids){
		int state=0;
		for(int i=0;i<ids.length;i++){
		 int a = siteWaterService.delete(ids[i]);
		 state+=a;
		}
		return ""+state;
	}
	
	@RequestMapping("/selectName")
	@ResponseBody
	public JsonResult selectName(String name){
		SiteWaterInfo swi = siteWaterService.selectName(name);
		return new JsonResult(swi);
	}
	/**
	 * 测试方法
	 */
	@RequestMapping("/test_data")
	public void testData(){
		List<CalCanalInfo> calList =  calCanalInfoService.findCanalByPId("9ff5e7c0-4968-11e9-b83c-7cd30ae10e70");
		for(int i=0;i<calList.size();i++){
			SiteWaterInfo siteName = siteWaterService.selectName(calList.get(i).getCanalName());
			if(siteName==null){
				System.out.println("==站点为== "+calList.get(i).getCanalName()+" ==查询不到==");
			}else{
			SiteWaterInfo sw = new SiteWaterInfo();
			sw.setId(UUID.randomUUID().toString());
			sw.setSwiCanalCode(calList.get(i).getCanalCode());
			sw.setDeviceWaterCode(calList.get(i).getCanalCode());
			sw.setDeviceWaterName(calList.get(i).getCanalName());
			sw.setSwiDeviceNo("803");
			sw.setSwiAddr(calList.get(i).getCanalAddr());
			sw.setSwiBuildTime(new Date());
			sw.setSwiSimcard("");
			sw.setSwiSimoperator("中国移动");
			sw.setSwiLatitude(siteName.getSwiLatitude());
			sw.setSwiLongitude(siteName.getSwiLongitude());
			sw.setSwiHeight(new BigDecimal("0.000"));
			sw.setSiteDepth(siteName.getSiteDepth());
			sw.setSwiCreateTime(new Date());
			sw.setSwiEditTime(new Date());
			sw.setSwiRemark(siteName.getDeviceWaterName());
			System.out.println("==站点为== "+calList.get(i).getCanalName());
			int y = siteWaterService.addSiteWaterInfo(sw);
			System.out.println("==站点为== "+calList.get(i).getCanalName()+"状态为： " +y);
			}
		}
		
	}

	/**
	 * 明渠流量站数据取得
	 * @param canalCode
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/lightCanalList", produces = "text/html; charset=utf-8")
    public @ResponseBody String getLightCanalList(String canalCode,HttpServletRequest request){
        //根据水管区code获得canalCode
//        SysUser user = userService.selectBySysWaterAreaCode(id);
        List<SiteWaterInfo> list = new ArrayList<>();
        List<SiteWaterInfo> siteWaterlist = siteWaterService.findSiteWaterByCanalCodesJoin(canalCode);
        if(siteWaterlist != null && siteWaterlist.size()>0){
            //过滤出明渠流量站
            list = siteWaterlist.stream().filter(x -> 8 == 	x.getSwiDevicemodelCode()).collect(Collectors.toList());
        }
		return JSONObject.toJSONString(list);
    }

	/**
	 * 站点修改时中间表的数据修改
	 * @param id
	 * @return
	 */
	private int updateSiteMiddleCanal(String id){
		int state = 0;
		SiteWaterInfo siteWaterInfoById = siteWaterService.findSiteWaterInfoById(id);
		if(siteWaterInfoById != null){
			String code = "'"+siteWaterInfoById.getDeviceWaterCode()+"'";
			List<SiteMiddleCanal> siteMiddleCanalList = siteMiddleCanalService.selectMiddleCanalInfoByCode(code, "site_water_code");
			if(siteMiddleCanalList.size()>0){
				for (SiteMiddleCanal canal : siteMiddleCanalList) {
					canal.setSiteWaterCode("");
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