package com.zyjz.plan.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.zyjz.sysmanage.controller.ReservoirManageController;
import com.zyjz.sysmanage.entity.SiteMiddleCanal;
import com.zyjz.sysmanage.service.SiteMiddleCanalService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.plan.entity.ConsumerSoil;
import com.zyjz.plan.entity.DistWaterPlanConsumer;
import com.zyjz.plan.entity.SoilTypeInfo;
import com.zyjz.plan.service.ConsumerSoilService;
import com.zyjz.plan.service.DistWaterPlanConsumerService;
import com.zyjz.plan.service.SoilsTypeInfoService;
import com.zyjz.sysmanage.entity.CalCanalInfo;
import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.user.service.PermissionService;
import com.zyjz.utils.controller.BaseUtils;
/**
 * 土地信息管理
 * @ClassName: ConsumerSoilController
 * @Description: 
 * @Author: zhaojx
 * @Date: 2018年3月28日 下午3:53:59
 */
@Controller
@RequestMapping(value="/consumer_soil")
public class ConsumerSoilController {
	
	
	@Autowired
	CalCanalInfoService calCanalInfoService;
	
	@Autowired
	ConsumerSoilService consumerSoilService;
	
	@Autowired
	SoilsTypeInfoService soilTypeService;
	
	@Autowired
	PermissionService permissionService;
	
	@Autowired
	SysAreaService sysAreaService;
	
	@Autowired
	DistWaterPlanConsumerService distWaterPlanConsumerService;

	@Autowired
	SiteMiddleCanalService siteMiddleCanalService;

	private static final Logger logger = LoggerFactory.getLogger(ReservoirManageController.class);

	/** 视图解析页面路径 */
	protected static final String CONSUMER_SOIL_JSP = "/plan/consumer_soil/list";
	protected static final String ADD_SOIL_JSP = "/plan/consumer_soil/add_soil";
	protected static final String EDIT_SOIL_JSP = "/plan/consumer_soil/edit_soil";
	
	@RequestMapping(value="/list")
	
	public String list(Model model,HttpServletRequest request){
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		return CONSUMER_SOIL_JSP;
	}
	
	private List<String> canalCodes = new ArrayList<String>();
	/**
	 * 列表页
	 * @Title: page
	 * @Description: 
	 * @param: @param canalId
	 * @param: @param request
	 * @param: @param page
	 * @param: @param pageSize
	 * @param: @return
	 * @return: List<ConsumerSoil>
	 * @throws
	 */
	@RequestMapping(value="/page")
	public @ResponseBody List<ConsumerSoil> page(String canalId,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
		//当前点击的区域
		//把当前的区域加入到列表中
		
//			CalCanalInfo calCanalInfo= calCanalInfoService.findCanalById(canalId);
//			String canalCode = calCanalInfo.getCanalCode();
//			String canalName =calCanalInfo.getCanalName();
//			request.setAttribute("canalName", canalName);
//			getCanalCode(canalId);
//			canalCodes.add(canalCode);
			PageHelper.startPage(page, pageSize);
			
				List<ConsumerSoil> list = consumerSoilService.findConsumerSoilsByCanalCodesJoin(canalId);
//			for(ConsumerSoil consumerSoil:list){
//				if(consumerSoil!=null){
//					String consumerId= consumerSoil.getConsumerId();
//					System.out.println("==================consumerId=============================>"+consumerId);
//					DistWaterPlanConsumer sistWaterPlanConsumer=distWaterPlanConsumerService.selectByPrimaryKey(consumerId);
//					if(sistWaterPlanConsumer!=null){
//						consumerSoil.setConsumerId(sistWaterPlanConsumer.getName());
//					}
//					
//					SoilTypeInfo soilTypeInfo=soilTypeService.getSoilName(consumerSoil.getSoilTypeCode());
//					if(soilTypeInfo!=null){
//						consumerSoil.setSoilTypeCode(soilTypeInfo.getSoilName());
//					}
//					
//					CalCanalInfo calCanalInfoed =calCanalInfoService.findCanalByCode(consumerSoil.getCanalCode());
//					if(calCanalInfoed!=null){
//						consumerSoil.setCanalCode(calCanalInfoed.getCanalName());
//					}
//				}
//				
//			}
			
			//清空全局list
			canalCodes.clear();
			PageInfo<ConsumerSoil> pages = new PageInfo<ConsumerSoil>(list);
			request.getSession().setAttribute("consumerSoilPages", pages);
			
		return list;
	}
	//递归拿到所有
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
	 * 分页
	 * @Title: pageNav
	 * @Description: 
	 * @param: @param request
	 * @param: @return
	 * @return: PageInfo<ConsumerSoil>
	 * @throws
	 */
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<ConsumerSoil> pageNav(HttpServletRequest request){
		PageInfo<ConsumerSoil> pages = (PageInfo<ConsumerSoil>) request.getSession().getAttribute("consumerSoilPages");
		return pages;
	}
	
