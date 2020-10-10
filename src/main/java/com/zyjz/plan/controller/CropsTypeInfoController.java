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
import com.zyjz.plan.entity.CropsTypeInfo;
import com.zyjz.plan.service.CropsTypeInfoService;
import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.utils.controller.BaseUtils;

/**
 * @ClassName: CropsTypeInfoController
 * @Description: 农作物管理
 * @Author: zhaojx
 * @Date: 2018年2月25日 上午8:50:47
 */
@Controller
@RequestMapping(value="/crops")
public class CropsTypeInfoController {
	
	@Autowired
	private CropsTypeInfoService cropsTypeInfoService;
	
	@Autowired
    SysAreaService sysAreaService;

	/** 视图解析页面路径 */
	protected static final String CROPS_LIST_JSP = "/plan/crops_type/crops_type_list";
	protected static final String CROPS_ADD_JSP = "/plan/crops_type/add_crops_type";
	protected static final String CROPS_EDIT_JSP = "/plan/crops_type/edit_crops_type";
	
	/**
	 * @Title: list
	 * @Description: 跳转列表信息页面
	 * @param: @return
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Model model,HttpServletRequest request){
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		return new ModelAndView(CROPS_LIST_JSP);
	}
	private List<String> areaCodes = new ArrayList<String>();
	/**
	 * @Title: getCropslist
	 * @Description: 农作物信息分页查询
	 * @param: @param id
	 * @param: @param request
	 * @param: @param page
	 * @param: @param pageSize
	 * @return: List<CropsTypeInfo>
	 */
	@RequestMapping(value="/getCropslist")
	public @ResponseBody List<CropsTypeInfo> getCropslist(String id,HttpServletRequest request, @RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="10") Integer pageSize){
		PageHelper.startPage(page, pageSize);
		
		//当前点击的区域
		//把当前的区域加入到列表中
		SysArea sysArea= sysAreaService.findAreaById(id);
		String areaCode = sysArea.getAreaCode();
		getAreaCode(id);
		areaCodes.add(areaCode);
		PageHelper.startPage(page, pageSize);
		
		List<CropsTypeInfo> cropsList = cropsTypeInfoService.findCropsTypeInfoByAreaCodes(areaCodes);
		//清空全局list
		areaCodes.clear();
		for(CropsTypeInfo cropsTypeInfo:cropsList){
			SysArea sysAread = sysAreaService.findAreaBySysareaCode(cropsTypeInfo.getSysareaCode());
			cropsTypeInfo.setSysareaCode(sysAread.getAreaName());
		}
		PageInfo<CropsTypeInfo> pages = new PageInfo<CropsTypeInfo>(cropsList);
		request.getSession().setAttribute("pages", pages);
		return cropsList;
	}
	
	//递归拿到所有
		public void getAreaCode(String id){
			//List<String> canalCodes = new ArrayList<String>();
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
	 * @return: PageInfo<CropsTypeInfo>
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/getPages")
	public @ResponseBody PageInfo<CropsTypeInfo> getPages(HttpServletRequest request){
		PageInfo<CropsTypeInfo> pages = (PageInfo<CropsTypeInfo>) request.getSession().getAttribute("pages");
		return pages;
	}
	
	/**
	 * @Title: addPage
	 * @Description: 跳转农作物添加页面
	 * @param: @param request
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/addPage")
	public ModelAndView addPage(HttpServletRequest request,Model model,String areaId){
		
		SysArea sysArea= sysAreaService.findAreaById(areaId);
		model.addAttribute("areaCode", sysArea.getAreaCode());
		return new ModelAndView(CROPS_ADD_JSP);
	}
	
	/**
	 * @Title: saveCropsInfo
	 * @Description: 保存农作物信息
	 * @param: @param request
	 * @param: @param cropsTypeInfo
	 * @return: void
	 */
	@RequestMapping(value="/saveCropsInfo", method=RequestMethod.POST)
	@ResponseBody
	public int saveCropsInfo(HttpServletRequest request, CropsTypeInfo cropsTypeInfo){
		
		System.out.println("=============SysareaCode===================>"+cropsTypeInfo.getSysareaCode());
		if(cropsTypeInfo != null){
			cropsTypeInfo.setId(UUID.randomUUID().toString().replace("-", ""));
			// 将选中节点的ID设置为新增区域的父ID
			cropsTypeInfo.setCtiCreateTime(new Date());
			cropsTypeInfo.setCtiEditTime(new Date());;
		}
		int result = cropsTypeInfoService.insertSelective(cropsTypeInfo);
		return result;
	}
	
	/**
	 * @Title: deleteCropsById
	 * @Description: 删除农作物信息(包括批量)
	 * @param: @param request
	 * @return: void
	 */
	@RequestMapping(value="/deleteCropsById", method=RequestMethod.POST)
	@ResponseBody
	public int deleteCropsById(HttpServletRequest request){
		int result = 0;
		String ids = request.getParameter("id");
		if(!ids.equals("") && ids != null){
			result = cropsTypeInfoService.deleteByPrimaryKey(ids);
		}
		return result;
	}
	
	/**
	 * @Title: editCropsPage
	 * @Description: 跳转信息编辑页面
	 * @param: @param id
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/editCropsPage")
	public ModelAndView editCropsPage(String id){
		ModelAndView modelAndView = new ModelAndView(CROPS_EDIT_JSP);
		CropsTypeInfo cropsTypeInfo = null;
		if(!id.equals("") && id != null){
			cropsTypeInfo = cropsTypeInfoService.selectByPrimaryKey(id);
		}
		modelAndView.addObject("cropsTypeInfo", cropsTypeInfo);
		return modelAndView;
	}
	
	/**
	 * @Title: editSaveCropsInfo
	 * @Description: 保存修改的信息
	 * @param: @param request
	 * @param: @param cropsTypeInfo
	 * @return: int
	 */
	@RequestMapping(value="/editSaveCropsInfo", method=RequestMethod.POST)
	@ResponseBody
	public int editSaveCropsInfo(HttpServletRequest request, CropsTypeInfo cropsTypeInfo){
		if(cropsTypeInfo != null){
			// 将选中节点的ID设置为新增区域的父ID
			cropsTypeInfo.setCtiEditTime(new Date());;
		}
		int result = cropsTypeInfoService.updateByPrimaryKeySelective(cropsTypeInfo);
		return result;
	}
}