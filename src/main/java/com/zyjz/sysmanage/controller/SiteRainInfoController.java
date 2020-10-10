package com.zyjz.sysmanage.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.sysmanage.entity.SiteDeviceModel;
import com.zyjz.sysmanage.entity.SiteRainInfo;
import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.entity.SysDatabaseInfo;
import com.zyjz.sysmanage.service.BaseParamService;
import com.zyjz.sysmanage.service.SiteRainInfoService;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.sysmanage.service.SysDatabaseInfoService;
import com.zyjz.utils.FileUtils;
import com.zyjz.utils.controller.BaseUtils;

/**
 * @ClassName: SiteRainInfoController
 * @Description: 雨量站管理controller
 * @Author: zhaojx
 * @Date: 2018年3月13日 下午5:01:15
 */
@Controller
@RequestMapping(value="/siteRainManage")
public class SiteRainInfoController {
	
	@Autowired
	private SysAreaService sysAreaService;
	@Autowired
	private SiteRainInfoService siteRainInfoService;
	@Autowired
	private SysDatabaseInfoService sysDatabaseInfoService;
	@Autowired
	private BaseParamService baseParamService;
	
	/** 视图解析页面路径 */
	protected static final String RAIN_SITE_MANAGE_LIST = "/sysmanage/site_manage/site_rain/site_list";
	protected static final String DETAIL_RAIN_SITE_JSP = "/sysmanage/site_manage/site_rain/rain_site_detail";
	protected static final String ADD_RAIN_SITE_JSP = "/sysmanage/site_manage/site_rain/add_rain_site";
	
	/**
	 * @Title: list
	 * @Description: 初始化站点列表页面
	 * @param: @return
	 * @return: String
	 */
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return RAIN_SITE_MANAGE_LIST;
	}
	
	/**
	 * @Title: getRainSiteList
	 * @Description: 雨量站信息分页查询
	 * @param: @param id
	 * @param: @param request
	 * @param: @param page
	 * @param: @param pageSize
	 * @return: List<SiteRainInfo>
	 */
	@RequestMapping(value="/getRainSiteList",produces = "text/html; charset=utf-8")
	@ResponseBody
	public String getRainSiteList(HttpServletRequest request, String areaId){
		List<String> areaIdsList = new ArrayList<String>();
		Map<String,Object> params = new HashMap<String,Object>();
		if(!areaId.equals("") && areaId != null){
			// 获取所选区域下子区域信息 并获取Id放入集合
			List<SysArea> childAreaList = sysAreaService.findAreaByPId(areaId);
			for(SysArea sysArea : childAreaList){
				areaIdsList.add(sysArea.getId());
			}
			areaIdsList.add(areaId);
			params.put("areaIdsList", areaIdsList);
		}else{
			params.put("areaIdsList", null);
		}
//		PageHelper.startPage(page, pageSize);
		// 存放雨量站信息集合
		List<SiteRainInfo> rainSiteList = siteRainInfoService.getRainSiteByAreaId(params);
//		PageInfo<SiteRainInfo> pages = new PageInfo<SiteRainInfo>(rainSiteList);
//		request.getSession().setAttribute("pages", pages);
		return JSONObject.toJSONString(rainSiteList);
	}
	
	/**
	 * @Title: getPages
	 * @Description: 获取session分页信息
	 * @param: @param request
	 * @return: PageInfo<SiteRainInfo>
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/getPages")
	public @ResponseBody PageInfo<SiteRainInfo> getPages(HttpServletRequest request){
		PageInfo<SiteRainInfo> pages = (PageInfo<SiteRainInfo>) request.getSession().getAttribute("pages");
		return pages;
	}
	
	/**
	 * @Title: detailRainSitePage
	 * @Description: 根据ID获取雨量站详情信息
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/detailRainSitePage")
	public ModelAndView detailRainSitePage(String sid){
		ModelAndView modelAndView = new ModelAndView(DETAIL_RAIN_SITE_JSP);
		SiteRainInfo siteRainInfo = new SiteRainInfo();
		if(sid != null && !sid.equals("")){
			siteRainInfo = siteRainInfoService.selectByPrimaryKey(sid);
		}
		modelAndView.addObject("siteRainInfo", siteRainInfo);
		return modelAndView;
	}
	
	/**
	 * @Title: addPage
	 * @Description: 跳转雨量站点添加页面
	 * @param: @param request
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/addPage", method=RequestMethod.GET)
	public ModelAndView addPage(HttpServletRequest request, String areaId){
		ModelAndView modelAndView = new ModelAndView(ADD_RAIN_SITE_JSP);
		// 获取数据提取系统下拉框信息
		List<SysDatabaseInfo> databaseInfos = sysDatabaseInfoService.getBaseAll();
		if(databaseInfos != null && databaseInfos.size() > 0){
			modelAndView.addObject("databaseInfos", databaseInfos);
		}
		// 获取测量设备下拉框信息
		List<SiteDeviceModel> siteDeviceModels = baseParamService.findAllSiteDeviceModel();
		if(siteDeviceModels != null && siteDeviceModels.size() > 0){
			modelAndView.addObject("siteDeviceModels", siteDeviceModels);
		}
		modelAndView.addObject("areaId", areaId);
		return modelAndView;
	}
	
	/**
	 * @Title: saveRainSiteInfo
	 * @Description: 保存新增雨量站信息
	 * @param: @param request
	 * @param: @param SiteRainInfo
	 * @return: int
	 */
	@RequestMapping(value="/saveRainSiteInfo", method=RequestMethod.POST)
	public int saveRainSiteInfo(HttpServletRequest request, SiteRainInfo sysRainInfo, @RequestParam(value="files", required=false) MultipartFile[] files){
		int flag = 0;
		// 获取上传文件路径
		String filePath = "E:/SurfaceWater/upload/";
		// 判断file数组不能为空并且长度大于0
        if(files != null && files.length > 0){
            // 循环获取file数组中得文件
            for(int i = 0;i < files.length; i++){
                MultipartFile file = files[i];
                // 设置文件名称不能重复
				String picName = UUID.randomUUID().toString().replace("-", "");
				// 获取源文件名称
				String oriName = file.getOriginalFilename();
				// 判断上传图片名称是否为空
				if(oriName != null && !oriName.equals("")){
					// 获取图片后缀
					String extName = oriName.substring(oriName.lastIndexOf("."));
					// 转存文件名至数据库
					if(sysRainInfo != null && i == 0){
						sysRainInfo.setSriPhotoBefore(picName+extName);
					}else if(sysRainInfo != null && i == 1){
						sysRainInfo.setSriPhotoAfter(picName+extName);
					}
	                // 转存文件  路径+重命名文件+后缀 
	                FileUtils.saveFile(file, filePath+picName+extName);
				}
            }
        }
        if(sysRainInfo != null){
        	sysRainInfo.setId(UUID.randomUUID().toString().replace("-", ""));
        	sysRainInfo.setSriCreateTime(new Date());
        	sysRainInfo.setSriEditTime(new Date());
        	flag = siteRainInfoService.insertSelective(sysRainInfo);
        }
		return flag;
	}
	
}