package com.zyjz.sysmanage.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zyjz.user.entity.SysUser;
import com.zyjz.user.service.UserService;
import org.apache.commons.lang3.StringUtils;
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
import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.utils.controller.BaseUtils;

/**
 * @ClassName: SysAreaController 
 * @Description: 行政区域业务控制器
 * @Author: zhaojx
 * @Date: 2017年12月21日 上午11:32:08
 */
@Controller
@RequestMapping(value="/sysArea")
public class SysAreaController {
	
	@Autowired
	private SysAreaService sysAreaService;

	/** 视图解析页面路径 */
	protected static final String SYSAREA_LIST_JSP = "/sysmanage/sys_area/area_list";
	protected static final String SYSAREA_ADD_JSP = "/sysmanage/sys_area/add_area";
	protected static final String SYSAREA_EDIT_JSP = "/sysmanage/sys_area/edit_area";
	
	/**
	 * @Title: pageList
	 * @Description: 跳转list页面
	 * @param: @return
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/pageList", method=RequestMethod.GET)
	public String pageList(Model model,HttpServletRequest request){
		
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		
		return SYSAREA_LIST_JSP;
	}

	@RequestMapping(value = "/areaTreeList", produces = "text/html; charset=utf-8")
    @ResponseBody
	public String areaTree(String waterId,String waterCode,HttpServletRequest request){
        BaseUtils baseUtils = new BaseUtils();
        String treeList = baseUtils.areaTreeList(waterCode,waterId,request);
         return treeList;
    }

	/**
	 * @Title: getParentAreaByLevel
	 * @Description: 根据级别获取最大父区域ID
	 * @param: @return
	 * @return: String
	 */
	@RequestMapping(value="/getParentAreaByLevel")
	@ResponseBody
	public String getParentAreaByLevel(){
		String pid = "";
		List<SysArea> sysAreas = sysAreaService.findAreaByLevel(0);
		if(sysAreas != null && sysAreas.size() > 0){
			pid = sysAreas.get(0).getId();
		}
		return pid;
	}
	
	/**
	 * @Title: getAreaList
	 * @Description: 获取行政区域信息列表信息
	 * @param: @param id
	 * @param: @param request
	 * @param: @param page
	 * @param: @param pageSize
	 * @return: List<SysArea>
	 */
	@RequestMapping(value="/getAreaList", method=RequestMethod.POST)
	public @ResponseBody List<SysArea> getAreaList(@RequestParam("id") String id){
		List<String> idList = Arrays.asList(id);
		List<SysArea> sysAreaList = new ArrayList<>();
		//自身查询
        SysArea sysArea = sysAreaService.findAreaById(id);
        sysAreaList.add(sysArea);
		//查询该权限下的子集
        sysAreaList.addAll(getAreasList(idList));
		return sysAreaList;
	}

	/**
	 * 递归查询行政区域的数据
	 * @param strList 父行政区域的id
	 * @return
	 */
	private List<SysArea> getAreasList(List<String> strList){
        List<String> list = strList;
        //根据父行政区域查询子行政区域集
        List<SysArea> areasList = sysAreaService.getAreasList(list);
        //如果该行政区域下有子行政区域
        if(areasList.size() > 0){
			List<String> idList = new ArrayList<>();
			for(SysArea area : areasList){
				idList = new ArrayList<>();
//				area.setParentAreaName(sys.getAreaName());
				idList.add(area.getId());
			}
			//追加行政区域集
			areasList.addAll(getAreasList(idList));
		}
        //返回行政区域
        return areasList;
    }

