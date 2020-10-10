package com.zyjz.sysmanage.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.zyjz.sysmanage.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.sysmanage.service.CanalFlowHightService;
import com.zyjz.sysmanage.service.SiteFlowrateService;
import com.zyjz.sysmanage.service.SiteSpeedService;
import com.zyjz.sysmanage.service.SiteWaterService;
import com.zyjz.utils.ExportExcel;

@Controller
@RequestMapping(value="/site_flowrate_manage")
public class SiteFlowrateInfoController {
	@Autowired
	SiteFlowrateService siteFlowrateService;
	@Autowired
	CalCanalInfoService calCanalInfoService;
	@Autowired
	SiteSpeedService siteSpeedService;
	@Autowired
	SiteWaterService siteWaterService;
	@Autowired
	CanalFlowHightService canalFlowHightService;
	
	protected static final String ADD_SITE_JSP = "/sysmanage/site_manage/add_flowrateSite";
	protected static final String EDIT_SITE_JSP = "/sysmanage/site_manage/edit_flowrateSite";
	
	
	@RequestMapping(value="/page")
	public @ResponseBody List<SiteFlowrateInfo> siteFlowratePage(String id,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
		
		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(id);
		
		//当前点击的区域
		//把当前的区域加入到列表中
			PageHelper.startPage(page, pageSize);
			
			List<SiteFlowrateInfo> list = siteFlowrateService.findSiteFlowrateInfoByCanalCode(calCanalInfo.getCanalCode());
			
			PageInfo<SiteFlowrateInfo> pages = new PageInfo<SiteFlowrateInfo>(list);
			
			request.getSession().setAttribute("siteFlowrateInfoPages", pages);
	        
		return list;
	}
	
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<SiteFlowrateInfo> siteFlowratePageNav(HttpServletRequest request){
		PageInfo<SiteFlowrateInfo> pages = (PageInfo<SiteFlowrateInfo>) request.getSession().getAttribute("siteFlowrateInfoPages");
		return pages;
	}
	
	@RequestMapping(value="/add_page")
	public String addPage(String id,Model model){
		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(id);
		//拿到当前渠上所有的流速站
		List<SiteSpeedInfo> siteSpeedInfoList = siteSpeedService.findSiteSpeedInfoByCanalCode(calCanalInfo.getCanalCode());
		//拿到当前渠上所有的水位站
		List<SiteWaterInfo> siteWaterInfoList = siteWaterService.findSiteWaterInfoByCanalCode(calCanalInfo.getCanalCode());
		
		model.addAttribute("calCanalInfo", calCanalInfo);
		model.addAttribute("siteSpeedInfoList", siteSpeedInfoList);
		model.addAttribute("siteWaterInfoList", siteWaterInfoList);
		
		return ADD_SITE_JSP;
	}
	
	//添加流量站
	@RequestMapping(value="/add")
	public String add(SiteFlowrateInfo siteFlowrateInfo,Model model) throws IllegalStateException, IOException{
		siteFlowrateInfo.setFsiCreateTime(new Date());
		siteFlowrateService.addSiteFlowrateInfo(siteFlowrateInfo);
		return "redirect:/site_water_manage/list";
	}
	
	
	@RequestMapping(value="/edit_page")
	public String editPage(String id,Model model){
		SiteFlowrateInfo siteFlowrateInfo = siteFlowrateService.findSiteFlowrateInfoById(id);
		//拿到当前渠上所有的流速站
		List<SiteSpeedInfo> siteSpeedInfoList = siteSpeedService.findSiteSpeedInfoByCanalCode(siteFlowrateInfo.getFsiCanalCode());
		//拿到当前渠上所有的水位站
		List<SiteWaterInfo> siteWaterInfoList = siteWaterService.findSiteWaterInfoByCanalCode(siteFlowrateInfo.getFsiCanalCode());
		model.addAttribute("siteFlowrateInfo", siteFlowrateInfo);
		model.addAttribute("siteSpeedInfoList", siteSpeedInfoList);
		model.addAttribute("siteWaterInfoList", siteWaterInfoList);
		return EDIT_SITE_JSP;
	}
	
	
	//流量站编辑保存=====
	@RequestMapping(value="/edit")
	public String edit(SiteFlowrateInfo siteFlowrateInfo) throws Exception{
		siteFlowrateInfo.setFsiEditTime(new Date());	
		siteFlowrateService.updateSiteFlowrateInfo(siteFlowrateInfo);

		return "redirect:/site_water_manage/list";
	}
	
	//流量站单个删除
	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id){
		int state = siteFlowrateService.delete(id);
		
		return state+"";
	}
	
	//流量站物批量删除
	@RequestMapping(value="/deletes")
	public @ResponseBody String deletes(@RequestParam(value = "ids[]") String[] ids){
		int state=0;
		for(int i=0;i<ids.length;i++){
		 int a = siteFlowrateService.delete(ids[i]);
		 state+=a;
		}
		return ""+state;
	}
	//水位流量关系表Excel导入
	@RequestMapping("/test_Excel")
	@ResponseBody
	public JsonResult testExcel(MultipartFile file){
		List<CanalFlowHightExcel>  swiList = ExportExcel.importExcel(file,1, 1,CanalFlowHightExcel.class );
		List<SiteWaterInfo> seiList = siteWaterService.findAllSiteWater();
		 for(SiteWaterInfo swi :seiList){
			for(CanalFlowHightExcel swe:swiList){
				CanalFlowHight cfh = new CanalFlowHight();
				cfh.setCreateTime(new Date());
				cfh.setRemark("");
				cfh.setDownerLimit(swe.getDownerLimit());
				cfh.setFlow(swe.getFlow());
				cfh.setUpperLimit(swe.getUpperLimit());
				cfh.setWaterSiteId(swi.getId());
				canalFlowHightService.insertSelective(cfh);
			}
		}
		return new JsonResult();
	}

	
}
