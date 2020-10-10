package com.zyjz.sysmanage.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.sysmanage.entity.CalCanalMaterial;
import com.zyjz.sysmanage.entity.CalCanalType;
import com.zyjz.sysmanage.entity.CalCanalUsetype;
import com.zyjz.sysmanage.entity.SiteDeviceModel;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.sysmanage.service.BaseParamService;
import com.zyjz.utils.controller.BaseUtils;

/**
 * @ClassName: BaseParamController 
 * @Description: 系统管理-基础参数管理
 * @Author: zhaojx
 * @Date: 2017年12月7日 下午3:54:43
 */
@SuppressWarnings("unchecked")
@Controller
@RequestMapping(value="/base_param")
public class BaseParamController {
	@Autowired
	CalCanalInfoService calCanalInfoService;
	
	@Autowired
	BaseParamService baseParamService;
	
	/** 视图解析页面路径 */
	protected static final String CANAL_MATERIAL_JSP = "/sysmanage/base_param/canal_material";
	protected static final String CANAL_TYPE_JSP = "/sysmanage/base_param/canal_type";
	protected static final String CANAL_USETYPE_JSP = "/sysmanage/base_param/canal_usetype";
	protected static final String SITE_DEVICE_JSP = "/sysmanage/base_param/site_device_type";
	protected static final String ADD_CANAL_JSP = "/sysmanage/cal_canal_info/add_canal";
	protected static final String EDIT_CANAL_JSP = "/sysmanage/cal_canal_info/edit_canal";
	
	@RequestMapping(value="/canal_material")
	public String canalMaterial(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return CANAL_MATERIAL_JSP;
	}
	
	@RequestMapping(value="add_canal_material")
	public String addCanalMaterial(CalCanalMaterial calCanalMaterial){
		calCanalMaterial.setCcmCreateTime(new Date());
		int a = baseParamService.addCanalMaterial(calCanalMaterial);
		if(a==1){
			return "redirect:/base_param/canal_material?state=64";
		}
		return "redirect:/base_param/canal_material?state=64";
	}
	
	//衬砌材料分页
	@RequestMapping(value="/canal_material_page")
	public @ResponseBody List<CalCanalMaterial> canalMaterialPage(String id,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
		
		//当前点击的区域
		//把当前的区域加入到列表中
			PageHelper.startPage(page, pageSize);
			
			List<CalCanalMaterial> calCanalMaterialList = baseParamService.findAllCalCanalMaterial();
			
			PageInfo<CalCanalMaterial> pages = new PageInfo<CalCanalMaterial>(calCanalMaterialList);
			
			request.getSession().setAttribute("calCanalMaterialPages", pages);
			
		return calCanalMaterialList;
	}
	
	@RequestMapping(value="/canal_material_page_nav")
	public @ResponseBody PageInfo<CalCanalMaterial> canalMaterialPageNav(HttpServletRequest request){
		PageInfo<CalCanalMaterial> pages = (PageInfo<CalCanalMaterial>) request.getSession().getAttribute("calCanalMaterialPages");
		return pages;
	}
	
	//编辑回显
	@RequestMapping(value="/canal_material_edit_message")
	public @ResponseBody CalCanalMaterial canalMaterialEditMessage(String id){
		CalCanalMaterial calCanalMaterial = baseParamService.findCalCanalMaterialById(id);
		
		return calCanalMaterial;
	}
	
	//衬砌材料编辑
	@RequestMapping(value="/edit_canal_material")
	public String editCanalMaterial(CalCanalMaterial calCanalMaterial){
		
		calCanalMaterial.setCcmEditTime(new Date());
		int a = baseParamService.updateCanalMaterial(calCanalMaterial);
		if(a==1){
			return "redirect:/base_param/canal_material?state=64";
		}
		return "redirect:/base_param/canal_material?state=64";
	}
	
	//单个删除
	@RequestMapping(value="/delete_material_byid")
	public @ResponseBody Integer deleteMaterialById(String id){
		int a = baseParamService.deleteMaterialById(id);
		return a;
	}
	
	//批量删除
	@RequestMapping(value="/delete_materials")
	public @ResponseBody String  deleteMaterials(@RequestParam(value="ids[]") String[] ids){
		int state=0;
		for(int i=0;i<ids.length;i++){
		 int a = baseParamService.deleteMaterialById(ids[i]);
		 state+=a;
		}
		return state+"";
	}
	
	@RequestMapping(value="/canal_type")
	public String canalType(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return CANAL_TYPE_JSP;
	}
	