	/**
	 * @Title: getPages
	 * @Description: 获取session分页信息
	 * @param: @param request
	 * @return: PageInfo<SysArea>
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/getPages")
	public @ResponseBody PageInfo<SysArea> getPages(HttpServletRequest request){
		PageInfo<SysArea> pages = (PageInfo<SysArea>) request.getSession().getAttribute("pages");
		return pages;
	}
	
	/**
	 * @Title: addPage
	 * @Description: 跳转行政区域添加页面
	 * @param: @param request
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/addPage", method=RequestMethod.GET)
	public ModelAndView addPage(HttpServletRequest request){
		BaseUtils bs = new BaseUtils();
		ModelAndView modelAndView = new ModelAndView(SYSAREA_ADD_JSP);
		// 获取layer传递参数 并加入request请求域
		String id = request.getParameter("id");
		// 选中树节点新增  级别为当前区域级别+1
		int level = 0;
		if(!StringUtils.isEmpty(request.getParameter("areaLevel"))){
			level = Integer.parseInt(request.getParameter("areaLevel"));
			modelAndView.addObject("areaLevel", level + 1);
		}else{
			modelAndView.addObject("areaLevel", level);

		}

		//父行政区域编码
		modelAndView.addObject("areaCode",
				bs.codeGeneration("sysArea",request.getParameter("areaCode"),request.getParameter("areaLevel")));
//		modelAndView.addObject("areaLevel", level + 1);
		modelAndView.addObject("parentAreaId", id);
		return modelAndView;
	}
	
	/**
	 * @Title: saveAreaInfo
	 * @Description: 保存新增行政区域信息
	 * @param: @param request
	 * @param: @param sysArea
	 * @return: int
	 */
	@RequestMapping(value="/saveAreaInfo", method=RequestMethod.POST)
    @ResponseBody
	public String saveAreaInfo(String result){
		SysArea sysArea = JSONObject.parseObject(result, SysArea.class);
		sysArea.setId(UUID.randomUUID().toString().replace("-", ""));
		sysArea.setSaCreateTime(new Date());
		sysArea.setSaEditTime(new Date());
		int flag = sysAreaService.insertSelective(sysArea);
        return flag+"";
	}
	
	/**
	 * @Title: deleteAreasById
	 * @Description: 删除区域信息(包括批量)
	 * @param: @param request
	 * @return: void
	 */
	@RequestMapping(value="/deleteAreasById")
	@ResponseBody
	public String deleteAreasById(String id){
		int result = 0;
//		String ids = request.getParameter("id");
		if(!"".equals(id) && id != null){
			result = sysAreaService.deleteByPrimaryKey(id);
		}
		return result + "";
	}
	
	/**
	 * @Title: editAreasPage
	 * @Description: 跳转信息编辑页面
	 * @param: @param id
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/editAreasPage", method=RequestMethod.GET)
	public ModelAndView editAreasPage(String id){
		ModelAndView modelAndView = new ModelAndView(SYSAREA_EDIT_JSP);
		SysArea sysArea = null;
		if(!id.equals("") && id != null){
			sysArea = sysAreaService.selectByPrimaryKey(id);
		}
		modelAndView.addObject("sysArea", sysArea);
		return modelAndView;
	}
	
	/**
	 * @Title: editSaveAreasInfo
	 * @Description: 保存修改的信息
	 * @param: @param request
	 * @param: @param SysArea
	 * @return: int
	 */
	@RequestMapping(value="/editSaveAreasInfo", method=RequestMethod.POST)
	@ResponseBody
	public String editSaveAreasInfo(String result){
		SysArea sysArea = JSONObject.parseObject(result, SysArea.class);
		sysArea.setSaEditTime(new Date());;
//		if(sysArea != null){
//			// 将选中节点的ID设置为新增区域的父ID
//			sysArea.setSaEditTime(new Date());;
//		}
		int state = sysAreaService.updateByPrimaryKeySelective(sysArea);
		return state+"";
	}
	
	/**
	 * <p>Description: ajax请求获取Area</p>
	 * @author 
	 *	@data 2017年12月28日 下午2:19:47
	 */
	@RequestMapping(value="/ajax_findArea")
	public @ResponseBody SysArea ajaxFindAreaById(String id){
		System.out.println(id+"++++++++++++++++++++++++++");
		SysArea sysArea = sysAreaService.findAreaById(id);
		return sysArea;
	}
	
}