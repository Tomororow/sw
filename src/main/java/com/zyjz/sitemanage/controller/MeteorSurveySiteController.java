package com.zyjz.sitemanage.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.zyjz.sitemanage.entity.MeteorSurveySite;
import com.zyjz.sitemanage.service.MeteorSurveySiteService;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sitemanage.web.MeteorTreeMenu;
import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.utils.controller.BaseUtils;

@Controller
@RequestMapping(value="/meteor_survey_site")
public class MeteorSurveySiteController {
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(MeteorSurveySite.class); 
	
	@Autowired
	private SysAreaService sysAreaService;
	
	@Autowired
	private MeteorSurveySiteService meteorSurveySiteService;
	
	private List<String> calCodes = new ArrayList<>();
	
	//初始页面
	private static final String INDEX_JSP = "/sitemanage/monitor_survey_site/list";
	//初始页面
	@RequestMapping(value="/list")
	public String index(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return INDEX_JSP;
		}
	//树形结构查询方法
	@RequestMapping(value="/selectTree")
	@ResponseBody
	public JsonResult selectTree(){
	List<MeteorTreeMenu> resultList = meteorSurveySiteService.selectTreeImpl();
		return new JsonResult(resultList);
	}
	//表格数据查询
	@RequestMapping(value="/selectTable", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String selectTable(String id){
		List<MeteorSurveySite> mtmList=new ArrayList<>();
		try{
			if(id!=""||id!=null){
				SysArea sa = sysAreaService.selectByPrimaryKey(id);
				getCode(id);
				calCodes.add(sa.getAreaCode());
				mtmList = meteorSurveySiteService.selectAdministrativeCoding(calCodes);
				calCodes.clear();
			}else{
				throw new RuntimeException();
			}
			logger.info("气象站数据查询成功");
		}catch(Exception e){
			logger.info("气象站数据查询失败");
		}
		return JSONObject.toJSONString(mtmList);
	}
	//数据提交上传
	@RequestMapping(value="/submitData")
	@ResponseBody
	public JsonResult submitData(MultipartFile file,HttpServletRequest request){
		//设置图片名称不能重复UUID
		String picName = UUID.randomUUID().toString();
		//获取文件名称
		String oriName = file.getOriginalFilename();
		//获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));
		try{
			//开始上传
			file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
			MeteorSurveySite mss = JSONObject.parseObject(request.getParameter("monitorImport"), MeteorSurveySite.class);
			mss.setMeteorName(mss.getMeteorName());
			mss.setCoding(mss.getCoding());
			mss.setCreateTime(new Date());
			mss.setLongitudeLatitude(mss.getLongitudeLatitude());
			mss.setElevation(mss.getElevation());
			mss.setAdministrativeCoding(mss.getAdministrativeCoding());
			mss.setMonitorAddress(mss.getMonitorAddress());
			mss.setMonitorImage(picName + extName);
			meteorSurveySiteService.insertSelective(mss);
			logger.info("新增成功：" + mss.getMeteorName());
		}catch(Exception e){
			logger.error("新增失败",e);
		}
		return new JsonResult();
	}
	//删除数据
	@RequestMapping(value="/deleteTable")
	@ResponseBody
	public JsonResult deleteTable(String id,String image){
		try{
			File file = new File("D:/develop/upload/temp/"+image);
			if(file.exists()){
				file.delete();
			}
			meteorSurveySiteService.deleteByPrimaryKey(id);
			logger.info("数据删除成功："+id);
		}catch(Exception e){
			logger.error("数据删除失败");
		}
		
		return new JsonResult();
	}
	//修改数据
	@RequestMapping(value="/updateData")
	@ResponseBody
	public JsonResult updateData(String result){
		MeteorSurveySite mms = JSONObject.parseObject(result, MeteorSurveySite.class);
		try{
			mms.setMeteorName(mms.getMeteorName());
			mms.setCoding(mms.getCoding());
			mms.setLongitudeLatitude(mms.getLongitudeLatitude());
			mms.setElevation(mms.getElevation());
			mms.setUpdateTime(new Date());
			mms.setMonitorAddress(mms.getMonitorAddress());
			meteorSurveySiteService.updateByPrimaryKeySelective(mms);
			logger.info("修改成功："+mms.getMeteorName()+"气象站");
		}catch(Exception e){
			logger.error("修改失败",e);
		}
		
		return new JsonResult();
	}
	//updateImage图片单独修改
	@RequestMapping(value="/updateImage")
	@ResponseBody
	public JsonResult updateImage(MultipartFile file,HttpServletRequest request){
		String result = request.getParameter("mapData");
		MeteorSurveySite mms = JSONObject.parseObject(request.getParameter("mapData"), MeteorSurveySite.class);
		File files = new File("D:/develop/upload/temp/"+mms.getMonitorImage());
		if(files.exists()){
			files.delete();
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
			mms.setMonitorImage(picName + extName);
			meteorSurveySiteService.updateByPrimaryKey(mms);
			logger.info("图片单独修改成功："+mms.getMeteorName()+"气象站");
		}catch(Exception e){
			logger.info("图片单独修改失败");
		}
		return new JsonResult();
	}
	//行政区递归
	public void getCode(String id){
		List<SysArea> sa = sysAreaService.selectParentId(id);
		if(sa!=null&&sa.size()>0){
			for(SysArea as:sa){
				calCodes.add(as.getAreaCode());
				getCode(as.getId());
			}
		}
	}

}














