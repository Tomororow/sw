package com.zyjz.sysmanage.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.zyjz.sitemanage.entity.MeteorSurveySite;
import com.zyjz.sysmanage.entity.SysArea;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.sysmanage.entity.SysWaterArea;
import com.zyjz.sysmanage.service.SysWaterAreaService;
import com.zyjz.utils.controller.BaseUtils;
import org.springframework.web.servlet.ModelAndView;

/** <p>Title:SysWaterAreaController </p>
 * <p>Description: 水管区域管理</p>
 * <p>Company: </p> 
 * @author rww
 *	@data 2017年12月22日 下午3:42:17
 */

@Controller
@RequestMapping(value="/sys_water_area")
public class SysWaterAreaController {
	
	@Autowired
    SysWaterAreaService sysWaterAreaService;
	
	/** 视图解析页面路径 */
	protected static final String SysWaterArea_LIST_JSP = "/sysmanage/sys_water_area/list";
	protected static final String ADD_SysWaterArea_JSP = "/sysmanage/sys_water_area/add_water_area";
	protected static final String SysWaterArea_EDIT_JSP = "/sysmanage/sys_water_area/edit_water_area";
	
	/**
	 * <p>Description: 水管区域list</p>
	 * @author rww
	 *	@data 2017年12月22日 下午4:28:19
	 */
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request,int state){
		
		
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
//		baseUtils.waterTreeList(null,null,request);
		
		//List<SysWaterArea> sysWaterAreaList = sysWaterAreaService.findAllWaterAreas();
		//model.addAttribute("sysWaterAreaList", sysWaterAreaList);
		return SysWaterArea_LIST_JSP;
	}
	@RequestMapping(value="/water_tree",produces = "text/html; charset=utf-8")
	@ResponseBody
	public String waterAreaTree(String waterId,String waterCode,HttpServletRequest request){
		BaseUtils baseUtils = new BaseUtils();
		String treeList = baseUtils.waterTreeList(waterCode,waterId,request);
		return treeList;
	}
	
	/**
	 * <p>Description:水管区域可变列表查询 </p>
	 * @author rww
	 *	@data 2017年12月25日 下午2:00:06
	 */
	@RequestMapping(value="/list_table")
	public @ResponseBody List<SysWaterArea> listTable(Model model,String id){
		//当前点击的区域
		SysWaterArea sysWaterArea = sysWaterAreaService.findWaterAreaById(id);
		//子区域的列表
		List<SysWaterArea> sonSysWaterAreaList = sysWaterAreaService.findSonSysWaterAreasByPidAndWaterAreaLevel(sysWaterArea.getId(),sysWaterArea.getWaterAreaLevel()+1);
		//把当前的区域加入到列表中
		
		sonSysWaterAreaList.add(sysWaterArea);
		return sonSysWaterAreaList;
	}
	
	/**
	 * <p>Description: ajax获取最高父级</p>
	 * @author rww
	 *	@data 2017年12月26日 下午3:04:05
	 */
	@RequestMapping(value="/pId")
	public @ResponseBody String getPId(){
		
		List<SysWaterArea> sysWaterAreaList = sysWaterAreaService.findWaterAreaByLevel(0);
		
		return sysWaterAreaList.get(0).getId();
	}
	
	/**
	 * <p>Description: ajax获取最高父级</p>
	 * @author rww
	 *	@data 2017年12月26日 下午3:04:05
	 */
	@RequestMapping(value="/level")
	public @ResponseBody List<SysWaterArea> getSysWaterAreaByLevel(){
		List<SysWaterArea> sysWaterAreaList = sysWaterAreaService.findWaterAreaByLevel(0);
		return sysWaterAreaList;
	}
	
	/**
	 * <p>Description: 分页查询</p>
	 * @author rww
	 *	@data 2017年12月26日 下午3:46:05
	 */
	List<String> ids = new ArrayList<>();
	@RequestMapping(value="/page", method= RequestMethod.POST)
	public @ResponseBody List<SysWaterArea> page(@RequestParam("id") String id){
		List<String> idList = Arrays.asList(id);
		List<SysWaterArea> sysWaterAreaList = new ArrayList<>();
		//自身查询
		SysWaterArea sysWaterArea = sysWaterAreaService.findWaterAreaById(id);
		sysWaterAreaList.add(sysWaterArea);
		//查询该权限下的子集
		sysWaterAreaList.addAll(getWaterAreasList(idList));

		return sysWaterAreaList;
	}

	/**
	 * 递归查询行政区域的数据
	 * @param strList 父行政区域的id
	 * @return
	 */
	private List<SysWaterArea> getWaterAreasList(List<String> strList){
		List<String> list = strList;
		//根据父行政区域查询子行政区域集
		List<SysWaterArea> waterAreasList = sysWaterAreaService.getWaterAreasList(list);
		//如果该行政区域下有子行政区域
		if(waterAreasList.size() > 0){
			List<String> idList = new ArrayList<>();
			for(SysWaterArea area : waterAreasList){
				idList.add(area.getId());
			}
			//追加行政区域集
			waterAreasList.addAll(getWaterAreasList(idList));
		}
		//返回行政区域
		return waterAreasList;
	}

	/**
	 * 导航条
	 * <p>Description: </p>
	 * @author rww
	 *	@data 2017年12月27日 下午6:00:31
	 */
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<SysWaterArea> pageNav(HttpServletRequest request){
		PageInfo<SysWaterArea> pages = (PageInfo<SysWaterArea>) request.getSession().getAttribute("pages");
		return pages;
	}
	
	/**
	 * <p>Description:进入水管区添加页面 </p>
	 * @author rww
	 *	@data 2017年12月22日 下午5:20:07
	 */
	@RequestMapping(value="/add_sysWaterArea", method=RequestMethod.GET)
	public ModelAndView addSysWaterArea(HttpServletRequest request){
		BaseUtils bs = new BaseUtils();
		ModelAndView modelAndView = new ModelAndView(ADD_SysWaterArea_JSP);

		// 选中树节点新增  级别为当前区域级别+1
		int level = 0;
		if(!StringUtils.isEmpty(request.getParameter("waterAreaLevel"))){
			level = Integer.parseInt(request.getParameter("waterAreaLevel"));
			modelAndView.addObject("waterAreaLevel",level+1);
		}else{
			modelAndView.addObject("waterAreaLevel",level);

		}

		//父行政区域编码
		modelAndView.addObject("waterAreaCode",
				bs.codeGeneration("sysWaterArea", request.getParameter("waterAreaCode"),request.getParameter("waterAreaLevel")));
//		modelAndView.addObject("waterAreaLevel",level+1);
		modelAndView.addObject("parentWaterareaId",request.getParameter("id"));
		return modelAndView;
	}
	
	/**
	 * <p>Description:添加水管区 </p>
	 * @author rww
	 *	@data 2017年12月22日 下午5:20:27
	 */
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public @ResponseBody String add(String result){
		SysWaterArea sysWaterArea = JSONObject.parseObject(result, SysWaterArea.class);
//		int waterAreaLevel  = sysWaterArea.getWaterAreaLevel() +1;
//		sysWaterArea.setWaterAreaLevel(waterAreaLevel);
		sysWaterArea.setSwaCreateTime(new Date());
		sysWaterArea.setSwaEditTime(new Date());
		//将当前区域保存到数据库
		
		int state = sysWaterAreaService.add(sysWaterArea);
		
		return state + "";
	}
	
	/**
	 * <p>Description: 单条记录删除</p>
	 * @author rww
	 *	@data 2017年12月28日 上午8:31:16
	 */
	@RequestMapping(value="/delete_byid")
	public @ResponseBody String deleteById(String id){
		SysWaterArea sysWaterArea = sysWaterAreaService.findWaterAreaById(id);
		//找到父一级
		String pid = sysWaterArea.getParentWaterareaId();
		//首先找传来id的子一级目录
		int state = delete(id);
//		delete(id);
		return state + "";
	}
	
	
	/**
	 * <p>Description:递归删除 </p>
	 * @author rww
	 *	@data 2017年12月28日 上午8:52:31
	 */
	public void deleteAreaByPId(String id){
		List<SysWaterArea> list = sysWaterAreaService.findWaterAreaByPId(id);
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				sysWaterAreaService.deleteById(list.get(i).getId());
				List<SysWaterArea> list2 = sysWaterAreaService.findWaterAreaByPId(list.get(i).getId());
				if(list2!=null&&list2.size()>0){
					deleteAreaByPId(list.get(i).getParentWaterareaId());
				}
			}
		}
	}
	
	public int delete(String id){
		List<SysWaterArea> list = sysWaterAreaService.findWaterAreaByPId(id);
		int state = 0;
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				sysWaterAreaService.deleteById(list.get(i).getId());
				state = delete(list.get(i).getId());
			}
		}else{
			state = sysWaterAreaService.deleteById(id);
		}
		return state;
	}
	
	/**
	 * <p>Description: ajax请求获取WaterArea</p>
	 * @author rww
	 *	@data 2017年12月28日 下午2:19:47
	 */
	@RequestMapping(value="/ajax_findWaterArea")
	public @ResponseBody SysWaterArea ajaxFindWaterAreaById(String id){
		SysWaterArea sysWaterArea = sysWaterAreaService.findWaterAreaById(id);
		return sysWaterArea;
	}
	
	
	/**
	 * <p>Description: 编辑sysWaterArea</p>
	 * @author rww
	 *	@data 2017年12月28日 下午2:20:46
	 */
	@RequestMapping(value="/edit")
	public String edit(SysWaterArea sysWaterArea){
		sysWaterArea.setSwaEditTime(new Date());
		
		sysWaterAreaService.updateWaterArea(sysWaterArea);


		return "redirect:/sys_water_area/page";
	}

	/**
	 * 水管区域页修改
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/editWaterAreasPage", method=RequestMethod.GET)
	public ModelAndView editWaterAreaPage(String id){
		ModelAndView modelAndView = new ModelAndView(SysWaterArea_EDIT_JSP);
		SysWaterArea sysWaterArea = null;
		if(!id.equals("") && id != null){
			sysWaterArea = sysWaterAreaService.findWaterAreaById(id);
		}
		modelAndView.addObject("sysWaterArea", sysWaterArea);
		return modelAndView;
	}

	/**
	 * 水管区域页修改提交
	 * @param result
	 * @return
	 */
	@RequestMapping(value = "/editWaterAreaSubmit", method=RequestMethod.POST)
	public @ResponseBody String editWaterAreaSubmit(String result){
		SysWaterArea sysWaterArea = JSONObject.parseObject(result, SysWaterArea.class);
		if(sysWaterArea != null){
			sysWaterArea.setSwaEditTime(new Date());
		}
		int state = sysWaterAreaService.updateByPrimaryKeySelective(sysWaterArea);
		return state+"";
	}
}
