package com.zyjz.plan.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.plan.entity.SoilTypeInfo;
import com.zyjz.plan.service.SoilsTypeInfoService;
import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.utils.controller.BaseUtils;

/**
 * @ClassName: SoilsTypeInfoController
 * @Description: 土地类型管理
 * @Author: zhaojx
 * @Date: 2018年2月25日 上午8:50:47
 */
@Controller
@RequestMapping(value="/soils")
public class SoilsTypeInfoController {
	
	@Autowired
	private SoilsTypeInfoService soilsTypeInfoService;
	
	@Autowired
    SysAreaService sysAreaService;

	/** 视图解析页面路径 */
	protected static final String SOILS_LIST_JSP = "/plan/soils_type/soils_type_list";
	protected static final String SOILS_ADD_JSP = "/plan/soils_type/add_soils_type";
	protected static final String SOILS_EDIT_JSP = "/plan/soils_type/edit_soils_type";
	
	/**
	 * @Title: list
	 * @Description: 跳转列表信息页面
	 * @param: @return
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/list")
	public String  list(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return SOILS_LIST_JSP;
	}
	
	/**
	 * 跳转至土地类型管理
	 * 的修改页面
	 */
	/*@RequestMapping("/updateData")
	@ResponseBody
	public String update(){
		
		return UPDATE;
	}*/
	
	
	
	private List<String> areaCodes = new ArrayList<String>();
	/**
	 * @Title: getSoilslist
	 * @Description: 土地类型分页查询
	 * @param: @param id
	 * @param: @param request
	 * @param: @param page
	 * @param: @param pageSize
	 * @return: List<SoilTypeInfo>
	 */
	@RequestMapping(value="/getSoilslist")
	public @ResponseBody List<SoilTypeInfo> getSoilslist(String id ,HttpServletRequest request, @RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="10") Integer pageSize){
		PageHelper.startPage(page, pageSize);
		
		SysArea sysArea= sysAreaService.findAreaById(id);
		String areaCode = sysArea.getAreaCode();
		getAreaCode(id);
		areaCodes.add(areaCode);
		PageHelper.startPage(page, pageSize);
		List<SoilTypeInfo> solisList = soilsTypeInfoService.findSoilTypeByAreaCodes(areaCodes);
		for(SoilTypeInfo soilTypeInfo:solisList){
			SysArea sysAread = sysAreaService.findAreaBySysareaCode(soilTypeInfo.getAreaCode());
			soilTypeInfo.setAreaCode(sysAread.getAreaName());
		}
		PageInfo<SoilTypeInfo> pages = new PageInfo<SoilTypeInfo>(solisList);
		areaCodes.clear();
		request.getSession().setAttribute("pages", pages);
		return solisList;
	}
	
	public void getAreaCode(String id){
		List<SysArea>  sysAreaList = sysAreaService.findAreaByPId(id);
		if(sysAreaList!=null&&sysAreaList.size()>0){
			for(int i=0;i<sysAreaList.size();i++){
				areaCodes.add(sysAreaList.get(i).getAreaCode());
				List<SysArea>  sysAreaList2 = sysAreaService.findAreaByPId(sysAreaList.get(i).getId());
				if(sysAreaList2!=null&&sysAreaList2.size()>0){
					getAreaCode(sysAreaList.get(i).getId());
				}
				
			}
		}
	}
	
	/**
	 * @Title: getPages
	 * @Description: 获取session分页信息
	 * @param: @param request
	 * @return: PageInfo<SoilTypeInfo>
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/getPages")
	public @ResponseBody PageInfo<SoilTypeInfo> getPages(HttpServletRequest request){
		PageInfo<SoilTypeInfo> pages = (PageInfo<SoilTypeInfo>) request.getSession().getAttribute("pages");
		return pages;
	}
	
	/**
	 * @Title: addPage
	 * @Description: 跳转土地类型添加页面
	 * @param: @param request
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/addPage")
	public ModelAndView addPage(HttpServletRequest request,String areaId,Model model){
		SysArea sysArea= sysAreaService.findAreaById(areaId);
		model.addAttribute("areaCode", sysArea.getAreaCode());
		model.addAttribute("areaName", sysArea.getAreaName());
		
		return new ModelAndView(SOILS_ADD_JSP);
	}
	
	/**
	 * @Title: saveSoilsInfo
	 * @Description: 保存土地类型信息
	 * @param: @param request
	 * @param: @param SoilTypeInfo
	 * @return: void
	 */
	@RequestMapping(value="/saveSoilsInfo", method=RequestMethod.POST)
	@ResponseBody
	public int saveSoilsInfo(HttpServletRequest request, SoilTypeInfo soilTypeInfo){
		if(soilTypeInfo != null){
			soilTypeInfo.setId(UUID.randomUUID().toString().replace("-", ""));
			// 将选中节点的ID设置为新增区域的父ID
			soilTypeInfo.setStiCreateTime(new Date());
			soilTypeInfo.setStiEditTime(new Date());;
		}
		int result = soilsTypeInfoService.insertSelective(soilTypeInfo);
		return result;
	}
	
	
	
	
	//单个删除
		@RequestMapping(value="/delete")
		public @ResponseBody String delete(String id){
			System.out.println("===========id===============>"+id);
			int state = soilsTypeInfoService.deleteByPrimaryKey(id);
			return state+"";
		}
		
	/**
	 * @Title: deleteSoilsById
	 * @Description: 删除土地类型信息(包括批量)
	 * @param: @param request
	 * @return: void
	 */
	@RequestMapping(value="/deleteSoilsById", method=RequestMethod.POST)
	@ResponseBody
	public int deleteSoilsById(HttpServletRequest request){
		int result = 0;
		String ids = request.getParameter("ids");
		if(!ids.equals("") && ids != null){
			result = soilsTypeInfoService.deleteByPrimaryKey(ids);
		}
		return result;
	}
	
	/**
	 * @Title: editSoilsPage
	 * @Description: 跳转信息编辑页面
	 * @param: @param id
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/editSoilsPage", method=RequestMethod.GET)
	public ModelAndView editSoilsPage(String id){
		ModelAndView modelAndView = new ModelAndView(SOILS_EDIT_JSP);
		SoilTypeInfo soilTypeInfo = null;
		if(!id.equals("") && id != null){
			soilTypeInfo = soilsTypeInfoService.selectByPrimaryKey(id);
		}
		modelAndView.addObject("soilTypeInfo", soilTypeInfo);
		return modelAndView;
	}
	
	/**
	 * @Title: editSaveSoilsInfo
	 * @Description: 保存修改的信息
	 * @param: @param request
	 * @param: @param SoilTypeInfo
	 * @return: int
	 */
	@RequestMapping(value="/editSaveSoilsInfo", method=RequestMethod.POST)
	@ResponseBody
	public int editSaveSoilsInfo(HttpServletRequest request, SoilTypeInfo soilTypeInfo){
		if(soilTypeInfo != null){
			// 将选中节点的ID设置为新增区域的父ID
			soilTypeInfo.setStiEditTime(new Date());;
		}
		int result = soilsTypeInfoService.updateByPrimaryKeySelective(soilTypeInfo);
		return result;
	}
}