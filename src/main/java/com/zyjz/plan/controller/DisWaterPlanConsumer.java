package com.zyjz.plan.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.zyjz.plan.entity.DistWaterPlanConsumer;
import com.zyjz.plan.entity.DistWaterPlanExcel;
import com.zyjz.plan.entity.WaterTreeUser;
import com.zyjz.plan.service.DistWaterPlanConsumerService;
import com.zyjz.plan.service.WaterTreeUserService;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.utils.ExportExcel;
import com.zyjz.utils.controller.BaseUtils;
@Controller
@RequestMapping(value="/water_user")
public class DisWaterPlanConsumer {
	
	@Autowired
    SysAreaService sysAreaService;
	
	@Autowired
	DistWaterPlanConsumerService distWaterPlanConsumerService;
	
	@Autowired
	private WaterTreeUserService waterTreeUserService;
	
	private static final Logger logger = LoggerFactory.getLogger(DistWaterPlanConsumer.class);
	
	
	/** 视图解析页面路径 */
	protected static final String WATER_USER_JSP = "/plan/water_user/list";
	protected static final String ADD_WATERUSER_JSP = "/plan/water_user/add_water_user";
	protected static final String EDIT_WATERUSER_JSP = "/plan/water_user/edit_water_user";

	/**
	 * 列表页面
	 * @Title: list
	 * @Description: 
	 * @param: @param model
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request){
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		return WATER_USER_JSP;
	}
	
	
	private List<String> areaCodes = new ArrayList<String>();
	/**
	 * 分页
	 * @Title: page
	 * @Description: 
	 * @param: @param id
	 * @param: @param request
	 * @param: @param page
	 * @param: @param pageSize
	 * @param: @return
	 * @return: List<DistWaterPlanConsumer>
	 * @throws
	 * 
	 */
	 
