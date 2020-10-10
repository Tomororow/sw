package com.zyjz.sitemanage.controller;


import java.io.File;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.zyjz.sysmanage.entity.SysArea;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zyjz.sitemanage.web.WaterTreeMenu;
import com.zyjz.sitemanage.entity.WaterSurveySite;
import com.zyjz.sitemanage.service.WaterSurveySiteService;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sysmanage.entity.CalCanalInfo;
import com.zyjz.sysmanage.service.CalCanalInfoService;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.utils.controller.BaseUtils;

@Controller
@RequestMapping(value="/water_survey_site")
public class WaterSurveySiteController {
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(WaterSurveySite.class); 
	@Autowired
	private WaterSurveySiteService waterSurveySiteService;
	@Autowired
	private SysAreaService sysAreaService;
	@Autowired
	private CalCanalInfoService calCanalInfoService;
	
	private List<String> canalCodes = new ArrayList<>();

    private List<String> sysAreaCode = new ArrayList<>();
	//随机数
	private String STR = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	//存储路径
	private String url = "D:\\develop\\upload\\temp";
	
	//水质检测主页面
	protected static final String WATER_SURVEY_JSP=  "/sitemanage/water_survey_site/list";
	
	//水质检测页面的增加页面
	
	protected static final String ADD_FORMS = "/sitemanage/water_survey_site/addforms";
	
	//修改页面
	protected static final String UPDATE_FORMS = "/sitemanage/water_survey_site/updateforms";
	
