package com.zyjz.sysmanage.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.zyjz.sitemanage.entity.MoistureSurveySite;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sysmanage.entity.*;
import com.zyjz.user.entity.SysUser;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.sysmanage.service.SysWaterAreaService;
import com.zyjz.utils.CustomBigDecimalEditor;
import com.zyjz.utils.controller.BaseUtils;

@Controller
@RequestMapping(value="/cal_canal_info")
public class CalCanalInfoController {
	
	@Autowired
	CalCanalInfoService calCanalInfoService;
	@Autowired
	SysWaterAreaService sysWaterAreaService;
	
	@Autowired
	SysAreaService sysAreaService;
	
	/** 视图解析页面路径 */
	protected static final String CALCANAL_INFO_JSP =  "/sysmanage/cal_canal_info/list";
	protected static final String ADD_CANAL_JSP =      "/sysmanage/cal_canal_info/add_canal";
	
	protected static final String ADD_CANAL_PRESERVOIR =  "/sysmanage/cal_canal_info/add_canal_pReservoir";
	protected static final String ADD_CANAL_PWATERAREA =  "/sysmanage/cal_canal_info/add_canal_pWaterArea";
	
	protected static final String EDIT_CANAL_JSP =     "/sysmanage/cal_canal_info/edit_canal";
	protected static final String ADD_CANAL_PHOTO =    "/sysmanage/cal_canal_info/add_canal_photo";
	protected static final String ADD_CANAL_BUILDING = "/sysmanage/cal_canal_info/add_canal_building";
	protected static final String EDIT_CANAL_BUILDING = "/sysmanage/cal_canal_info/edit_canal_building";
	protected static final String ADD_CANAL_BUILDING_PHOTO = "/sysmanage/cal_canal_info/add_canal_building_photo";
	protected static final String ADD_CANAL_SLUICE = "/sysmanage/cal_canal_info/add_canal_sluice";
	protected static final String EDIT_CANAL_SLUICE = "/sysmanage/cal_canal_info/edit_canal_sluice";

	private static final Logger logger = LoggerFactory.getLogger(CalCanalInfoController.class);

