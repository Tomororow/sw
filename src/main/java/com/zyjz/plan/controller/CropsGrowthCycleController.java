package com.zyjz.plan.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.zyjz.plan.entity.CropsGrowthCycle;
import com.zyjz.plan.entity.CropsTypeInfo;
import com.zyjz.plan.entity.SoilTypeInfo;
import com.zyjz.plan.service.CropsGrowthCycleService;
import com.zyjz.plan.service.CropsTypeInfoService;
import com.zyjz.plan.service.SoilsTypeInfoService;
import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.utils.controller.BaseUtils;

/**
 * @ClassName: CropsGrowthCycleController
 * @Description: 农作物生长周期管理
 * @Author: zhaojx
 * @Date: 2018年2月28日 下午5:49:20
 */
@Controller
@RequestMapping(value="/cropsCycle")
public class CropsGrowthCycleController {
	
	@Autowired
	private CropsGrowthCycleService cropsGrowthCycleService;
	
	@Autowired
    SysAreaService sysAreaService;
	
	@Autowired
	SoilsTypeInfoService soilTypeService;
	
	@Autowired
	private CropsTypeInfoService cropsTypeInfoService;

	/** 视图解析页面路径 */
	protected static final String CROPS_CYCLE_LIST_JSP = "/plan/crops_cycle/crops_cycle_list";
	protected static final String CROPS_CYCLE_ADD_JSP = "/plan/crops_cycle/add_crops_cycle";
	protected static final String CROPS_CYCLE_EDIT_JSP = "/plan/crops_cycle/edit_crops_cycle";
	