	/*跳转页面*/
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return WATER_SURVEY_JSP;
	}
	
	/*查询地区名称*/
	@RequestMapping("/district")
	@ResponseBody
	public List<WaterTreeMenu> district(){
		List<WaterTreeMenu> treeMenusList = 	waterSurveySiteService.seet();
		return treeMenusList;
	}
	
	/*跳转至增加水质检测项目页面*/
	@RequestMapping("/addForms")
	public String addForms(/*Model model,String areaCode*/){
		
		/*CalCanalInfo  calCanalInfo= calCanalInfoService.findCanalByCode(areaCode);
		
		model.addAttribute("calCanalInfo", calCanalInfo);*/
		
		
		return ADD_FORMS;
	}
	/*跳转至修改页面*/
	@RequestMapping("/updateForms")
	public String updateForms(HttpSession request,String id){
		request.removeAttribute("key");
		request.setAttribute("key", id);
		return UPDATE_FORMS;
	}
	
	//文件上传
	@RequestMapping("/fileUpLoad")
	public JsonResult fileUpLoad(HttpServletRequest request,MultipartFile file) throws Exception{
		String sss = request.getParameter("ruleForm");
		//设置图片名称不能重复UUID
		String picName = UUID.randomUUID().toString();
		//获取文件名称
		String oriName = file.getOriginalFilename();
		//获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));
		//开始上传
		file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
	try{
		WaterSurveySite wss = JSONObject.parseObject(request.getParameter("ruleForm"), WaterSurveySite.class);
			wss.setCreateTime(new Date());
			wss.setElevation(wss.getElevation());
			wss.setLongitudeLatitude(wss.getLongitudeLatitude());
			wss.setMonitorAddress(wss.getMonitorAddress());
			wss.setBuildTime(wss.getBuildTime());
			wss.setWaterImage(picName + extName);
			int i = waterSurveySiteService.insertSelective(wss);
			logger.info("新增提交成功");

//		//站点修改后中间表数据修改
//		BaseUtils baseUtils = new BaseUtils();
//		//根据行政区code获得渠道code
//		baseUtils.updateSiteMiddle("calCanal",wss.getRiverwayCoding(),
//				"site_water_code",wss.getCoding(),request);

		}catch(Exception e){
			logger.error("提交失败:",e);
		}
		return new JsonResult();
	}
	
	//查询数据
	@RequestMapping(value = "/waterData", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String waterData(String id){
		List<WaterSurveySite> waterList = new ArrayList<>();
		try{
//			CalCanalInfo cci = calCanalInfoService.findCanalById(id);
//			if(id!=""||id!=null){
//				getCanalCode(id);
//				canalCodes.add(cci.getCanalCode());
//				waterList = waterSurveySiteService.findRiverwayCoding(canalCodes);
//				canalCodes.clear();
//			}else{
//				throw new RuntimeException();
//			}
            SysArea sa = sysAreaService.selectByPrimaryKey(id);
            getCode(id);
            sysAreaCode.add(sa.getAreaCode());
			waterList = waterSurveySiteService.selectArea(sysAreaCode);
			sysAreaCode.clear();
			logger.info("水质监测数据查询成功");
		}catch(Exception e){
			logger.info("水质监测数据查询失败");
		}
		
//		List<WaterSurveySite> waterList = waterSurveySiteService.findRiverwayCodingJoin(canalCode);
		
		return JSONObject.toJSONString(waterList);
	}
	//删除数据
	@RequestMapping("/waterDelete")
	@ResponseBody
	public JsonResult waterDelete(String id){
		waterSurveySiteService.deleteByPrimaryKey(id);
		return new JsonResult();
	}
	//修改查询页面数据
	@RequestMapping("/waterUpdates")
	@ResponseBody
	public JsonResult waterUpdates(HttpSession request){
		WaterSurveySite waterSurveySite = 	waterSurveySiteService.selectByPrimaryKey(""+request.getAttribute("key"));
		request.removeAttribute("key");
		return new JsonResult(waterSurveySite);
		
	}
	//修改图片
	@RequestMapping("/waterImage")
	@ResponseBody
	public JsonResult waterImage(MultipartFile file,HttpServletRequest request){
		String commodity = request.getParameter("commodity");
		WaterSurveySite wws = JSONObject.parseObject(commodity, WaterSurveySite.class);
		File fils = new File(wws.getWaterImage());
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
				wws.setWaterImage(picName+extName);
				waterSurveySiteService.updateByPrimaryKey(wws);
				logger.info("修改成功:"+oriName);
			}catch(Exception e){
				logger.error("修改失败");
			}
				return new JsonResult();
	}
	//页面加载完成后执行方法
	@RequestMapping("/waterInit")
	@ResponseBody
	public JsonResult waterInit(){
		CalCanalInfo cci = calCanalInfoService.slectMin();
		getCanalCode(cci.getId());
		canalCodes.add(cci.getCanalCode());
		List<WaterSurveySite> waterList = waterSurveySiteService.findRiverwayCoding(canalCodes);
		return new JsonResult(waterList);
	}
	//修改提交按钮
	@RequestMapping("/waterUpdate")
	@ResponseBody
	public JsonResult waterUpdate(String waterUpdate){
		WaterSurveySite wws = JSONObject.parseObject(waterUpdate, WaterSurveySite.class);
			try{
				wws.setMonitorName(wws.getMonitorName());
				wws.setCoding(wws.getCoding());
				wws.setUpdateTime(new Date());
				wws.setElevation(wws.getElevation());
				wws.setLongitudeLatitude(wws.getLongitudeLatitude());
				wws.setWaterGrade(wws.getWaterGrade());
				wws.setMonitorAddress(wws.getMonitorAddress());
				wws.setEquipCoding(wws.getEquipCoding());
				wws.setSimClip(wws.getSimClip());
				wws.setSimClipOperator(wws.getSimClipOperator());
				wws.setBuildTime(wws.getBuildTime());
				waterSurveySiteService.updateByPrimaryKey(wws);
				logger.info("修改成功："+wws.getMonitorName());
			}catch(Exception e){
				logger.error("修改失败",e);
				
			}
		return new JsonResult();
	}
	
	//文件名的随机数
	private String random(){
		StringBuilder sb = new StringBuilder(5);
        for (int i = 0; i <5; i++) {
            char ch = STR.charAt(new Random().nextInt(STR.length()));
            sb.append(ch);
        }
		
		return sb.toString();
	}
	//递归
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
    //行政区递归
    public void getCode(String id){
        List<SysArea> sa = sysAreaService.selectParentId(id);
        if(sa!=null&&sa.size()>0){
            for(SysArea as:sa){
				sysAreaCode.add(as.getAreaCode());
                getCode(as.getId());
            }
        }
    }
}


























