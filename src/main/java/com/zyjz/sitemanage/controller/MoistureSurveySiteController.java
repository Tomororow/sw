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
import com.zyjz.sitemanage.entity.MoistureSurveySite;
import com.zyjz.sitemanage.service.MeteorSurveySiteService;
import com.zyjz.sitemanage.service.MoistureSurveySiteService;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sitemanage.web.MeteorTreeMenu;
import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.utils.controller.BaseUtils;
@Controller
@RequestMapping("/moisture_survey_site")
public class MoistureSurveySiteController {
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(MoistureSurveySite.class); 
	
	@Autowired
	private MoistureSurveySiteService moistureSurveySiteService;
	
	@Autowired
	private MeteorSurveySiteService meteorSurveySiteService;
	
	@Autowired
	private SysAreaService sysAreaService;
	
	private List<String> calCodes = new ArrayList<>();
	
	
	/*return 页面方法集锦*/
	
	private static final String LIST = "/sitemanage/moisture_survey_site/list";
	
	@RequestMapping("/list")
	public String list(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return LIST;
	}
	/*树结构查询方法*/
	@RequestMapping("/selectTree")
	@ResponseBody
	public JsonResult selectTree(){
		List<MeteorTreeMenu> resultList = meteorSurveySiteService.selectTreeImpl();
			return new JsonResult(resultList);
		}
	/*新增数据*/
	@RequestMapping("/insertData")
	public JsonResult insertData(MultipartFile file,HttpServletRequest request){
		String message = "";
		//设置图片名称不能重复UUID
		String picName = UUID.randomUUID().toString();
		//获取文件名称
		String oriName = file.getOriginalFilename();
		//获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));
		int i = 0;
		try{
			//开始上传
			File fil = new File("D:/develop/upload/temp");
			if(!fil.exists()){
				fil.mkdir();
			}
			file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
			MoistureSurveySite mss = JSONObject.parseObject(request.getParameter("moisture"), MoistureSurveySite.class);
			mss.setCreateTime(new Date());
			mss.setMoistureImage(picName+extName);
			i = moistureSurveySiteService.insertSelective(mss);
			logger.info("新增成功："+mss.getMoistureName()+"墒情站");
			message="新增成功！";
		}catch(Exception e){
			logger.error("新增失败",e);
			message="新增失败！";
		}
		return new JsonResult(message);
	}
	//页面表格查询
	@RequestMapping(value = "/selectAll", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String selectAll(String id){
		List<MoistureSurveySite> selectList = null;
		try{
			SysArea sa = sysAreaService.selectByPrimaryKey(id);
			getCode(id);
			calCodes.add(sa.getAreaCode());
			selectList = moistureSurveySiteService.selectArea(calCodes);
			calCodes.clear();
			logger.info("查询墒情站信息成功");
		}catch(Exception e){
			logger.error("查询墒情站信息失败");
		}
		return JSONObject.toJSONString(selectList);
	}
	//删除数据
	@RequestMapping("/deleterow")
	@ResponseBody
	public JsonResult deleterow(HttpServletRequest request){
		String name = null;
		MoistureSurveySite mss = JSONObject.parseObject(request.getParameter("row"), MoistureSurveySite.class);
		name = mss.getMoistureName();
		File file = new File("D:/develop/upload/temp/"+mss.getMoistureImage());
		if(file.exists()){
			file.delete();
		}
		try{
			moistureSurveySiteService.deleteByPrimaryKey(mss.getId());
			logger.info("数据已删除："+name);
		}catch(Exception e){
			logger.error("数据未删除：",e);
		}
		
		return new JsonResult();
	}
	//图片单独修改方法
	@RequestMapping("/updateImage")
	@ResponseBody
	public JsonResult updateImage(MultipartFile file,HttpServletRequest request){
		//设置图片名称不能重复UUID
		String picName = UUID.randomUUID().toString();
		//获取文件名称
		String oriName = file.getOriginalFilename();
		//获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));
		MoistureSurveySite mss = JSONObject.parseObject(request.getParameter("moisture"), MoistureSurveySite.class);
		try{
			File fee = new File("D:/develop/upload/temp/"+mss.getMoistureImage());
			if(fee.exists()){
				fee.delete();
			}
			file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
			mss.setMoistureImage( picName + extName);
			moistureSurveySiteService.updateByPrimaryKey(mss);
			logger.info("图片修改成功："+mss.getMoistureName());
		}catch(Exception e){
			logger.error("图片修改失败：",e);
		}
		
		return new JsonResult();
	}
	//修改数据
	@RequestMapping("/updateData")
	@ResponseBody
	public JsonResult updateData(HttpServletRequest request){
		MoistureSurveySite mss = JSONObject.parseObject(request.getParameter("data"), MoistureSurveySite.class);
		try{
			if("".equals(mss.getMoistureAddress())||mss.getMoistureName()==null){
				mss.setMoistureAddress("");
			}
			moistureSurveySiteService.updateByPrimaryKey(mss);
			logger.info("数据修改成功："+mss.getMoistureName()+"墒情站");
		}catch(Exception e){
			logger.error("数据修改失败：",e);
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
