	/**
	 * <p>Description: 自定义绑定方法解决BigDecimal问题</p>
	 * @author rww
	 *	@data 2018年1月2日 上午11:53:40
	 */
	protected void initBinder(HttpServletRequest request,  
        ServletRequestDataBinder binder) throws Exception {  
		CustomBigDecimalEditor bigDecimalEditor = new CustomBigDecimalEditor();  
	    binder.registerCustomEditor(BigDecimal.class, bigDecimalEditor); 
	}  
	
	
	/**
	 * <p>Description: 渠道list</p>
	 * @author rww
	 *	@data 2017年12月22日 下午4:28:19
	 */
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request){
		
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		return CALCANAL_INFO_JSP;
	}

	/**
	 * 查询渠道的树菜单
	 * @return
	 */
	@RequestMapping("/tree_canal")
	@ResponseBody
	public List<CalCanalInfo> treeCanalInfo(HttpServletRequest request){
		List<CalCanalInfo> perList = new ArrayList<>();
		try {
			HttpSession session = request.getSession();
			SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
			if(sysUser!=null){
				if(StringUtils.isNotBlank(sysUser.getCanalCode())){
					perList = calCanalInfoService.findCanalCode(sysUser.getCanalCode());//先查询当前用户的渠道Code
					List<CalCanalInfo> list = calCanalInfoService.findAllCanal();//查询渠道表的所有节点数据
					if(perList.size()>0){
						for(CalCanalInfo cal:perList){
							cal.setChildren(resource(cal.getId(),list));
						}
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return perList;
	}

	public List<CalCanalInfo> resource(String id,List<CalCanalInfo> list){
		List<CalCanalInfo> menuList = new ArrayList<>();
		if(list.size()>0){//一级遍历
			for(CalCanalInfo li:list){
				if(StringUtils.isNotBlank(li.getCanalParentId())){
					if(id.equals(li.getCanalParentId())){
						menuList.add(li);
					}
				}
			}
		}
		if(menuList.size()>0){//循环遍历（扫出所有的子目录）
			for(CalCanalInfo sp:menuList){
				if(StringUtils.isNotBlank(sp.getId())){
					sp.setChildren(resource(sp.getId(),list));
				}
			}
		}
		return menuList;
	}
//渠道信息查询
	@RequestMapping("/channelquery")
    @ResponseBody
    public List<CalCanalInfo> QueryCalCanalInfo(String id){
		List<String> idList = Arrays.asList(id);
		ArrayList<CalCanalInfo> channellist = new ArrayList<>();
		//查询自己本身
		CalCanalInfo canalById = calCanalInfoService.findCanalById(id);
		channellist.add(canalById);
		//查询该id下所有的子集
		channellist.addAll(getCalcaninfo(idList));

		return channellist;
	}


	//渠道照片信息查询
    @RequestMapping("/photoquery")
    @ResponseBody
    public List<CalCanalInfo> QueryPhotoInfo(String id){
        List<String> idList = Arrays.asList(id);
        ArrayList<CalCanalInfo> channellist = new ArrayList<>();
        //查询自己本身
        CalCanalInfo canalById = calCanalInfoService.findCanalById(id);
        channellist.add(canalById);
        //查询该id下所有的子集
        channellist.addAll(getCalcaninfo(idList));
		//传入所有的渠道信息
		List<CalCanalInfo> calphotolist = calCanalInfoService.getphotoList(channellist);
		if(calphotolist.size()>0){
			return calphotolist;
		}
		return new ArrayList<>();
    }
	//渠道闸门信息查询
    @RequestMapping("/sluicequery")
    @ResponseBody
    public List<CalCanalInfo> QuerySluiceInfo(String id){
        List<String> idList = Arrays.asList(id);
        List<CalCanalInfo> channellist = new ArrayList<>();
        //查询自己本身
		CalCanalInfo canalById = calCanalInfoService.findCanalById(id);
		channellist.add(canalById);
        //查询该id下所有的子集
        channellist.addAll(getCalcaninfo(idList));
        //传入所有的渠道信息
		List<CalCanalInfo> calslsicelist = calCanalInfoService.getsluiceList(channellist);
		if(calslsicelist != null){
			return calslsicelist;
		}
		return new ArrayList<>();
    }
	//渠道建筑物信息查询
    @RequestMapping("/buildingquery")
    @ResponseBody
    public List<CalCanalInfo> QueryBuildingInfo(String id){
        List<String> idList = Arrays.asList(id);
        ArrayList<CalCanalInfo> channellist = new ArrayList<>();
        //查询自己本身
        CalCanalInfo canalById = calCanalInfoService.findCanalById(id);
        channellist.add(canalById);
        //查询该id下所有的子集
        channellist.addAll(getCalcaninfo(idList));
		//传入所有的渠道信息
		List<CalCanalInfo> calbuildinglist = calCanalInfoService.getbulidingList(channellist);
		if (calbuildinglist.size()>0){
			return calbuildinglist;
		}
        return new ArrayList<>();
    }

	/**递归查询渠道信息
	 * flist父id
	 * */
	private List<CalCanalInfo> getCalcaninfo(List<String> fList){
		List<String> list = fList;
		List<CalCanalInfo> calCanalInfoList = calCanalInfoService.getcalList(list);
		//如果该集合有子集
		if(calCanalInfoList.size()>0){
			List<String> idList = new ArrayList<>();
			for (CalCanalInfo calCanalInfo : calCanalInfoList) {
				idList.add(calCanalInfo.getId());
			}
			calCanalInfoList.addAll(getCalcaninfo(idList));
		}

		return calCanalInfoList;
	}


	@RequestMapping(value="/water_canal_tree", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String waterAreaTree(String waterId,String waterCode,HttpServletRequest request){
		BaseUtils baseUtils = new BaseUtils();
		String treeList = baseUtils.canalTreeList(waterCode,waterId,request);
		return treeList;
	}

	/**
	 * <p>Description: 添加弹窗</p>
	 * @author rww
	 *	@data 2018年1月3日 上午11:37:13
	 */
	@RequestMapping(value="/add_canal_page")
	public String addCanalPage(String id,String canalLevel,String canalCode,Model model,HttpServletRequest request){
		//拿到权限中的最高水管区id
		String waterAreaId = (String) request.getSession().getAttribute("id");
		SysWaterArea sysWaterArea = sysWaterAreaService.findWaterAreaById(waterAreaId);
		//根据id拿到他所有的子集
		List<SysWaterArea> sysWaterAreaList = sysWaterAreaService.findWaterAreaByLevel(0);sysWaterAreaList.add(sysWaterArea);
		model.addAttribute("sysWaterAreaList", sysWaterAreaList);
		
		
		List<SysArea> sysAreaList = sysAreaService.findAreaByLevel(0);
		model.addAttribute("sysAreaList", sysAreaList);
		List<CalCanalMaterial> calCanalMaterialList = calCanalInfoService.finAllCalCanalMaterial();
		model.addAttribute("calCanalMaterialList", calCanalMaterialList);
		List<CalCanalType> calCanalTypeList = calCanalInfoService.finAllCalCanalType();
		model.addAttribute("calCanalTypeList", calCanalTypeList);
		
		List<CalCanalUsetype> calCanalUsetypeList = calCanalInfoService.finAllCalCanalUsetype();
		model.addAttribute("calCanalUsetypeList", calCanalUsetypeList);
		
		model.addAttribute("id", id);

		//父渠道区域编码
		BaseUtils bs = new BaseUtils();
		model.addAttribute("canalCode", bs.codeGeneration("calCanalArea",canalCode,canalLevel));
		
		return ADD_CANAL_JSP;
	}
	
	/**
	 * @Title: addCanalPwaterAreaPage
	 * @Description: 添加水管区域，无实际意义
	 * @param: @param model
	 * @param: @param id
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add_canal_pwaterarea_page")
	public String addCanalPwaterAreaPage(Model model,String id,HttpServletRequest request){
		//拿到权限中的最高水管区id
		String waterAreaId = (String) request.getSession().getAttribute("id");
		SysWaterArea sysWaterArea = sysWaterAreaService.findWaterAreaById(waterAreaId);
		//根据id拿到他所有的子集
		
		
		List<SysWaterArea> sysWaterAreaList = sysWaterAreaService.findWaterAreaByLevel(0);
		sysWaterAreaList.add(sysWaterArea);
		model.addAttribute("sysWaterAreaList", sysWaterAreaList);
		
		
		List<SysArea> sysAreaList = sysAreaService.findAreaByLevel(0);
		model.addAttribute("sysAreaList", sysAreaList);
		
		
		List<CalCanalMaterial> calCanalMaterialList = calCanalInfoService.finAllCalCanalMaterial();
		model.addAttribute("calCanalMaterialList", calCanalMaterialList);
		List<CalCanalType> calCanalTypeList = calCanalInfoService.finAllCalCanalType();
		model.addAttribute("calCanalTypeList", calCanalTypeList);
		
		List<CalCanalUsetype> calCanalUsetypeList = calCanalInfoService.finAllCalCanalUsetype();
		model.addAttribute("calCanalUsetypeList", calCanalUsetypeList);
		
		model.addAttribute("id", id);
		
		return ADD_CANAL_PWATERAREA;
	}
	
	
	@RequestMapping(value = "/add_canal_pwaterarea")
	public String addCanalPwaterArea(CalCanalInfo calCanalInfo){
		String syswaterareaCode = calCanalInfo.getSyswaterareaCode();
		SysWaterArea sysWaterArea =sysWaterAreaService.findWaterAreaBySyswaterareaCode(syswaterareaCode);
		String sysWaterAreaName = sysWaterArea.getWaterAreaName();
		calCanalInfo.setCanalName(sysWaterAreaName);
		calCanalInfoService.add(calCanalInfo);
		return "redirect:/cal_canal_info/list";
	}



	
	
	@RequestMapping(value="/add_canal_preservoir_page")
	public String addCanalPreservoirPage(Model model,String id){
		List<SysWaterArea> sysWaterAreaList = sysWaterAreaService.findWaterAreaByLevel(0);
		model.addAttribute("sysWaterAreaList", sysWaterAreaList);
		
		List<SysArea> sysAreaList = sysAreaService.findAreaByLevel(0);
		model.addAttribute("sysAreaList", sysAreaList);
		List<CalCanalMaterial> calCanalMaterialList = calCanalInfoService.finAllCalCanalMaterial();
		model.addAttribute("calCanalMaterialList", calCanalMaterialList);
		List<CalCanalType> calCanalTypeList = calCanalInfoService.finAllCalCanalType();
		model.addAttribute("calCanalTypeList", calCanalTypeList);
		
		List<CalCanalUsetype> calCanalUsetypeList = calCanalInfoService.finAllCalCanalUsetype();
		model.addAttribute("calCanalUsetypeList", calCanalUsetypeList);
		
		model.addAttribute("id", id);
		
		return ADD_CANAL_PRESERVOIR;
	}
	
	/**
	 * <p>Description:添加渠道 </p>
	 * @author rww
	 * @throws IOException 
	 * @throws IllegalStateException 
	 *	@data 2017年12月22日 下午5:20:27
	 */
	@RequestMapping(value="/add")
	public String add(CanalQueryVO canalQueryVO,@RequestParam("files") MultipartFile[] files) throws Exception{
		
		//渠道信息保存
		CalCanalInfo calCanalInfo = canalQueryVO.getCalCanalInfo();
		
		//根据行政区code取得行政区
		String sysareaCode = calCanalInfo.getSysareaCode();
		SysArea areaBySysareaCode = sysAreaService.findAreaBySysareaCode(sysareaCode);
		calCanalInfo.setSysareaId(areaBySysareaCode.getId());
		//根据水管区code取得水管区
		String syswaterareaCode = calCanalInfo.getSyswaterareaCode();
		SysWaterArea sysWaterArea = sysWaterAreaService.findWaterAreaBySyswaterareaCode(syswaterareaCode);
		calCanalInfo.setSyswaterareaId(sysWaterArea.getId());
		//取得父级id
		String canalParentId = calCanalInfo.getCanalParentId();
		int canallevelCode ;
		
		if("".equals(canalParentId)||canalParentId==null){
			canallevelCode=0;
			
		}else{
			//获取父级水管区域
			CalCanalInfo pCalCanalInfo = calCanalInfoService.findCanalById(canalParentId);
			//获取父级水管区waterAreaLevel
			int pCanallevelCode = pCalCanalInfo.getCanallevelCode();
			//设置当前级别的waterAreaLevel
			canallevelCode = pCanallevelCode+1;
			
		}
		calCanalInfo.setCanallevelCode(canallevelCode);
		
		calCanalInfo.setCciCreateTime(new Date());
		
		//将当前区域保存到数据库
		
		calCanalInfoService.add(calCanalInfo);
		
		
		
		//高标准长度取值并保存
		CalCanalLengthCalssify calCanalLengthCalssify = canalQueryVO.getCalCanalLengthCalssify();
		calCanalLengthCalssify.setCanalId(canalQueryVO.getCalCanalInfo().getId());
		calCanalInfoService.addCalCanalLengthCalssify(calCanalLengthCalssify);
		
		return "redirect:/cal_canal_info/list?state=76";
	}
	
	/**
	 * <p>Description:渠道分页查询 </p>
	 * @author rww
	 *	@data 2018年1月2日 下午2:03:43
	 */
	
	List<String> ids = new ArrayList<>();
	@RequestMapping(value="/page")
	public @ResponseBody List<CalCanalInfo> page(String id,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
			//把当前的区域加入到列表中
			//更据id查询他一级他的子级
			getSonCanals(id);
			ids.add(id);
			PageHelper.startPage(page, pageSize);
			List<CalCanalInfo> list = calCanalInfoService.findCanalsByIds(ids);
			
			ids.clear();
			PageInfo<CalCanalInfo> pages = new PageInfo<CalCanalInfo>(list);
			request.getSession().setAttribute("calCanalInfoPages", pages);
	        
		return list;
	}
	
	//更据id查他的子级目录
	public void getSonCanals(String id){
			//List<String> canalCodes = new ArrayList<String>();
			List<CalCanalInfo>  sysCalCanalInfoList = calCanalInfoService.findCanalByPId(id);
			if(sysCalCanalInfoList!=null&&sysCalCanalInfoList.size()>0){
				for(int i=0;i<sysCalCanalInfoList.size();i++){
					ids.add(sysCalCanalInfoList.get(i).getId());
					List<CalCanalInfo>  sysCalCanalInfoList2 = calCanalInfoService.findCanalByPId(sysCalCanalInfoList.get(i).getId());
					if(sysCalCanalInfoList2!=null&&sysCalCanalInfoList2.size()>0){
						getSonCanals(sysCalCanalInfoList.get(i).getId());
					}
				}
			}
	}
	
	/**
	 * 导航条
	 * <p>Description: </p>
	 * @author rww
	 *	@data 2017年12月27日 下午6:00:31
	 */
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<CalCanalInfo> pageNav(HttpServletRequest request){
		PageInfo<CalCanalInfo> pages = (PageInfo<CalCanalInfo>) request.getSession().getAttribute("calCanalInfoPages");
		return pages;
	}
	
	@RequestMapping(value="/photo_page")
	public @ResponseBody List<CalCanalPhoto> photoPage(String id,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
		System.out.println("=============================================="+id);
		//当前点击的区域
		//把当前的区域加入到列表中
			PageHelper.startPage(page, pageSize);
			//根据渠道id查出渠道所有的照片
			List<CalCanalPhoto> list = calCanalInfoService.selectCalCanalPhotoByCanalId(id);
			System.out.println(list.size()+"============================================");
			PageInfo<CalCanalPhoto> pages = new PageInfo<CalCanalPhoto>(list);
			
			request.getSession().setAttribute("calCanalPhotoPages", pages);
	        
		return list;
	}
	
	/**
	 * 分页导航条
	 * <p>Description: </p>
	 * @author rww
	 *	@data 2017年12月27日 下午6:00:31
	 */
	@RequestMapping(value="/photo_page_nav")
	public @ResponseBody PageInfo<CalCanalPhoto> photoPageNav(HttpServletRequest request){
		PageInfo<CalCanalPhoto> pages2 = (PageInfo<CalCanalPhoto>) request.getSession().getAttribute("calCanalPhotoPages");
		System.out.println(pages2);
		return pages2;
	}
	
	@RequestMapping(value="/sluice_page")
	public @ResponseBody List<CalCanalSluice> sluicePage(String id,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
		//当前点击的区域
		//把当前的区域加入到列表中
			PageHelper.startPage(page, pageSize);
			//根据渠道id查出渠道所有的照片
			List<CalCanalSluice> list = calCanalInfoService.selectCalCanalSluiceByCanalId(id);
			
			PageInfo<CalCanalSluice> pages = new PageInfo<CalCanalSluice>(list);
			
			request.getSession().setAttribute("calCanalSluicePages", pages);
	        
		return list;
	}
	
	/**
	 * 分页导航条
	 * <p>Description: </p>
	 * @author rww
	 *	@data 2017年12月27日 下午6:00:31
	 */
	@RequestMapping(value="/sluice_page_nav")
	public @ResponseBody PageInfo<CalCanalSluice> sluicePageNav(HttpServletRequest request){
		PageInfo<CalCanalSluice> pages = (PageInfo<CalCanalSluice>) request.getSession().getAttribute("calCanalSluicePages");
		return pages;
	}
	
	@RequestMapping(value="/building_page")
	public @ResponseBody List<CalCanalBuilding> buildingPage(String id,HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
		
		//当前点击的区域
		//把当前的区域加入到列表中
			PageHelper.startPage(page, pageSize);
			//根据渠道id查出渠道所有的照片
			List<CalCanalBuilding> list = calCanalInfoService.selectCalCanalBuildingByCanalId(id);
			
			PageInfo<CalCanalBuilding> pages = new PageInfo<CalCanalBuilding>(list);
			
			request.getSession().setAttribute("calCanalBuildingPages", pages);
	        
		return list;
	}
	
	/**
	 * 分页导航条
	 * <p>Description: </p>
	 * @author rww
	 *	@data 2017年12月27日 下午6:00:31
	 */
	@RequestMapping(value="/building_page_nav")
	public @ResponseBody PageInfo<CalCanalBuilding> buildingPageNav(HttpServletRequest request){
		PageInfo<CalCanalBuilding> pages2 = (PageInfo<CalCanalBuilding>) request.getSession().getAttribute("calCanalBuildingPages");
		return pages2;
	}
	
	/**
	 * <p>Description: ajax获取最高父级</p>
	 * @author rww
	 *	@data 2017年12月26日 下午3:04:05
	 */
	@RequestMapping(value="/pId")
	public @ResponseBody String getPId(){
		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalByLevel(0);
		if(calCanalInfo!=null){
			return calCanalInfo.getId();
		}else{
			return "";
		}
	}
	
	/**
	 * <p>Description: 单条记录删除</p>
	 * @author rww
	 *	@data 2017年12月28日 上午8:31:16
	 */
	@RequestMapping(value="/delete_byid")
	public @ResponseBody String deleteById(String id){
		
//		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(id);
//		//找到父一级
//		String pid = calCanalInfo.getCanalParentId();
//		//首先找传来id的子一级目录
//		delete(id);
		int state = calCanalInfoService.deleteById(id);
		return state+"";
	}
	
	/**
	 * <p>Description:递归删除 </p>
	 * @author rww
	 *	@data 2017年12月28日 上午8:52:31
	 */
	public void deleteCanalByPId(String id){
		calCanalInfoService.deleteById(id);
		List<CalCanalInfo> list = calCanalInfoService.findCanalByPId(id);
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				
				calCanalInfoService.deleteById(list.get(i).getId());
				List<CalCanalInfo> list2 = calCanalInfoService.findCanalByPId(list.get(i).getId());
				if(list2!=null&&list2.size()>0){
					deleteCanalByPId(list.get(i).getCanalParentId());
				}
			}
		}
	}
	
	public void delete(String id){
		List<CalCanalInfo> list  = calCanalInfoService.findCanalByPId(id);
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				calCanalInfoService.deleteById(list.get(i).getId());
				delete(list.get(i).getId());
			}
		}else{
			calCanalInfoService.deleteById(id);
		}
		
	}
	
	
	@RequestMapping(value="/find_son_water_Area")
	public @ResponseBody List<SysWaterArea> findSonWaterArea(String id){
		List<SysWaterArea> sysWaterAreaList = sysWaterAreaService.findWaterAreaByPId(id);
		return sysWaterAreaList;
	}
	
	@RequestMapping(value="/find_son_Area")
	public @ResponseBody List<SysArea> findSonArea(String id){
		List<SysArea> sysAreaList = sysAreaService.findAreaByPId(id);
		return sysAreaList;
	}
	
	
	@RequestMapping(value="/edit_page")
	public String editPage(String id,Model model,HttpServletRequest request){
		List<SysWaterArea> sysWaterAreaList = sysWaterAreaService.findWaterAreaByLevel(0);
		model.addAttribute("sysWaterAreaList", sysWaterAreaList);
		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(id);
		
		//行政区id
		String areaId = calCanalInfo.getSysareaId();
		//行政区Code
		String areaCode = calCanalInfo.getSysareaCode();
		List<SysArea> sysAreaList = sysAreaService.findAreaByLevel(0);
		model.addAttribute("sysAreaList", sysAreaList);
		//水管区id
		String waterAreaId = calCanalInfo.getSyswaterareaId();
		SysWaterArea sysWaterArea = sysWaterAreaService.findWaterAreaById(waterAreaId);
		String waterAreaNames="";
		
		if(sysWaterArea!=null){
			waterAreaNames ="{=="+sysWaterArea.getWaterAreaLevel()+":"+sysWaterArea.getWaterAreaName()+"==}";
			String parentWaterareaId = sysWaterArea.getParentWaterareaId();
			int sysWaterAreaLevel = sysWaterArea.getWaterAreaLevel();
			for(int i=0;i<sysWaterAreaLevel;i++){
				SysWaterArea pSysWaterArea = sysWaterAreaService.findWaterAreaById(parentWaterareaId);
				if(pSysWaterArea!=null){
					waterAreaNames="{=="+pSysWaterArea.getWaterAreaLevel()+":"+pSysWaterArea.getWaterAreaName()+"==}"+waterAreaNames;
					parentWaterareaId=pSysWaterArea.getParentWaterareaId();
				}else{
					calCanalInfo.setSyswaterareaCode("");
					calCanalInfo.setSyswaterareaId("");
					waterAreaNames="无";
					break;
				}
			}
		}else{
			calCanalInfo.setSyswaterareaCode("");
			calCanalInfo.setSyswaterareaId("");
			waterAreaNames="无";
		}
		model.addAttribute("waterAreaNames", waterAreaNames);
		
		
		/*SysArea sysArea = sysAreaService.findAreaBySysareaCode(areaCode);
		
		String areaNames ="{=="+sysArea.getAreaLevel()+":"+sysArea.getAreaName()+"==}";
		String parentAreaId = sysArea.getParentAreaId();
		int sysAreaLevel = sysArea.getAreaLevel();
		for(int i=0;i<sysAreaLevel;i++){
			SysArea pSysArea = sysAreaService.findAreaById(parentAreaId);
			if(pSysArea!=null){
				areaNames="{=="+pSysArea.getAreaLevel()+":"+pSysArea.getAreaName()+"==}"+areaNames;
				parentAreaId=pSysArea.getParentAreaId();
			}
		}
		
		model.addAttribute("areaNames",areaNames);*/
		
		
		
		//水管区Code
		String waterAreaCode = calCanalInfo.getSyswaterareaCode();
		//材料编码=========================
		List<CalCanalMaterial> calCanalMaterialList = calCanalInfoService.finAllCalCanalMaterial();
		model.addAttribute("calCanalMaterialList", calCanalMaterialList);
		//已经选中的材料编码
		String canalmaterialCode = calCanalInfo.getCanalmaterialCode();
		//渠道类型编码======================
		List<CalCanalType> calCanalTypeList = calCanalInfoService.finAllCalCanalType();
		model.addAttribute("calCanalTypeList", calCanalTypeList);
		//已经选中的渠道类型的编码
		int CanaltypeCode = calCanalInfo.getCanaltypeCode();
		//渠道用途编码======================
		List<CalCanalUsetype> calCanalUsetypeList = calCanalInfoService.finAllCalCanalUsetype();
		model.addAttribute("calCanalUsetypeList", calCanalUsetypeList);
		//已经选中的渠道用途
		String canalusetypeCode = calCanalInfo.getCanalusetypeCode();
		//渠道的高标准说明
		CalCanalLengthCalssify calCanalLengthCalssify = calCanalInfoService.findCalCanalLengthCalssifyByCanalId(calCanalInfo.getId());
		//添加到包装类中
		CanalQueryVO canalQueryVO = new CanalQueryVO();
		canalQueryVO.setCalCanalInfo(calCanalInfo);
		canalQueryVO.setCalCanalLengthCalssify(calCanalLengthCalssify);
		model.addAttribute("canalQueryVO", canalQueryVO);
		return EDIT_CANAL_JSP;
	}
	
	/**
	 * <p>Description: 修改提交</p>
	 * @author rww
	 *	@data 2018年1月6日 上午9:36:20
	 */
	@RequestMapping(value="/edit")
	public String edit(CanalQueryVO canalQueryVO){
		
		//渠道信息保存
		CalCanalInfo calCanalInfo = canalQueryVO.getCalCanalInfo();
		//根据行政区code取得行政区
		String sysareaCode = calCanalInfo.getSysareaCode();
		SysArea areaBySysareaCode = sysAreaService.findAreaBySysareaCode(sysareaCode);
		calCanalInfo.setSysareaId(areaBySysareaCode.getId());
		//根据水管区code取得水管区
		String syswaterareaCode = calCanalInfo.getSyswaterareaCode();
		SysWaterArea sysWaterArea = sysWaterAreaService.findWaterAreaBySyswaterareaCode(syswaterareaCode);
		calCanalInfo.setSyswaterareaId(sysWaterArea.getId());
		
		calCanalInfoService.update(calCanalInfo);
		
		CalCanalLengthCalssify calCanalLengthCalssify = canalQueryVO.getCalCanalLengthCalssify();
		
		calCanalInfoService.updateCalCanalLengthCalssify(calCanalLengthCalssify);
		
		return "redirect:/cal_canal_info/list";
	}
	
	
	@RequestMapping(value="/add_canal_photo_page")
	public String addCanalPhotoPage(String id,Model model){
		
		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(id);
		model.addAttribute("calCanalInfo", calCanalInfo);
		return ADD_CANAL_PHOTO;
	}
	
	@RequestMapping(value="/add_canal_photo")
	public @ResponseBody JSONObject addCanalPhoto(String id,MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		//设置图片名称不能重复UUID
		String picName = UUID.randomUUID().toString();
		//获取文件名称
		String oriName = file.getOriginalFilename();
		//获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));
		//开始上传
		file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
		//将名称存入数据库
		CalCanalPhoto calCanalPhoto = new CalCanalPhoto();
		calCanalPhoto.setCanalId(id);
		calCanalPhoto.setCanalPhotoimg(picName + extName);
		calCanalInfoService.addCanalPhoto(calCanalPhoto);
		//将存好的记录的id放入session中
		//request.getSession().setAttribute("id", calCanalPhoto.getId());
		//
		//String params = "{'code': 0,'msg': '','data': { 'src': 'http://cdn.layui.com/123.jpg'}}";  
		//将这个photo的id放到json中
		String params="{'code': 0,'msg': '','canalPhotoId':'"+calCanalPhoto.getId()+"','data': { 'src': 'http://cdn.layui.com/123.jpg'}}";  
		JSONObject jsStr = JSONObject.parseObject(params);
		return jsStr;
	}
	
	@RequestMapping(value="/add_canal_photo_remark")
	public @ResponseBody String addCanalPhotoRemark(String canalId,String remark,HttpServletRequest request) throws IllegalStateException, IOException{
		//拿到上面放到session中的photo的id
		//String id = (String) request.getSession().getAttribute("id");
		CalCanalPhoto calCanalPhoto = calCanalInfoService.findCanalPhotoById(canalId);
		calCanalPhoto.setCcpRemark(remark);
		int number = calCanalInfoService.updateCanalPhoto(calCanalPhoto);
	  return number+"";
	}
	//渠道照片批量删除
	@RequestMapping(value="/delete_canalPhotos_byid")
	public @ResponseBody String deleteCanalPhotosById(@RequestParam(value = "photoIds[]") String[] photoIds){
			int state=0;
	
			for(int i=0;i<photoIds.length;i++){
			 int a = calCanalInfoService.deleteCanalPhotoById(photoIds[i]);
			 state+=a;
			}
			return ""+state;
		
	}
	
	//照片单个删除
	@RequestMapping(value="delete_single_canalphoto_byid")
	public @ResponseBody String deleteSingleCanalPhotoById(String id){
		
		int state = calCanalInfoService.deleteCanalPhotoById(id);
		return ""+state;
	}
	
	
	//建筑物批量删除
	@RequestMapping(value="/delete_canalBuildings_byid")
	public @ResponseBody String deleteCanalBuildingsById(@RequestParam(value = "buildingIds[]") String[] buildingIds){
			int state=0;
	
			for(int i=0;i<buildingIds.length;i++){
			 int a = calCanalInfoService.deleteCanalBuildingById(buildingIds[i]);
			 state+=a;
			}
			return ""+state;
		
	}
	
	//建筑物单个删除
	@RequestMapping(value="/delete_single_canalbuilding_byid")
	public @ResponseBody String deleteSingleCanalBuildingById(String id){
		
		int state = calCanalInfoService.deleteCanalBuildingById(id);
		return ""+state;
	}
	
	//添加渠道建筑物弹出框
	@RequestMapping(value="/add_canal_building_page")
	public String addCanalBuildingPage(String id,Model model){
		
		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(id);
		model.addAttribute("calCanalInfo", calCanalInfo);
		
		return ADD_CANAL_BUILDING;
	}
	
	//添加渠道建筑物
	@RequestMapping(value="/add_canal_building")
	public String addCanalBuilding(CalCanalBuilding calCanalBuilding,Model model,MultipartFile file) throws IllegalStateException, IOException{
		
		//设置图片名称不能重复UUID
		String picName = UUID.randomUUID().toString();
		//获取文件名称
		String oriName = file.getOriginalFilename();
		//获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));
		//开始上传
		file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
		//将名称存入数据库
		calCanalBuilding.setBuildingPhoto(picName + extName);
		
		calCanalBuilding.setCcbCreateTime(new Date());
		
		calCanalInfoService.addCanalBuilding(calCanalBuilding);
		return "redirect:/cal_canal_info/list";
	}
	
	//渠道建筑信息编辑页面======
	@RequestMapping(value="/edit_canal_building_page")
	public String editCanalBuildingPage(String id,Model model){
		CalCanalBuilding calCanalBuilding = calCanalInfoService.findCanalBuildingById(id);
		model.addAttribute("calCanalBuilding", calCanalBuilding);
		
		return EDIT_CANAL_BUILDING;
	}
	
	//渠道建筑信息编辑保存=====
	@RequestMapping(value="/edit_canal_building")
	public String editCanalBuilding(CalCanalBuilding calCanalBuilding,Model model,MultipartFile file) throws IllegalStateException, IOException{
		if(file.getSize()!=0){
			//设置图片名称不能重复UUID
			String picName = UUID.randomUUID().toString();
			//获取文件名称
			String oriName = file.getOriginalFilename();
			//获取图片后缀
			String extName = oriName.substring(oriName.lastIndexOf("."));
			//开始上传
			file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
			//将名称存入数据库
			calCanalBuilding.setBuildingPhoto(picName + extName);
		}
		calCanalInfoService.updateCanalBuilding(calCanalBuilding);

		return "redirect:/cal_canal_info/list";
	}
	
	//添加渠道闸门弹出框
	@RequestMapping(value="/add_canal_sluice_page")
	public String addCanalSluicePage(String id,Model model){
		
		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(id);
		model.addAttribute("calCanalInfo", calCanalInfo);
		
		return ADD_CANAL_SLUICE;
	}
	
	//添加渠道闸门
	@RequestMapping(value="/add_canal_sluice")
	public String addCanalSluice(CalCanalSluice calCanalSluice,Model model,MultipartFile file) throws IllegalStateException, IOException{
		
		//设置图片名称不能重复UUID
		String picName = UUID.randomUUID().toString();
		//获取文件名称
		String oriName = file.getOriginalFilename();
		//获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));
		//开始上传
		file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
		//将名称存入数据库
		calCanalSluice.setSluicePhoto(picName + extName);
		
		calCanalSluice.setCreateTime(new Date());
		
		calCanalInfoService.addCanalSluice(calCanalSluice);
		return "redirect:/cal_canal_info/list";
	}
	
	//渠道闸门信息编辑页面======
	@RequestMapping(value="/edit_canal_sluice_page")
	public String editCanalSluicePage(String id,Model model){

		CalCanalSluice calCanalSluice = calCanalInfoService.findCanalSluiceById(id);
		model.addAttribute("calCanalSluice", calCanalSluice);
		return EDIT_CANAL_SLUICE;
	}
		
	//渠道闸门信息编辑保存=====
	@RequestMapping(value="/edit_canal_sluice")
	public String editCanalsluice(CalCanalSluice calCanalSluice,MultipartFile file) throws IllegalStateException, IOException{
		if(file.getSize()!=0){
			//设置图片名称不能重复UUID
			String picName = UUID.randomUUID().toString();
			//获取文件名称
			String oriName = file.getOriginalFilename();
			//获取图片后缀
			String extName = oriName.substring(oriName.lastIndexOf("."));
			//开始上传
			file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
			//将名称存入数据库
			calCanalSluice.setSluicePhoto(picName + extName);
		}
		calCanalInfoService.updateCanalsluice(calCanalSluice);

		return "redirect:/cal_canal_info/list";
	}
	
	//渠道闸门单个删除
	@RequestMapping(value="/delete_single_canalsluice_byid")
	public @ResponseBody String deleteSingleCanalsluiceById(String id){
		int state = calCanalInfoService.deleteCanalSluiceById(id);
		return ""+state;
	}
	//建筑物批量删除
	@RequestMapping(value="/delete_canalSluices_byid")
	public @ResponseBody String deleteCanalSluicesById(@RequestParam(value = "sluiceIds[]") String[] sluiceIds){
		int state=0;
		for(int i=0;i<sluiceIds.length;i++){
		 int a = calCanalInfoService.deleteCanalSluiceById(sluiceIds[i]);
		 state+=a;
		}
		return ""+state;
	}

	/**
	 * 渠道建筑物图片单独修改路径
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping("/edit_canal_building_image")
	public @ResponseBody JsonResult updateCanalBuildingImage( MultipartFile file,HttpServletRequest request){
		CalCanalInfo calCanalInfo = JSONObject.parseObject(request.getParameter("canal"), CalCanalInfo.class);
		//设置图片名称不能重复UUID
		String picName = UUID.randomUUID().toString();
		//获取文件名称
		String oriName = file.getOriginalFilename();
		//获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));
		try{
			File fee = new File("D:/develop/upload/temp/"+calCanalInfo.getBuildingPhoto());
			if(fee.exists()){
				fee.delete();
			}
			file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
			CalCanalBuilding calCanalBuilding = new CalCanalBuilding();
			calCanalBuilding.setId(calCanalInfo.getBuildingid());
			calCanalBuilding.setBuildingPhoto(picName + extName);
			calCanalInfoService.updateCanalBuildingImage(calCanalBuilding);
			logger.info("修改成功:"+oriName);
		}catch(Exception e){
			logger.error("修改失败");
		}
		return new JsonResult();
	}
}
