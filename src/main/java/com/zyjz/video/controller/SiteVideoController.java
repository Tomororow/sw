package com.zyjz.video.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.zyjz.site.entity.SiteSluiceDynamicInfo;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sysmanage.entity.*;
import com.zyjz.sysmanage.service.SiteDeviceModelService;
import com.zyjz.sysmanage.service.SiteMiddleCanalService;
import com.zyjz.user.entity.SysUser;
import com.zyjz.user.service.UserService;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;
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
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.sysmanage.service.BaseParamService;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.utils.controller.BaseUtils;
import com.zyjz.video.entity.SiteVideoInfo;
import com.zyjz.video.service.SiteVideoInfoService;

/**
 * @ClassName: VideoController
 * @Description: 视频监控
 * @Author: zhaojx
 * @Date: 2018年2月24日 下午3:45:09
 */
@Controller
@RequestMapping(value="/video")
public class SiteVideoController {

	@Autowired
	private CalCanalInfoService calCanalInfoService;
	@Autowired
	private SiteVideoInfoService siteVideoInfoService;
	//设备类型
	@Autowired
	private BaseParamService baseParamService;
	@Autowired
	UserService userService;
	@Autowired
	SiteDeviceModelService siteDeviceModelService;

	@Autowired
	SiteMiddleCanalService siteMiddleCanalService;

	private static final Logger logger = LoggerFactory.getLogger(SiteVideoInfo.class);

	/** 视图解析页面路径 */
	protected static final String VIDEO_MONITOR_JSP = "/video/video_monitor";
	protected static final String VIDEO_SITE_LIST_JSP = "/video/video_site_list";
	protected static final String VIDEO_SITE_ADD_JSP = "/video/add_video";



	/**
	 * @Title: getVideoPage
	 * @Description: 视频站信息管理页面加载
	 * @param: @param request
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/getVideoPage", method=RequestMethod.GET)
	public String getVideoPage(HttpServletRequest request,int state,Model model){
		// 获取渠道信息
		System.out.println("===============================>"+state);
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return VIDEO_SITE_LIST_JSP;
	}

	private List<String> canalCodes = new ArrayList<String>();

	/**
	 * @Title: getVideoSiteList
	 * @Description: 视频站信息查询
	 * @param: @param id
	 * @param: @param request
	 * @param: @param page
	 * @param: @param pageSize
	 * @return: List<SiteVideoInfo>
	 */
	@RequestMapping(value="/getVideoSiteList",produces = "text/html; charset=utf-8")
	public @ResponseBody String getVideoSiteList(String canalCode){

		//根据水管区code获得canalCode
//		SysUser user = userService.selectBySysWaterAreaCode(id);

		// 获取渠道编码
//		String id = request.getParameter("id");
//		System.out.println("=====================id==============="+id);
//		CalCanalInfo calCanalInfo= calCanalInfoService.findCanalById(id);
//		System.out.println("222");
//		String canalCode = calCanalInfo.getCanalCode();
//		getCanalCode(id);
//		canalCodes.add(canalCode);
//		PageHelper.startPage(page, pageSize);
//		List<SiteVideoInfo> videoList = siteVideoInfoService.findSiteVideoByCanalCodes(canalCodes);
//		if(videoList!=null&&videoList.size()>0){
//			for(SiteVideoInfo siteVideoInfo:videoList){
//				if(siteVideoInfo!=null){
//					Integer sviDevCode=Integer.parseInt(siteVideoInfo.getSviDevicemodelCode());//设备类型编号
//					SiteDeviceModel siteDeviceModel=baseParamService.selectByDeviceCode(sviDevCode);
//					if(siteDeviceModel!=null){
//						siteVideoInfo.setSviDevicemodelCode(siteDeviceModel.getDeviceName());
//					}
//				}
//			}
//		}
//		canalCodes.clear();

		List<SiteVideoInfo> videoList =  siteVideoInfoService.findSiteVideoByCanalCodeJoin(canalCode);
//		PageInfo<SiteVideoInfo> pages = new PageInfo<SiteVideoInfo>(videoList);
//		request.getSession().setAttribute("pages", pages);
		return JSONObject.toJSONString(videoList);
	}

	/**
	 * 分页导航条
	 * <p>Description: </p>
	 * @author rww
	 *	@data 2017年12月27日 下午6:00:31
	 */
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<SiteVideoInfo> siteWaterPageNav(HttpServletRequest request){
		PageInfo<SiteVideoInfo> pages = (PageInfo<SiteVideoInfo>) request.getSession().getAttribute("pages");
		return pages;
	}