	/**
	 * @Title: list
	 * @Description: 跳转列表信息页面
	 * @param: @return
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return new ModelAndView(CROPS_CYCLE_LIST_JSP);
	}
	private List<String> areaCodes = new ArrayList<String>();
	/**
	 * @Title: getCropsCycleList
	 * @Description: 农作物生长周期分页查询
	 * @param: @param id
	 * @param: @param request
	 * @param: @param page
	 * @param: @param pageSize
	 * @return: List<CropsGrowthCycle>
	 */
	@RequestMapping(value="/getCropsCyclelist", method=RequestMethod.POST)
	public @ResponseBody List<CropsGrowthCycle> getCropsCyclelist(String id,HttpServletRequest request, @RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="20") Integer pageSize){
		PageHelper.startPage(page, pageSize);
		//当前点击的区域
		//把当前的区域加入到列表中
		SysArea sysArea= sysAreaService.findAreaById(id);
		String areaCode = sysArea.getAreaCode();
		getAreaCode(id);
		areaCodes.add(areaCode);
		PageHelper.startPage(page, pageSize);
		List<CropsGrowthCycle> cropsCycleList = cropsGrowthCycleService.findCropsGrowthByAreaCodes(areaCodes);
		PageInfo<CropsGrowthCycle> pages = new PageInfo<CropsGrowthCycle>(cropsCycleList);
		areaCodes.clear();
		for(CropsGrowthCycle CropsGrowthCycle:cropsCycleList){
			if(CropsGrowthCycle!=null){
				SysArea sysAread =sysAreaService.findAreaBySysareaCode(CropsGrowthCycle.getSysareaCode());
				CropsGrowthCycle.setSysareaCode(sysAread.getAreaName());
				CropsTypeInfo cropsTypeInfo = cropsTypeInfoService.selectByPrimaryKey(CropsGrowthCycle.getComm2());
				if(cropsTypeInfo!=null){
					CropsGrowthCycle.setComm2(cropsTypeInfo.getCropsName());
				}
			}
			
		}
		request.getSession().setAttribute("pages", pages);
		return cropsCycleList;
	}
	
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
	 * @return: PageInfo<CropsGrowthCycle>
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/getPages")
	public @ResponseBody PageInfo<CropsGrowthCycle> getPages(HttpServletRequest request){
		PageInfo<CropsGrowthCycle> pages = (PageInfo<CropsGrowthCycle>) request.getSession().getAttribute("pages");
		return pages;
	}
	
	/**
	 * @Title: addPage
	 * @Description: 跳转农作物生长周期添加页面
	 * @param: @param request
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/addPage")
	public ModelAndView addPage(HttpServletRequest request,Model model,String areaId){
		SysArea sysArea= sysAreaService.findAreaById(areaId);
		model.addAttribute("areaCode", sysArea.getAreaCode());
		model.addAttribute("areaName", sysArea.getAreaName());
		String areaCode = sysArea.getAreaCode();
		List<CropsTypeInfo> cropsTypeInfoList = cropsTypeInfoService.findAreaCodeCropsTypeList(sysArea.getAreaCode());
		//土地类型
		List<SoilTypeInfo> soilTypeInfoList =soilTypeService.findAreaCropsSoilTypeInfoList(areaCode);
		model.addAttribute("cropsTypeInfoList", cropsTypeInfoList);
		model.addAttribute("soilTypeInfoList", soilTypeInfoList);
		return new ModelAndView(CROPS_CYCLE_ADD_JSP);
	}
	
	/**
	 * @Title: saveCropsCycleInfo
	 * @Description: 保存农作物生长周期信息
	 * @param: @param request
	 * @param: @param CropsGrowthCycle
	 * @return: void
	 */
	@RequestMapping(value="/saveCropsCycleInfo", method=RequestMethod.POST)
	@ResponseBody
	public int saveCropsCycleInfo(HttpServletRequest request, CropsGrowthCycle cropsGrowthCycle){
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd");
		if(cropsGrowthCycle != null){
			cropsGrowthCycle.setId(UUID.randomUUID().toString().replace("-", ""));
			// 将选中节点的ID设置为新增区域的父ID
			cropsGrowthCycle.setCgcCreateTime(new Date());
			cropsGrowthCycle.setCgcEditTime(new Date());
			
			//计算生育期天数
			Date stateDate = cropsGrowthCycle.getStateDate();
			Date endDate =cropsGrowthCycle.getEndDate();
			String stDate =time.format(stateDate);
			String edDate = time.format(endDate);
			
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = null;
			Date date2 = null;
			int a = 0;
			try {
				date1 = format.parse(stDate);
				date2 = format.parse(edDate);
				a = (int) ((date2.getTime()-date1.getTime()) / (1000*3600*24));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			cropsGrowthCycle.setComm1(String.valueOf(a));
			System.out.println("===========date1.getTime()============>"+date1.getTime());
			System.out.println("===========String.valueOf(dateCount)============>"+a);
			
			//下面是科学计算出来的某种旱作的生育周期内的净灌水定额
			//公式：M(旱作)=0.667*[ETc-Pe-Ge+H*(Ovs-Ovo)]
				//Etc--某种农作物的蒸腾蒸发量
				//Pe--某种农作物的生育周期内的有效降水量
				//Ge--某种农作物生育期内地下水利量mm
				//Ovo--某种农作物生育期开始时土壤体积含水率%；
				//Ovs--某种农作物生育期结束时土壤体积含水率%；
				//H--某种农作物的犁地深度
			
			BigDecimal Etc=cropsGrowthCycle.getEvapotranspiration(); 
			BigDecimal Pe =cropsGrowthCycle.getGrowthPeriodRainfall();
			BigDecimal Ge =cropsGrowthCycle.getGroundwater();
			BigDecimal Ovo =cropsGrowthCycle.getGrowthPeriodSoilStart();
			BigDecimal Ovs =cropsGrowthCycle.getGrowthPeriodSoilEnd();
			BigDecimal H=new BigDecimal(cropsGrowthCycle.getComm6());
			BigDecimal F667=new BigDecimal("0.667");
			//公式：M(旱作)=0.667*[ETc-Pe-Ge+H*(Ovs-Ovo)]
			BigDecimal Mh=F667.multiply(((Etc.subtract(Pe)).subtract(Ge)).add(H.multiply(Ovs.subtract(Ovo))));
			cropsGrowthCycle.setNetIrrigationScientific(Mh);
			
			
		}
		int result = cropsGrowthCycleService.insertSelective(cropsGrowthCycle);
		return result;
	}
	
	
	//单个删除
	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id){
		System.out.println("===========id===============>"+id);
		int state = cropsGrowthCycleService.deleteByPrimaryKey(id);
		return state+"";
	}
		
	/**
	 * @Title: deleteCropsCycleById
	 * @Description: 删除农作物生长周期(包括批量)
	 * @param: @param request
	 * @return: void
	 */
	@RequestMapping(value="/deleteCropsCycleById", method=RequestMethod.POST)
	@ResponseBody
	public int deleteCropsCycleById(HttpServletRequest request){
		int result = 0;
		String ids = request.getParameter("ids");
		if(!ids.equals("") && ids != null){
			result = cropsGrowthCycleService.deleteByPrimaryKey(ids);
		}
		return result;
	}
	
	/**
	 * @Title: editCropsCyclePage
	 * @Description: 跳转信息编辑页面
	 * @param: @param id
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/editCropsCyclePage", method=RequestMethod.GET)
	public ModelAndView editCropsCyclePage(String id){
		ModelAndView modelAndView = new ModelAndView(CROPS_CYCLE_EDIT_JSP);
		CropsGrowthCycle cropsGrowthCycle = null;
		if(!id.equals("") && id != null){
			cropsGrowthCycle = cropsGrowthCycleService.selectByPrimaryKey(id);
		}
		modelAndView.addObject("cropsGrowthCycle", cropsGrowthCycle);
		return modelAndView;
	}
	
	/**
	 * @Title: editSaveCropsCycleInfo
	 * @Description: 保存修改的信息
	 * @param: @param request
	 * @param: @param CropsGrowthCycle
	 * @return: int
	 */
	@RequestMapping(value="/editSaveCropsCycleInfo", method=RequestMethod.POST)
	@ResponseBody
	public int editSaveCropsCycleInfo(HttpServletRequest request, CropsGrowthCycle cropsGrowthCycle){
		if(cropsGrowthCycle != null){
			// 将选中节点的ID设置为新增区域的父ID
			cropsGrowthCycle.setCgcEditTime(new Date());;
		}
		int result = cropsGrowthCycleService.updateByPrimaryKeySelective(cropsGrowthCycle);
		return result;
	}
}