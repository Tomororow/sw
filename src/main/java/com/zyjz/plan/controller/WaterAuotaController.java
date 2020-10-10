package com.zyjz.plan.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.plan.entity.CropsGrowthCycle;
import com.zyjz.plan.entity.CropsTypeInfo;
import com.zyjz.plan.entity.SoilTypeInfo;
import com.zyjz.plan.entity.WaterAuota;
import com.zyjz.plan.service.CropsGrowthCycleService;
import com.zyjz.plan.service.CropsTypeInfoService;
import com.zyjz.plan.service.SoilsTypeInfoService;
import com.zyjz.plan.service.WaterAuotaService;
import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.utils.controller.BaseUtils;

@Controller
@RequestMapping("/waterAuota")
public class WaterAuotaController {
	
	protected static final String SITE_WATERAUOTA_JSP = "/plan/water_auota/list";
	protected static final String ADD_WATERAUOTA_JSP = "/plan/water_auota/add_water_auota";
	protected static final String EDIT_WATERAUOTA_JSP = "/plan/water_auota/edit_water_auota";

	@Autowired
	private WaterAuotaService waterAuotaService;
	@Autowired
	SoilsTypeInfoService soilTypeService;
	@Autowired
	CropsTypeInfoService cropsTypeService;
	
	@Autowired
    SysAreaService sysAreaService;
	