	//递归拿到所有的水位站
	public void getCanalCode(String id){
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
	 * @Title: addPage
	 * @Description: 跳转视频信息添加页面
	 * @param: @param request
	 * @return: ModelAndView
	 */
	@RequestMapping(value="/addPage", method=RequestMethod.GET)
	public ModelAndView addPage(HttpServletRequest request ,String id){
		ModelAndView modelAndView = new ModelAndView(VIDEO_SITE_ADD_JSP);
		// 获取测量设备下拉框信息
		List<SiteDeviceModel> siteDeviceModels = baseParamService.findAllSiteDeviceModel();
		if(siteDeviceModels != null && siteDeviceModels.size() > 0){
			modelAndView.addObject("siteDeviceModels", siteDeviceModels);
		}
		CalCanalInfo calCanalInfo = calCanalInfoService.findCanalById(id);
		request.setAttribute("canalCode", calCanalInfo!=null?calCanalInfo.getCanalCode():"");
		return modelAndView;
	}

	/**
	 * @Title: saveVideoInfo
	 * @Description: 保存新增视频站点信息
	 * @param: @param request
	 * @param: @param siteVideoInfo
	 * @return: int
	 */
	@RequestMapping(value="/saveVideoInfo", method=RequestMethod.POST)
	public String saveVideoInfo(HttpServletRequest request, SiteVideoInfo siteVideoInfo,@RequestParam MultipartFile[] file){
//		if(siteVideoInfo != null){
//			siteVideoInfo.setId(UUID.randomUUID().toString().replace("-", ""));
//		}
		System.out.println("================add====================="+file.length);
		System.out.println("------气死我了！-----00");
		try {
			if(file!=null&&file.length>0){
				for(int i=0;i<file.length;i++){
					System.out.println("//////////////////////////"+i);
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
							siteVideoInfo.setSviPhotoBefore(picName + extName);
						}else if(i==1){
							siteVideoInfo.setSviPhotoAfter(picName + extName);
						}
					}
				}
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		siteVideoInfo.setSviCreateTime(new Date());
		siteVideoInfoService.insertSelective(siteVideoInfo);

		//siteMiddleCanal中间表插入或更新
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.updateSiteMiddle("calCanal",siteVideoInfo.getSviCanalCode(),
				"device_video_code",siteVideoInfo.getDeviceVideoCode(),request);
		return "redirect:/video/getVideoPage?state=24";

	}
	/**
	 * 根据渠道id获取视频站信息
	 * @Title: getSiteVideoInfoByCalCanalInfoId
	 * @Description:
	 * @param: @param id
	 * @param: @return
	 * @return: SiteVideoInfo
	 * @throws
	 */
	@RequestMapping("/getSiteVideoInfoByCalCanalInfoId")
	@ResponseBody
	public  SiteVideoInfo getSiteVideoInfoByCalCanalInfoId(String id){
//		CalCanalInfo calCanalInfo= calCanalInfoService.findCanalById(id);
//		String canalCode = calCanalInfo.getCanalCode();
//		SiteVideoInfo siteVideoInfo= siteVideoInfoService.getVideoInfoBySviCanalCode(canalCode);
		SiteVideoInfo siteVideoInfo= siteVideoInfoService.getVideoInfoBySviCanalCode(id);
		return siteVideoInfo;
	}

	@RequestMapping(value = "/edit")
	public String edit(String editData, HttpServletRequest request){
		SiteVideoInfo siteVideoInfo = JSON.parseObject(editData,SiteVideoInfo.class);
		//站点修改前中间表数据修改
		int state = updateSiteMiddleCanal(siteVideoInfo.getId());
		siteVideoInfo.setSviDevicemodelCode(siteVideoInfo.getDevicemodelName());
		siteVideoInfo.setSviCreateTime(new Date());
		siteVideoInfoService.updateByPrimaryKeySelective(siteVideoInfo);

		//站点修改后中间表数据修改
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.updateSiteMiddle("calCanal",siteVideoInfo.getSviCanalCode(),
				"device_video_code",siteVideoInfo.getDeviceVideoCode(),request);
		return "redirect:/site_water_manage/list";
	}

	//视频站单个删除
	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id){
		//站点修改前中间表数据修改
		int a= updateSiteMiddleCanal(id);
		int state = siteVideoInfoService.deleteByPrimaryKey(id);
		return state+"";
	}

	//修改闸门站安装前图片
	@RequestMapping("/imageUpdate")
	@ResponseBody
	public JsonResult imageUpdate(MultipartFile file, HttpServletRequest request){
		SiteVideoInfo svi = JSONObject.parseObject(request.getParameter("video"), SiteVideoInfo.class);
		File fils = new File(svi.getSviPhotoBefore());
		if(fils.exists()){
			fils.delete();
		}
		//设置图片名称不能重复UUID
		String picName = UUID.randomUUID().toString();
		//获取文件名称
		String oriName = file.getOriginalFilename();
		//获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));
		try{
			//开始上传
			file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
			svi.setSviPhotoBefore(picName+extName);
			svi.setSviEditTime(new Date());
			siteVideoInfoService.updateByPrimaryKeySelective(svi);
			logger.info("修改成功:"+oriName);
		}catch(Exception e){
			logger.error("修改失败");
		}
		return new JsonResult();
	}

	/**
	 * 查询设备类型
	 * @return
	 */
	@RequestMapping(value="/query_video_deviceModel",produces = "text/html; charset=utf-8")
	public @ResponseBody String queryVideoDeviceModel(){
		List<SiteDeviceModel> siteDeviceModels = siteDeviceModelService.selectAll();
		return JSONObject.toJSONString(siteDeviceModels);
	}

	/**
	 * 查询所有视频
	 * @return
	 */
	@RequestMapping(value="/query_all_video",produces = "text/html; charset=utf-8")
	public @ResponseBody String findAllSiteVideoInfo(){
		List<SiteVideoInfo> allSiteVideoInfo = siteVideoInfoService.findAllSiteVideoInfo();
		return JSONObject.toJSONString(allSiteVideoInfo);
	}

	/**
	 * 站点修改时中间表的数据修改
	 * @param id
	 * @return
	 */
	private int updateSiteMiddleCanal(String id){
		int state = 0;
		SiteVideoInfo siteVideoInfoById = siteVideoInfoService.selectByPrimaryKey(id);
		if(siteVideoInfoById != null){
			String code = "'"+siteVideoInfoById.getDeviceVideoCode()+"'";
			List<SiteMiddleCanal> siteMiddleCanalList = siteMiddleCanalService.selectMiddleCanalInfoByCode(code, "device_video_code");
			if(siteMiddleCanalList.size()>0){
				for (SiteMiddleCanal canal : siteMiddleCanalList) {
					canal.setDeviceVideoCode("");
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