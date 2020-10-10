package com.zyjz.sysmanage.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.zyjz.sysmanage.entity.*;
import com.zyjz.sysmanage.service.*;
import com.zyjz.user.entity.SysUser;
import com.zyjz.user.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.utils.controller.BaseUtils;

@Controller
@RequestMapping(value="/reservoir")
public class ReservoirManageController {

	@Autowired
	ReservoirManagerService reservoirManagerService;
	@Autowired
    SysWaterAreaService sysWaterAreaService;
	@Autowired
	SysAreaService sysAreaService;
	
	@Autowired
	CalCanalInfoService calCanalInfoService;
	
	@Autowired
	SiteWaterService siteWaterService;
	
	@Autowired
	BaseParamService baseParamService;

    @Autowired
    UserService userService;

    @Autowired
	SiteMiddleCanalService siteMiddleCanalService;

	private static final Logger logger = LoggerFactory.getLogger(ReservoirManageController.class);
	
	/** 视图解析页面路径 */
	protected static final String SITE_RESERVOIR_JSP =  "/sysmanage/reservoir_manager/list";
	protected static final String ADD_RESERVOIR_JSP =  "/sysmanage/reservoir_manager/add_reservoir";
	protected static final String EDIT_RESERVOIR_JSP =  "/sysmanage/reservoir_manager/edit_reservoir";
	
	
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request){
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		return SITE_RESERVOIR_JSP;
	}
	/**
	 * 列表页面
	 * @Title: page
	 * @Description: 
	 * @param: @param id
	 * @param: @param request
	 * @param: @param page
	 * @param: @param pageSize
	 * @param: @return
	 * @return: List<SiteReservoirInfo>
	 * @throws
	 */
	@RequestMapping(value="/page")
	public @ResponseBody List<SiteReservoirInfo> page(String id,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
		
		//当前点击的区域
		//把当前的区域加入到列表中
		
		
			PageHelper.startPage(page, pageSize);
			
			List<SiteReservoirInfo> list = reservoirManagerService.findAllReservoir();
			
			PageInfo<SiteReservoirInfo> pages = new PageInfo<SiteReservoirInfo>(list);
			
			request.getSession().setAttribute("pages", pages);
		
		return list;
		
	}
	/**
	 * 分页导航
	 * @Title: pageNav
	 * @Description: 
	 * @param: @param request
	 * @param: @return
	 * @return: PageInfo<SiteReservoirInfo>
	 * @throws
	 */
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<SiteReservoirInfo> pageNav(HttpServletRequest request){
		PageInfo<SiteReservoirInfo> pages = (PageInfo<SiteReservoirInfo>) request.getSession().getAttribute("pages");
		return pages;
	}
	
	/**
	 * 跳转到添加页面
	 * @Title: addReservoirPage
	 * @Description: 
	 * @param: @param model
	 * @param: @param id
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add_reservoir_page")
	public String addReservoirPage(Model model,String id){
		List<SysWaterArea> sysWaterAreaList = sysWaterAreaService.findWaterAreaByLevel(0);
		model.addAttribute("sysWaterAreaList", sysWaterAreaList);
		
		List<SysArea> sysAreaList = sysAreaService.findAreaByLevel(0);
		model.addAttribute("sysAreaList", sysAreaList);
		
		List<CalCanalInfo> calCanalInfoList = calCanalInfoService.findCanalsByLevel(2);
		model.addAttribute("calCanalInfoList", calCanalInfoList);
		model.addAttribute("id", id);
		List<SiteWaterInfo> siteWaterInfoList = siteWaterService.findAllSiteWater();
		
		List<CalCanalUsetype> calCanalUsetypeList =baseParamService.findAllCalCanalUsetype();
		model.addAttribute("calCanalUsetypeList", calCanalUsetypeList);
		model.addAttribute("siteWaterInfoList", siteWaterInfoList);
		return ADD_RESERVOIR_JSP;
	}
	
	/**
	 * 添加水库站点
	 * @Title: add
	 * @Description: 
	 * @param: @param siteReservoirInfo
	 * @param: @return
	 * @param: @throws Exception
	 * @return: String
	 * @throws
	 */
	@Transactional
	@RequestMapping(value="/add")
	public String add(SiteReservoirInfo siteReservoirInfo,HttpServletRequest request) throws Exception{
		siteReservoirInfo.setSriCreateTime(new Date());
		reservoirManagerService.addSiteReservoirInfo(siteReservoirInfo);

		//siteMiddleCanal中间表插入或更新
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.updateSiteMiddle("sysArea",siteReservoirInfo.getBelongsCanalCode(),
				"device_reservoir_code",siteReservoirInfo.getDeviceReservoirCode(),request);

		return "redirect:/reservoir/list";
	}
	
	/**
	 * 条转到修改页面
	 * @Title: editPage
	 * @Description: 
	 * @param: @param id
	 * @param: @param model
	 * @param: @param request
	 * @param: @param siteReservoirInfo
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/edit_page")
	public String editPage(String id,Model model,HttpServletRequest request,SiteReservoirInfo siteReservoirInfo){
		siteReservoirInfo=reservoirManagerService.findSiteReservoirInfoById(id);
		List<SiteWaterInfo> siteWaterInfoList = siteWaterService.findAllSiteWater();
		List<SysWaterArea> sysWaterAreaList = sysWaterAreaService.findWaterAreaByLevel(0);
		model.addAttribute("sysWaterAreaList", sysWaterAreaList);
		
		List<SysArea> sysAreaList = sysAreaService.findAreaByLevel(0);
		
		model.addAttribute("sysAreaList", sysAreaList);
		model.addAttribute("siteReservoirInfo", siteReservoirInfo);
		List<CalCanalInfo> calCanalInfoList = calCanalInfoService.findCanalsByLevel(2);
		model.addAttribute("calCanalInfoList", calCanalInfoList);
		
		//------------------
		
		/*CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(id);;*/
		//行政区Code
		String areaCode = siteReservoirInfo.getSysareaCode();
		SysArea sysArea	= sysAreaService.findBySysareaCode(areaCode);
		SysWaterArea sysWaterArea = sysWaterAreaService.findWaterAreaBySyswaterareaCode(siteReservoirInfo.getSyswaterareaCode());
		
		String waterAreaNames="";
		if(sysWaterArea!=null){
			
			waterAreaNames ="【"+sysWaterArea.getWaterAreaLevel()+":"+sysWaterArea.getWaterAreaName()+"】";
			String parentWaterareaId = sysWaterArea.getParentWaterareaId();
			int sysWaterAreaLevel = sysWaterArea.getWaterAreaLevel();
			for(int i=0;i<sysWaterAreaLevel;i++){
				SysWaterArea pSysWaterArea = sysWaterAreaService.findWaterAreaById(parentWaterareaId);
				if(pSysWaterArea!=null){
					waterAreaNames="【"+pSysWaterArea.getWaterAreaLevel()+":"+pSysWaterArea.getWaterAreaName()+"】"+waterAreaNames;
					parentWaterareaId=pSysWaterArea.getParentWaterareaId();
				}else{
					siteReservoirInfo.setSyswaterareaCode("");
					waterAreaNames="无";
					break;
				}
			}
		}else{
			siteReservoirInfo.setSyswaterareaCode("");
			waterAreaNames="无";
		}
		
		
		String sysAreaNames="";
		if(sysArea!=null){
			sysAreaNames ="【"+sysArea.getAreaLevel()+":"+sysArea.getAreaName()+"】";
			String parentSysareaId = sysArea.getParentAreaId();
			int sysAreaLevel = sysArea.getAreaLevel();
			for(int i=0;i<sysAreaLevel;i++){
				SysArea sysAreaL = sysAreaService.selectByPrimaryKey(parentSysareaId);
				if(sysArea!=null){
					sysAreaNames="【"+sysAreaL.getAreaLevel()+":"+sysAreaL.getAreaName()+"】"+sysAreaNames;
					parentSysareaId=sysAreaL.getParentAreaId();
				}else{
					siteReservoirInfo.setSyswaterareaCode("");
					sysAreaNames="无";
					break;
				}
			}
		}else{
			siteReservoirInfo.setSysareaCode("");
			waterAreaNames="无";
		}
		
		model.addAttribute("waterAreaNames", waterAreaNames);
		model.addAttribute("sysAreaNames", sysAreaNames);
		
		List<CalCanalUsetype> calCanalUsetypeList =baseParamService.findAllCalCanalUsetype();
		model.addAttribute("calCanalUsetypeList", calCanalUsetypeList);
		model.addAttribute("siteWaterInfoList", siteWaterInfoList);
		return EDIT_RESERVOIR_JSP;
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@ResponseBody
	public String editSaveCropsInfo(HttpServletRequest request, SiteReservoirInfo siteReservoirInfo){
		//站点修改前中间表数据修改
		int i = updateSiteMiddleCanal(siteReservoirInfo.getId());

		if(siteReservoirInfo != null){
			// 将选中节点的ID设置为新增区域的父ID
			siteReservoirInfo.setSriEditTime(new Date());
		}
		//int result = siteReservoirInfo.updateByPrimaryKeySelective(siteReservoirInfo);
		reservoirManagerService.updateByPrimaryKeySelective(siteReservoirInfo);

		//站点修改后中间表数据修改
		//siteMiddleCanal中间表插入或更新
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.updateSiteMiddle("sysArea",siteReservoirInfo.getBelongsCanalCode(),
				"device_reservoir_code",siteReservoirInfo.getDeviceReservoirCode(),request);

		return "redirect:/reservoir/list";
	}
	
	//单个删除
	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id){
		//数据删除前修改中间表数据修改
		int i = updateSiteMiddleCanal(id);

		int state = reservoirManagerService.deleteByPrimaryKey(id);

		return state+"";
	}
	
	//批量删除
	@RequestMapping(value="/deletes")
	public @ResponseBody String deletes(@RequestParam(value = "ids[]") String[] ids){
		int state=0;
		for(int i=0;i<ids.length;i++){
		 int a = reservoirManagerService.deleteByPrimaryKey(ids[i]);
		 state+=a;
		}
		return ""+state;
	}

	@RequestMapping(value = "/reservoirList",produces = "text/html; charset=utf-8")
	public @ResponseBody String reservoirList(String id){
        //根据行政区code获得canalCode
        SysUser user = userService.getCanalCode(id,"");
        if(user != null){
			//查询该行政区下的水库
			List<SiteReservoirInfo> siteReservoirInfos = reservoirManagerService.selectReservoirList(user.getCanalCode());
			if(siteReservoirInfos.size() > 0){
				return JSONObject.toJSONString(siteReservoirInfos);
			}
		}
		return "";
    }

	/**
	 * 水库站点修改时中间表的数据修改
	 * @param id
	 * @return
	 */
	private int updateSiteMiddleCanal(String id){
		int state = 0;
		SiteReservoirInfo reservoirInfo = reservoirManagerService.findSiteReservoirInfoById(id);
		if(reservoirInfo != null){
			String code = "'"+reservoirInfo.getDeviceReservoirCode()+"'";
			List<SiteMiddleCanal> siteMiddleCanalList = siteMiddleCanalService.selectMiddleCanalInfoByCode(code, "device_reservoir_code");
			if(siteMiddleCanalList.size()>0){
				for (SiteMiddleCanal canal : siteMiddleCanalList) {
					canal.setDeviceReservoirCode("");
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
