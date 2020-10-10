package com.zyjz.watersupply.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.sysmanage.controller.FormListObject;
import com.zyjz.utils.controller.BaseUtils;
import com.zyjz.watersupply.entity.SynEquipment;
import com.zyjz.watersupply.service.EquipmentService;

/**
 * 水厂设备表
 * @ClassName: EquipmentController
 * @Description: 
 * @Author: 
 * @Date: 2018年5月14日 上午11:22:00
 */
@Controller
@RequestMapping("/equipment")
public class EquipmentController {
	
	//设备service
	@Autowired
	private EquipmentService equipmentService;
	
	//注入水池service
	
	//注入泵张service
	
	//注入管网service
	
	
	/** 视图解析页面路径 */
	private static final String LIST_JSP = "/watersupply/equipment/list";
	private static final String ADD_JSP = "/watersupply/equipment/add_equipment";
	
	@RequestMapping("/pageList")
	public String pageList(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		
		return LIST_JSP;
	}
	
	
	/*private List<String> canalCodes = new ArrayList<String>();
	@RequestMapping(value="/page")
	public @ResponseBody List<SynEquipment> siteWaterPage(String id,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
		    System.out.println("id:"+id);
			CalCanalInfo calCanalInfo= calCanalInfoService.findCanalById(id);
			String canalCode = calCanalInfo.getCanalCode();
			getCanalCode(id);
			canalCodes.add(canalCode);
			PageHelper.startPage(page, pageSize);
			List<SynEquipment> list = siteWaterService.findSiteWaterByCanalCodes(canalCodes);
			canalCodes.clear();
			
			PageInfo<SynEquipment> pages = new PageInfo<SynEquipment>(list);
			
			request.getSession().setAttribute("synEquipmentPages", pages);
	        
		return list;
	}
	
	
	//递归拿到所有的水位站
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
		}*/
	
	/**
	 * 分页导航条
	 * <p>Description: </p>
	 * @author rww
	 *	@data 2017年12月27日 下午6:00:31
	 */
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<SynEquipment> siteWaterPageNav(HttpServletRequest request){
		PageInfo<SynEquipment> pages = (PageInfo<SynEquipment>) request.getSession().getAttribute("synEquipmentPages");
		return pages;
	}
	
	/**
	 * 跳转到添加设备页面
	 * @Title: addPage
	 * @Description: 
	 * @param: @param id
	 * @param: @param model
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add_page")
	public String addPage(String id,Model model){
		System.out.println("=============================="+id);
		return ADD_JSP;
	}
	
	//天加水位站
	@RequestMapping(value="/add")
	public String add(SynEquipment synEquipment,FormListObject list,Model model,@RequestParam MultipartFile[] file) throws IllegalStateException, IOException{
		System.out.println(file.length);
		//SynEquipment synEquipment = list.getSynEquipment();
		if(file!=null&&file.length>0){
			for(int i=0;i<file.length;i++){
				System.out.println("rww"+i);
				//设置图片名称不能重复UUID
				String picName = UUID.randomUUID().toString();
				//获取文件名称
				String oriName = file[i].getOriginalFilename();
				if(oriName!=null&&!oriName.equals("")){
				//获取图片后缀
					String extName = oriName.substring(oriName.lastIndexOf("."));
					//开始上传
					file[i].transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
					//将名称存入数据库
					
					if(i==0){
						synEquipment.setEquipmentComm1(picName + extName);
					}else if(i==1){
						synEquipment.setEquipmentComm1(picName + extName);
					}
				}
			}
		}
		
		
		synEquipment.setEquipmentCreationTime(new Date());
		
		int result = equipmentService.insertSelective(synEquipment);
		
		/*if(result==1){
			List<CanalFlowHight> canalFlowHightList = list.getCanalFlowHightList(); 
			if(canalFlowHightList.size()>0&&canalFlowHightList!=null){
				CanalFlowHight canalFlowHight = new CanalFlowHight();
				for(int i=0;i<canalFlowHightList.size();i++){
					canalFlowHight=canalFlowHightList.get(i);
					canalFlowHight.setCreateTime(new Date());
					canalFlowHight.setWaterSiteId(synEquipment.getId());
					canalFlowHightService.addCanalFlowHight(canalFlowHight);
				}
			}
		}*/
		return "redirect:/equipment/list";
	}
	
/*	@RequestMapping(value="/edit_page")
	public String editPage(String id,Model model){
		SynEquipment synEquipment = siteWaterService.findSynEquipmentById(id);
		model.addAttribute("synEquipment", synEquipment);
		List<SiteDeviceModel> siteDeviceModelList = baseParamService.findAllSiteDeviceModel();
		
		model.addAttribute("siteDeviceModelList", siteDeviceModelList);
		
		return EDIT_SITE_JSP;
	}
	
	
	//水位站编辑保存=====
	@RequestMapping(value="/edit")
	public String edit(SynEquipment synEquipment,@RequestParam MultipartFile[] file) throws Exception{
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
						synEquipment.setSwiPhotoBefore(picName + extName);
					}else if(i==1){
						synEquipment.setSwiPhotoAfter(picName + extName);
					}
				}
			}
		}
		synEquipment.setSwiEditTime(new Date());	
		siteWaterService.updateSynEquipment(synEquipment);

		return "redirect:/site_water_manage/list";
	}
	
	//水位站单个删除
	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id){
		int state = siteWaterService.delete(id);
		
		return state+"";
	}
	
	//水位站物批量删除
	@RequestMapping(value="/deletes")
	public @ResponseBody String deletes(@RequestParam(value = "ids[]") String[] ids){
		int state=0;
		for(int i=0;i<ids.length;i++){
		 int a = siteWaterService.delete(ids[i]);
		 state+=a;
		}
		return ""+state;
	}*/
	
}