	//添加渠道类型
	@RequestMapping(value="/add_canal_type")
	public String addCanalType(CalCanalType calCanalType){
		calCanalType.setCctCreateTime(new Date());
		int a = baseParamService.addCanalType(calCanalType);
		if(a==1){
			return "redirect:/base_param/canal_type?state=61";
		}
		return "redirect:/base_param/canal_type?state=61";
	}
	
	//渠道类型分页
	@RequestMapping(value="/canal_type_page")
	public @ResponseBody List<CalCanalType> canalTypePage(String id,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
		
		//当前点击的区域
		//把当前的区域加入到列表中
			PageHelper.startPage(page, pageSize);
			
			List<CalCanalType> calCalCanalTypeList = baseParamService.findAllCalCanalType();
			
			PageInfo<CalCanalType> pages = new PageInfo<CalCanalType>(calCalCanalTypeList);
			
			request.getSession().setAttribute("calCalCanalTypePages", pages);
			
		return calCalCanalTypeList;
	}
		
	@RequestMapping(value="/canal_type_page_nav")
	public @ResponseBody PageInfo<CalCanalType> canalTypePageNav(HttpServletRequest request){
		PageInfo<CalCanalType> pages = (PageInfo<CalCanalType>) request.getSession().getAttribute("calCalCanalTypePages");
		return pages;
	}
		
	//编辑回显
	@RequestMapping(value="/canal_type_edit_message")
	public @ResponseBody CalCanalType canalTypeEditMessage(String id){
		CalCanalType calCanalType = baseParamService.findCalCanalTypeById(id);
		
		return calCanalType;
	}
		
	//衬砌材料编辑
	@RequestMapping(value="/edit_canal_type")
	public String editCanalType(CalCanalType calCanalType){
		
		calCanalType.setCctEditTime(new Date());
		int a = baseParamService.updateCanalType(calCanalType);
		if(a==1){
			return "redirect:/base_param/canal_type?state=61";
		}
		return "redirect:/base_param/canal_type?state=61";
	}
	//类型单个删除
	@RequestMapping(value="/delete_type_byid")
	public @ResponseBody Integer deleteTypeById(String id){
		int a = baseParamService.deleteTypeById(id);
		return a;
	}
	
	//类型批量删除
	@RequestMapping(value="/delete_types")
	public @ResponseBody String  deleteTypes(@RequestParam(value="ids[]") String[] ids){
		int state=0;
		for(int i=0;i<ids.length;i++){
		 int a = baseParamService.deleteTypeById(ids[i]);
		 state+=a;
		}
		return state+"";
	}
	
	
	
																																
	//渠道供水用途
	@RequestMapping(value="/canal_usetype")
	public String canalUseType(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return CANAL_USETYPE_JSP;
	}
	
	//添加渠道类型
		@RequestMapping(value="/add_canal_usetype")
		public String addCanalType(CalCanalUsetype calCanalUsetype){
			calCanalUsetype.setCcuCreateTime(new Date());
			int a = baseParamService.addCanalUsetype(calCanalUsetype);
			if(a==1){
				return "redirect:/base_param/canal_usetype?state=62";
			}
			return "redirect:/base_param/canal_usetype?state=62";
		}
		
		//渠道类型分页
		@RequestMapping(value="/canal_usetype_page")
		public @ResponseBody List<CalCanalUsetype> canalUseTypePage(String id,HttpServletRequest request,
				@RequestParam(required=true,defaultValue="1") Integer page,
	            @RequestParam(required=false,defaultValue="3") Integer pageSize){
			
			//当前点击的区域
			//把当前的区域加入到列表中
				PageHelper.startPage(page, pageSize);
				
				List<CalCanalUsetype> calCalCanalUseTypeList = baseParamService.findAllCalCanalUsetype();
				
				PageInfo<CalCanalUsetype> pages = new PageInfo<CalCanalUsetype>(calCalCanalUseTypeList);
				
				request.getSession().setAttribute("calCalCanalUseTypePages", pages);
				
			return calCalCanalUseTypeList;
		}
			
		@RequestMapping(value="/canal_usetype_page_nav")
		public @ResponseBody PageInfo<CalCanalUsetype> canalUseTypePageNav(HttpServletRequest request){
			PageInfo<CalCanalUsetype> pages = (PageInfo<CalCanalUsetype>) request.getSession().getAttribute("calCalCanalUseTypePages");
			return pages;
		}
			