	@Autowired
	private CropsGrowthCycleService cropsGrowthCycleService;
	
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return SITE_WATERAUOTA_JSP;
	}
	private List<String> areaCodes = new ArrayList<String>();
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
	public @ResponseBody List<WaterAuota> page(String id,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
			PageHelper.startPage(page, pageSize);
			
			//List<WaterAuota> list = waterAuotaService.findAllWaterAuota();
			//当前点击的区域
			//把当前的区域加入到列表中
			SysArea sysArea= sysAreaService.findAreaById(id);
			String areaCode = sysArea.getAreaCode();
			getAreaCode(id);
			areaCodes.add(areaCode);
			PageHelper.startPage(page, pageSize);
			
			List<WaterAuota> list = waterAuotaService.findWaterAuotaByAreaCodes(areaCodes);
			//清空全局list
			areaCodes.clear();
			for(WaterAuota waterAuota:list){
				//土地类型
				SoilTypeInfo soilTypeInfo=soilTypeService.getSoilName(waterAuota.getSoilTypeCode());
				//农作物
				CropsTypeInfo cropsTypeInfo	=cropsTypeService.selectByPrimaryKey(waterAuota.getCropsTypeCode());
				SysArea sysAread = sysAreaService.findAreaBySysareaCode(waterAuota.getAreaCode());
				waterAuota.setSoilTypeCode(soilTypeInfo.getSoilName());
				waterAuota.setCropsTypeCode(cropsTypeInfo.getCropsName());
				waterAuota.setAreaCode(sysAread.getAreaName());
				//生长周期
				/*CropsGrowthCycle cropsGrowthCycle = cropsGrowthCycleService.getCycleNameList(waterAuota.getCropsGrowthCycle());
				waterAuota.setCropsGrowthCycle(cropsGrowthCycle.getCycleName());*/
			}
			
			
			PageInfo<WaterAuota> pages = new PageInfo<WaterAuota>(list);
			request.getSession().setAttribute("pages", pages);
		
		return list;
		
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
	 * 分页导航
	 * @Title: pageNav
	 * @Description: 
	 * @param: @param request
	 * @param: @return
	 * @return: PageInfo<SiteReservoirInfo>
	 * @throws
	 */
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<WaterAuota> pageNav(HttpServletRequest request){
		PageInfo<WaterAuota> pages = (PageInfo<WaterAuota>) request.getSession().getAttribute("pages");
		return pages;
	}
	
	/**
	 * 跳转到添加页面
	 * @Title: addWaterAuotaPage
	 * @Description: 
	 * @param: @param model
	 * @param: @param id
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add_water_auota_page")
	public String addWaterAuotaPage(Model model,String areaId){
		//System.out.println("============areaId================>"+areaId);
		
		SysArea sysArea= sysAreaService.findAreaById(areaId);
		String areaCode = sysArea.getAreaCode();
		//农作类型
		List<CropsTypeInfo> cropsTypeInfoList =cropsTypeService.findAreaCodeCropsTypeList(areaCode);
		List<CropsGrowthCycle> cropsGrowthCycleList = null;
		//土地类型
		List<SoilTypeInfo> soilTypeInfoList =soilTypeService.findAreaCropsSoilTypeInfoList(areaCode);
		
		for(CropsTypeInfo cropsTypeInfo:cropsTypeInfoList){
			//农作物生长周期
			cropsGrowthCycleList=cropsGrowthCycleService.findCropsTypeIdGrowthCycleList(cropsTypeInfo.getId());
		}
		model.addAttribute("cropsTypeInfoList", cropsTypeInfoList);
		model.addAttribute("soilTypeInfoList", soilTypeInfoList);
		model.addAttribute("cropsGrowthCycleList", cropsGrowthCycleList);
		model.addAttribute("areaCode", sysArea.getAreaCode());
		model.addAttribute("areaName", sysArea.getAreaName());
		
		return ADD_WATERAUOTA_JSP;
	}
	/**
	 * ajax取植物的生长周期
	 * @Title: findCropsTypeIdGrowthCycleList
	 * @Description: 
	 * @param: @param cropsTypeId
	 * @param: @param request
	 * @param: @return
	 * @return: List<CropsGrowthCycle>
	 * @throws
	 */
	@RequestMapping("/growthCycleList")
	@ResponseBody
	private  List<CropsGrowthCycle>  findCropsTypeIdGrowthCycleList(String cropsTypeId,HttpServletRequest request){
		List<CropsGrowthCycle> cropsGrowthCycleList =cropsGrowthCycleService.findCropsTypeIdGrowthCycleList(cropsTypeId);
		request.setAttribute("cropsGrowthCycleList", cropsGrowthCycleList);
		return cropsGrowthCycleList;
	}
	
	/**
	 * ajax获取日耗水量
	 * @Title: findCropsTypeIdGrowthCycleList
	 * @Description: 
	 * @param: @param cropsTypeId
	 * @param: @param request
	 * @param: @return
	 * @return: List<CropsGrowthCycle>
	 * @throws
	 */
	@RequestMapping("/growthCycleConsumedWater")
	@ResponseBody
	private  List<CropsGrowthCycle>  growthCycleConsumedWater(@RequestParam(value = "regis[]")String[] regis,HttpServletRequest request){
		
		List<CropsGrowthCycle>  cropsGrowthCyclelist=new ArrayList<>();
		CropsGrowthCycle cropsGrowthCycle=null;
		for(int i=0;i<regis.length;i++){
			//System.out.println("================兄弟进来了吗=============="+regis[i]);
			cropsGrowthCycle =cropsGrowthCycleService.selectByPrimaryKey(regis[i]);
			cropsGrowthCyclelist.add(cropsGrowthCycle);
		}
		return cropsGrowthCyclelist;
	}
	
	
	
	
	/**
	 * 添加
	 * @Title: add
	 * @Description: 
	 * @param: @param waterAuota
	 * @param: @return
	 * @param: @throws Exception
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add")
	public String add(WaterAuota waterAuota,HttpServletRequest request) throws Exception{
		String[] regis = request.getParameterValues("items");
		List  list=new ArrayList<>();
		if(regis!=null){
			for(int i=0;i<regis.length;i++){
				
				list.add(regis[i]);
				System.out.println("=======regis[i]========>"+list.toString());
				waterAuota.setCropsGrowthCycle(list.toString());
			}
		}
		waterAuota.setCreateTime(new Date());
		waterAuotaService.insertSelective(waterAuota);
		return "redirect:/waterAuota/list?state=39";
	}
	
	/**
	 * 跳转到修改页面
	 * @Title: editWaterAuotaPage
	 * @Description: 
	 * @param: @param model
	 * @param: @param id
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/edit_water_auota_page")
	public String editWaterAuotaPage(Model model,String id){
		WaterAuota waterAuota = waterAuotaService.selectByPrimaryKey(id);
		System.out.println("==================>"+waterAuota.getRemark());
		List<CropsTypeInfo> cropsTypeInfoList =cropsTypeService.getCropsList();
		List<SoilTypeInfo> soilTypeInfoList =soilTypeService.getSoilsList();
		List<CropsGrowthCycle> cropsGrowthCycleList=cropsGrowthCycleService.getCropsCycleList();
		model.addAttribute("cropsTypeInfoList", cropsTypeInfoList);
		model.addAttribute("soilTypeInfoList", soilTypeInfoList);
		model.addAttribute("cropsGrowthCycleList", cropsGrowthCycleList);
		model.addAttribute("waterAuota", waterAuota);
		return EDIT_WATERAUOTA_JSP;
	}
	
	
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@ResponseBody
	public String editWaterAuota(HttpServletRequest request,WaterAuota waterAuota){
		System.out.println("=================进来了吗================");
		waterAuotaService.updateByPrimaryKeySelective(waterAuota);
		return "redirect:/waterAuota/list?state=39";
	}
	
	
	//单个删除
		@RequestMapping(value="/delete")
		public @ResponseBody String delete(String id){
			int state = waterAuotaService.deleteByPrimaryKey(id);
			
			return state+"";
		}
		
		//批量删除
		@RequestMapping(value="/deletes")
		public @ResponseBody String deletes(@RequestParam(value = "ids[]") String[] ids){
			int state=0;
			for(int i=0;i<ids.length;i++){
			 int a = waterAuotaService.deleteByPrimaryKey(ids[i]);
			 state+=a;
			}
			return ""+state;
		}
	
	
}
