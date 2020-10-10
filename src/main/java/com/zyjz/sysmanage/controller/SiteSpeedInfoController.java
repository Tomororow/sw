package com.zyjz.sysmanage.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.sysmanage.entity.CalCanalInfo;
import com.zyjz.sysmanage.entity.SiteDeviceModel;
import com.zyjz.sysmanage.entity.SiteSpeedInfo;
import com.zyjz.sysmanage.service.BaseParamService;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.sysmanage.service.SiteSpeedService;

@Controller
@RequestMapping(value="/site_speed_manage")
public class SiteSpeedInfoController {
	
	@Autowired
	SiteSpeedService siteSpeedService;
	@Autowired
	CalCanalInfoService calCanalInfoService;
	
	@Autowired
	BaseParamService baseParamService;
	
	/** 视图解析页面路径 */
	protected static final String ADD_SITE_JSP = "/sysmanage/site_manage/add_speedSite";
	protected static final String EDIT_SITE_JSP = "/sysmanage/site_manage/edit_speedSite";
	
	
	@RequestMapping(value="/page")
	public @ResponseBody List<SiteSpeedInfo> siteSpeedPage(String id,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
		
		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(id);
		
		//当前点击的区域
		//把当前的区域加入到列表中
			PageHelper.startPage(page, pageSize);
			
			List<SiteSpeedInfo> list = siteSpeedService.findSiteSpeedInfoByCanalCode(calCanalInfo.getCanalCode());
			
			PageInfo<SiteSpeedInfo> pages = new PageInfo<SiteSpeedInfo>(list);
			
			request.getSession().setAttribute("siteSpeedInfoPages", pages);
	        
		return list;
	}
	
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<SiteSpeedInfo> siteSpeedPageNav(HttpServletRequest request){
		PageInfo<SiteSpeedInfo> pages = (PageInfo<SiteSpeedInfo>) request.getSession().getAttribute("siteSpeedInfoPages");
		return pages;
	}
	
	
	@RequestMapping(value="/add_page")
	public String addPage(String id,Model model){
		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(id);
		List<SiteDeviceModel> siteDeviceModelList = baseParamService.findAllSiteDeviceModel();
		
		model.addAttribute("calCanalInfo", calCanalInfo);
		model.addAttribute("siteDeviceModelList", siteDeviceModelList);
		return ADD_SITE_JSP;
	}
	
	//流速站添加
	@RequestMapping(value="/add")
	public String add(SiteSpeedInfo siteSpeedInfo,Model model,@RequestParam MultipartFile[] file) throws IllegalStateException, IOException{
		for(int i=0;i<file.length;i++){
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
				siteSpeedInfo.setSsiPhotoBefore(picName + extName);
			}else if(i==1){
				siteSpeedInfo.setSsiPhotoAfter(picName + extName);
			}
		}
		
		siteSpeedInfo.setSsiCreateTime(new Date());
		siteSpeedService.addSiteSpeedInfo(siteSpeedInfo);
		return "redirect:/site_water_manage/list";
	}
	
	@RequestMapping(value="/edit_page")
	public String editPage(String id,Model model){
		SiteSpeedInfo siteSpeedInfo = siteSpeedService.findSiteSpeedInfoById(id);
		model.addAttribute("siteSpeedInfo", siteSpeedInfo);
		List<SiteDeviceModel> siteDeviceModelList = baseParamService.findAllSiteDeviceModel();
		
		model.addAttribute("siteDeviceModelList", siteDeviceModelList);
		
		return EDIT_SITE_JSP;
	}
	
	
	//流速站编辑保存=====
	@RequestMapping(value="/edit")
	public String edit(SiteSpeedInfo siteSpeedInfo,@RequestParam MultipartFile[] file) throws Exception{
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
						siteSpeedInfo.setSsiPhotoBefore(picName + extName);
					}else if(i==1){
						siteSpeedInfo.setSsiPhotoAfter(picName + extName);
					}
				}
			}
		}
		siteSpeedInfo.setSsiEditTime(new Date());	
		siteSpeedService.updateSiteSpeedInfo(siteSpeedInfo);

		return "redirect:/site_water_manage/list";
	}
	
	//流速站单个删除
	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id){
		int state = siteSpeedService.delete(id);
		
		return state+"";
	}
		
	//流速站物批量删除
	@RequestMapping(value="/deletes")
	public @ResponseBody String deletes(@RequestParam(value = "ids[]") String[] ids){
		int state=0;
		for(int i=0;i<ids.length;i++){
		 int a = siteSpeedService.delete(ids[i]);
		 state+=a;
		}
		return ""+state;
	}
	
}