	/**
	 * 跳转到添加页面
	 * @Title: addPage
	 * @Description: 
	 * @param: @param model
	 * @param: @param canalId
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add_page")
	public String addPage(Model model,String canalId){
		CalCanalInfo calCanalInfo= calCanalInfoService.findCanalByCode(canalId);
		model.addAttribute("canalCode", calCanalInfo.getCanalCode());
		model.addAttribute("canalName", calCanalInfo.getCanalName());
		List<SoilTypeInfo> soilTypeInfoList =soilTypeService.getSoilsList();
		model.addAttribute("soilTypeInfoList", soilTypeInfoList);
		
		List<SysArea> sysAreaList = sysAreaService.findAreaByLevel(0);
		model.addAttribute("sysAreaList", sysAreaList);
		return ADD_SOIL_JSP;
	} 
	
	/**
	 * 添加
	 * @Title: add
	 * @Description: 
	 * @param: @param consumerSoil
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add")
	public String add(ConsumerSoil consumerSoil, HttpServletRequest request){
		consumerSoil.setCreateTime(new Date());
		consumerSoil.setComm1(UUID.randomUUID().toString().replaceAll("-",""));
		int a = consumerSoilService.addConsumerSoil(consumerSoil);

		//siteMiddleCanal中间表插入或更新
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.updateSiteMiddle("calCanal",consumerSoil.getCanalCode(),
				"consumer_id",consumerSoil.getComm1(),request);

		return "redirect:/consumer_soil/list";
	} 
	
	/**
	 * 跳转到添加页面
	 * @Title: editPage
	 * @Description: 
	 * @param: @param id
	 * @param: @param model
	 * @param: @param request
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/edit_page")
	public String editPage(String id,Model model,HttpServletRequest request){
		//consumerSoilService
		ConsumerSoil consumerSoil =consumerSoilService.selectByPrimaryKey(id);
		System.out.println("*********************************************>"+consumerSoil.getCanalCode());
		CalCanalInfo calCanalInfo= calCanalInfoService.findCanalByCode(consumerSoil.getCanalCode());
		model.addAttribute("canalCode", calCanalInfo.getCanalCode());
		model.addAttribute("canalName", calCanalInfo.getCanalName());
		List<SoilTypeInfo> soilTypeInfoList =soilTypeService.getSoilsList();
		model.addAttribute("soilTypeInfoList", soilTypeInfoList);
		model.addAttribute("consumerSoil", consumerSoil);
		List<SysArea> sysAreaList = sysAreaService.findAreaByLevel(0);
		model.addAttribute("sysAreaList", sysAreaList);
		
		//------------------------------------
		//String canalCode = consumerSoil.getCanalCode();
		DistWaterPlanConsumer sistWaterPlanConsumer=distWaterPlanConsumerService.selectByPrimaryKey(consumerSoil.getConsumerId());
	
		SysArea sysArea	= sysAreaService.findBySysareaCode(sistWaterPlanConsumer.getAreaCode());
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
					//siteReservoirInfo.setSyswaterareaCode("");
					sysAreaNames="无";
					break;
				}
			}
		
		}
		
		List<DistWaterPlanConsumer> distWaterPlanConsumerList=distWaterPlanConsumerService.getDistWaterPlanConsumersList();
		model.addAttribute("sysAreaNames", sysAreaNames);
		model.addAttribute("distWaterPlanConsumerList", distWaterPlanConsumerList);
		return EDIT_SOIL_JSP;
	}
	
	/**
	 * 修改
	 * @Title: editSaveCropsInfo
	 * @Description: 
	 * @param: @param request
	 * @param: @param consumerSoil
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@ResponseBody
	public String editSaveCropsInfo(HttpServletRequest request,ConsumerSoil consumerSoil){
		//站点修改前中间表数据修改
		int i = updateSiteMiddleCanal(consumerSoil.getId());

		System.out.println("=================进来了吗================");
		
		if(consumerSoil != null){
			consumerSoil.setUpdateTime(new Date());
		}
		consumerSoilService.updateByPrimaryKeySelective(consumerSoil);

		//siteMiddleCanal中间表插入或更新
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.updateSiteMiddle("calCanal",consumerSoil.getCanalCode(),
				"consumer_id",consumerSoil.getComm1(),request);

		return "redirect:/water_user/list";
	}
	
	//单个删除
	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id){
		//数据删除前修改中间表数据修改
		int i = updateSiteMiddleCanal(id);

		int state = consumerSoilService.deleteByPrimaryKey(id);

		return state+"";
	}
	
	//批量删除
	@RequestMapping(value="/deletes")
	public @ResponseBody String deletes(@RequestParam(value = "ids[]") String[] ids){
		int state=0;
		for(int i=0;i<ids.length;i++){
		 int a = consumerSoilService.deleteByPrimaryKey(ids[i]);
		 state+=a;
		}
		return ""+state;
	}

	/**
	 * 更新中间表该字段为""
	 * @param id
	 * @return
	 */
	private int updateSiteMiddleCanal(String id){
		int state = 0;
		ConsumerSoil consumerSoil = consumerSoilService.selectByPrimaryKey(id);
		if(consumerSoil != null){
			String code = "'"+consumerSoil.getComm1()+"'";
			List<SiteMiddleCanal> siteMiddleCanalList = siteMiddleCanalService.selectMiddleCanalInfoByCode(code, "consumer_id");
			if(siteMiddleCanalList.size()>0){
				for (SiteMiddleCanal canal : siteMiddleCanalList) {
					canal.setConsumerId("");
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