	@RequestMapping(value="/page")
	public @ResponseBody List<DistWaterPlanConsumer> page(String id,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="10") Integer pageSize){
		List<DistWaterPlanConsumer> list = null;
		//当前点击的区域
		//把当前的区域加入到列表中
		if(id==""||id==null){
			WaterTreeUser wtu = waterTreeUserService.selectMin();
			getAreaCode(wtu.getId());
			areaCodes.add(wtu.getTreeCode());
			PageHelper.startPage(page, pageSize);
			list = distWaterPlanConsumerService.findDistWaterPlanConsumersByAreaCodes(areaCodes);
			//清空全局list
			areaCodes.clear();
			PageInfo<DistWaterPlanConsumer> pages = new PageInfo<DistWaterPlanConsumer>(list);
			request.getSession().setAttribute("distWaterPlanConsumerPages", pages);
		}else{
			WaterTreeUser sysArea= waterTreeUserService.selectByPrimaryKey(id);
			String areaCode = sysArea.getTreeCode();
			getAreaCode(id);
			areaCodes.add(areaCode);
			PageHelper.startPage(page, pageSize);
			list = distWaterPlanConsumerService.findDistWaterPlanConsumersByAreaCodes(areaCodes);
			//清空全局list
			areaCodes.clear();
			PageInfo<DistWaterPlanConsumer> pages = new PageInfo<DistWaterPlanConsumer>(list);
			request.getSession().setAttribute("distWaterPlanConsumerPages", pages);
		}
		return list;
	}
	//递归拿到所有的用水户
	public void getAreaCode(String id){
		//List<String> canalCodes = new ArrayList<String>();
		List<WaterTreeUser>  sysAreaList = waterTreeUserService.selectParentId(id);
		if(sysAreaList!=null&&sysAreaList.size()>0){
			for(int i=0;i<sysAreaList.size();i++){
				areaCodes.add(sysAreaList.get(i).getTreeCode());
				List<WaterTreeUser>  sysAreaList2 = waterTreeUserService.selectParentId(sysAreaList.get(i).getId());
				if(sysAreaList2!=null&&sysAreaList2.size()>0){
					getAreaCode(sysAreaList.get(i).getId());
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
	 * @return: PageInfo<DistWaterPlanConsumer>
	 * @throws
	 */
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<DistWaterPlanConsumer> pageNav(HttpServletRequest request){
		PageInfo<DistWaterPlanConsumer> pages = (PageInfo<DistWaterPlanConsumer>) request.getSession().getAttribute("distWaterPlanConsumerPages");
		return pages;
	}
	/**
	 * 跳转到添加页面
	 * @Title: addPage
	 * @Description: 
	 * @param: @param model
	 * @param: @param areaId
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add_page")
	public String addPage(Model model,String areaId){
		WaterTreeUser sysArea= waterTreeUserService.selectByPrimaryKey(areaId);
		model.addAttribute("areaCode", sysArea.getTreeCode());
		
		return ADD_WATERUSER_JSP;
	} 
	
	/**
	 * 添加
	 * @Title: add
	 * @Description: 
	 * @param: @param distWaterPlanConsumer
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add")
	public String add(DistWaterPlanConsumer distWaterPlanConsumer){
		distWaterPlanConsumer.setDwpcCreateTime(new Date());
		int a = distWaterPlanConsumerService.addDistWaterPlanConsumer(distWaterPlanConsumer);
		return "redirect:/water_user/list";
	} 
	
	
	/**
	 * 跳转到修改页面
	 * @Title: editPage
	 * @Description: 
	 * @param: @param id
	 * @param: @param model
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/edit_page")
	public String editPage(String sonid,Model model,HttpServletRequest request){
		System.out.println("+===============================>"+sonid);
		DistWaterPlanConsumer distWaterPlanConsumer=distWaterPlanConsumerService.selectByPrimaryKey(sonid);
		model.addAttribute("distWaterPlanConsumer", distWaterPlanConsumer);
		return EDIT_WATERUSER_JSP;
	}
	
	/**
	 * 修改
	 * @Title: editSaveCropsInfo
	 * @Description: 
	 * @param: @param request
	 * @param: @param distWaterPlanConsumer
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@ResponseBody
	public String editSaveCropsInfo(HttpServletRequest request, DistWaterPlanConsumer distWaterPlanConsumer){
		System.out.println("=================进来了吗================");
		
		if(distWaterPlanConsumer != null){
			distWaterPlanConsumer.setDwpcEditTime(new Date());
		}
		distWaterPlanConsumerService.updateByPrimaryKeySelective(distWaterPlanConsumer);
		return "redirect:/water_user/list";
	}
	
	//单个删除
	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id){
		int state = distWaterPlanConsumerService.deleteByPrimaryKey(id);
		
		return state+"";
	}
	
	//批量删除
	@RequestMapping(value="/deletes")
	public @ResponseBody String deletes(@RequestParam(value = "ids[]") String[] ids){
		int state=0;
		for(int i=0;i<ids.length;i++){
		 int a = distWaterPlanConsumerService.deleteByPrimaryKey(ids[i]);
		 state+=a;
		}
		return ""+state;
	}
	

		/**
		 * <p>Description: ajax请求获取Area</p>
		 * @author 
		 *	@data 2017年12月28日 下午2:19:47
		 */
		@RequestMapping(value="/ajax_findUser")
		public @ResponseBody Object ajaxFindAreaById(String id){
			System.out.println(id+"++++++++++++++++++++++++++");
			List<String> araeList = new ArrayList<>();
			WaterTreeUser sysArea = waterTreeUserService.selectByPrimaryKey(id);
			araeList.add(sysArea.getTreeCode());
			List<DistWaterPlanConsumer> distWaterPlanConsumerList =distWaterPlanConsumerService.findDistWaterPlanConsumersByAreaCodes(araeList);

			return distWaterPlanConsumerList;
		}
		
		/**
		 * @throws UnsupportedEncodingException 
		 * ajax获取用水户姓名
		 * @Title: getNameById
		 * @Description: 
		 * @param: @param id
		 * @param: @return
		 * @return: String
		 * @throws
		 */
		@RequestMapping(value="/getNameById")
		public @ResponseBody String getNameById(String id,HttpServletRequest  request,HttpServletResponse response) throws UnsupportedEncodingException{
			
			String a = request.getCharacterEncoding();
			System.out.println(a);
			
			DistWaterPlanConsumer sistWaterPlanConsumer=distWaterPlanConsumerService.selectByPrimaryKey(id);
			System.out.println("1111111111111111111111111"+sistWaterPlanConsumer.getName());
			//response.setCharacterEncoding("UTF-8");
			String b = response.getCharacterEncoding();
			System.out.println("222222222222222222222222222222"+b);
			return sistWaterPlanConsumer.getName();		
		}
		
		/*==================Excel导入==========================*/
		@RequestMapping("/ExcelImport")
		@ResponseBody
		public String ExcelImport(MultipartFile file){
			String message="";
			try{
				List<DistWaterPlanExcel> distList = ExportExcel.importExcel(file,1,1,DistWaterPlanExcel.class);
				for(int i=0;i<distList.size();i++){
					message = ""+i;
					WaterTreeUser wtu = waterTreeUserService.selectTreeName(distList.get(i).getComArea());
					DistWaterPlanConsumer dwpc = new DistWaterPlanConsumer();
					dwpc.setName(distList.get(i).getName());
					dwpc.setPhonenumber(distList.get(i).getPhonenumber());
					dwpc.setAccount(distList.get(i).getAccount());
					dwpc.setPassword(distList.get(i).getPassword());
					dwpc.setWaterRightArea(distList.get(i).getWaterRightArea());
					dwpc.setRealArea(distList.get(i).getRealArea());
					dwpc.setAddress(distList.get(i).getAddress());
					dwpc.setDwpcRemark(distList.get(i).getDwpcRemark());
					dwpc.setAreaCode(wtu.getTreeCode());
					add(dwpc);
				}
				logger.info("用水户数据导入成功！");
				message="success";
			}catch(Exception e){
				
				logger.error("用水户数据导入失败");
			}
			return message;
		}

		/*==================Excel下载==========================*/
		@RequestMapping("/downLoadExcel")
		@ResponseBody
		public JsonResult downLoadExcel(HttpServletResponse response){
			List<String> list = new ArrayList<>();
			ExportExcel.exportExcel(list,"用户管理Excel模板","用户管理",DistWaterPlanExcel.class,"用户管理Excel模板.xls",response);
			return new JsonResult();
		}
}