		//编辑回显
		@RequestMapping(value="/canal_usetype_edit_message")
		public @ResponseBody CalCanalUsetype canalUseTypeEditMessage(String id){
			CalCanalUsetype calCanalUsetype = baseParamService.findCalCanalUsetypeById(id);
			
			return calCanalUsetype;
		}
			
		//衬砌材料编辑
		@RequestMapping(value="/edit_canal_usetype")
		public String editCanalType(CalCanalUsetype calCanalUsetype){
			
			calCanalUsetype.setCcuEditTime(new Date());
			int a = baseParamService.updateCanalUsetype(calCanalUsetype);
			if(a==1){
				return "redirect:/base_param/canal_usetype?state=62";
			}
			return "redirect:/base_param/canal_usetype?state=62";
		}
		//类型单个删除
		@RequestMapping(value="/delete_usetype_byid")
		public @ResponseBody Integer deleteUseTypeById(String id){
			int a = baseParamService.deleteUseTypeById(id);
			return a;
		}
		
		//类型批量删除
		@RequestMapping(value="/delete_usetypes")
		public @ResponseBody String  deleteUseTypes(@RequestParam(value="ids[]") String[] ids){
			int state=0;
			for(int i=0;i<ids.length;i++){
			 int a = baseParamService.deleteUseTypeById(ids[i]);
			 state+=a;
			}
			return state+"";
		}
		
	
		
		
		//站点设备类型
		@RequestMapping(value="/site_device_type")
		public String siteDeviceModel(Model model,HttpServletRequest request,int state){
			BaseUtils baseUtils = new BaseUtils();
			baseUtils.showMenu(model, request, state);
			return SITE_DEVICE_JSP;
		}
		
		//添加渠道类型
			@RequestMapping(value="/add_site_device")
			public String addSiteDevice(SiteDeviceModel siteDeviceModel){
				siteDeviceModel.setSdmCreateTime(new Date());
				int a = baseParamService.addSiteDeviceModel(siteDeviceModel);
				if(a==1){
					return "redirect:/base_param/site_device_type?state=63";
				}
				return "redirect:/base_param/site_device_type?state=63";
			}
			
			//渠道类型分页
			@RequestMapping(value="/site_device_page")
			public @ResponseBody List<SiteDeviceModel> siteDevicePage(String id,HttpServletRequest request,
					@RequestParam(required=true,defaultValue="1") Integer page,
		            @RequestParam(required=false,defaultValue="3") Integer pageSize){
				
				//当前点击的区域
				//把当前的区域加入到列表中
					PageHelper.startPage(page, pageSize);
					
					List<SiteDeviceModel> siteDeviceModelList = baseParamService.findAllSiteDeviceModel();
					
					PageInfo<SiteDeviceModel> pages = new PageInfo<SiteDeviceModel>(siteDeviceModelList);
					
					request.getSession().setAttribute("siteDeviceModelPages", pages);
					
				return siteDeviceModelList;
			}
				
			@RequestMapping(value="/site_device_page_nav")
			public @ResponseBody PageInfo<SiteDeviceModel> siteDevicePageNav(HttpServletRequest request){
				PageInfo<SiteDeviceModel> pages = (PageInfo<SiteDeviceModel>) request.getSession().getAttribute("siteDeviceModelPages");
				return pages;
			}
				
			//编辑回显
			@RequestMapping(value="/site_device_edit_message")
			public @ResponseBody SiteDeviceModel siteDeviceModelEditMessage(String id){
				SiteDeviceModel siteDeviceModel = baseParamService.findSiteDeviceModelById(id);
				
				return siteDeviceModel;
			}
				
			//编辑提交
			@RequestMapping(value="/edit_site_device")
			public String editSiteDevice(SiteDeviceModel siteDeviceModel){
				
				siteDeviceModel.setSdmEditTime(new Date());
				int a = baseParamService.updateSiteDeviceModel(siteDeviceModel);
				if(a==1){
					return "redirect:/base_param/site_device_type?state=63";
				}
				return "redirect:/base_param/site_device_type?state=63";
			}
			
			//类型单个删除
			@RequestMapping(value="/delete_site_device_byid")
			public @ResponseBody Integer deleteSiteDevicedById(String id){
				int a = baseParamService.deleteSiteDeviceModelById(id);
				return a;
			}
			
			//类型批量删除
			@RequestMapping(value="/delete_site_devices")
			public @ResponseBody String  deleteSiteDevices(@RequestParam(value="ids[]") String[] ids){
				int state=0;
				for(int i=0;i<ids.length;i++){
				 int a = baseParamService.deleteSiteDeviceModelById(ids[i]);
				 state+=a;
				}
				return state+"";
			}
		
}
