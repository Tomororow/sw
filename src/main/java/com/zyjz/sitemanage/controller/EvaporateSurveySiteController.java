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
import com.zyjz.sitemanage.entity.EvaporateSurveySite;
import com.zyjz.sitemanage.service.EvaporateSurveySiteService;
import com.zyjz.sitemanage.service.MeteorSurveySiteService;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sitemanage.web.MeteorTreeMenu;
import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.utils.controller.BaseUtils;

@RequestMapping("evaporate_survey_site")
@Controller
public class EvaporateSurveySiteController {
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(EvaporateSurveySite.class); 
	@Autowired
	private EvaporateSurveySiteService evaporateSurveySiteService;
	@Autowired
	private MeteorSurveySiteService meteorSurveySiteService;
	
	@Autowired
	private SysAreaService sysAreaService;
	
	private List<String> calCodes = new ArrayList<>();
	
	private static final String LIST = "/sitemanage/evaporate_survey_site/list";
	
	@RequestMapping("/list")
	public String list(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return LIST;
	}
	//查询树结构
	@RequestMapping("/selectTree")
	@ResponseBody
	public JsonResult selectTree(){
		List<MeteorTreeMenu> resultList = meteorSurveySiteService.selectTreeImpl();
		return new JsonResult(resultList);
	}
	//新增数据提交
	@RequestMapping("/addData")
	@ResponseBody
	public JsonResult addData(MultipartFile file,HttpServletRequest request){
		//设置图片名称不能重复UUID
		String picName = UUID.randomUUID().toString();
		//获取文件名称
		String oriName = file.getOriginalFilename();
		//获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));
		try{
			File fie = new File("D:/develop/upload/temp");
			if(!fie.exists()){
				fie.mkdir();
			}
		file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
		EvaporateSurveySite ess = JSONObject.parseObject(request.getParameter("evaAdd"), EvaporateSurveySite.class);
			ess.setEvaporateImage(picName + extName);
			ess.setCreateTime(new Date());
			evaporateSurveySiteService.insertSelective(ess);
			logger.info("新增数据成功："+ess.getEquipName()+"蒸发站");
		}catch(Exception e){
			logger.error("新增数据失败：",e);
		}
		return new JsonResult();
	}
	//查询蒸发站数据
	@RequestMapping(value = "/selectAll", produces = "text/html; charset=utf-8")
	@ResponseBody
	public String selectAll(String id){
		List<EvaporateSurveySite> list = new ArrayList<>();
		try{
			SysArea sa = sysAreaService.selectByPrimaryKey(id);
			getCode(id);
			calCodes.add(sa.getAreaCode());
			list = evaporateSurveySiteService.selectArea(calCodes);
			calCodes.clear();
			logger.info("蒸发站数据查询成功");
		}catch(Exception e){
			logger.info("蒸发站数据查询失败");
		}
		return JSONObject.toJSONString(list);
	}
	//删除数据
	@RequestMapping("/deleteData")
	@ResponseBody
	public JsonResult deleteData(HttpServletRequest request){
		String name = null;
		EvaporateSurveySite ess = JSONObject.parseObject(request.getParameter("row"), EvaporateSurveySite.class);
		name = ess.getEvaporateName();
		File file = new File("D:/develop/upload/temp/"+ess.getEvaporateImage());
		try{
			if(file.exists()){
				file.delete();
			}
			int i =  evaporateSurveySiteService.deleteByPrimaryKey(ess.getId());
			logger.info("数据已删除："+name+"蒸发站");
		}catch(Exception e){
			logger.error("数据未删除");
		}
		return new JsonResult();
	}
	//修改数据
	@RequestMapping("/updateData")
	@ResponseBody
	public JsonResult updateData(HttpServletRequest request){
		EvaporateSurveySite ess = JSONObject.parseObject(request.getParameter("evaAdd"), EvaporateSurveySite.class);
		try{
			ess.setUpdateTime(new Date());
			evaporateSurveySiteService.updateByPrimaryKey(ess);
			logger.info("数据修改成功："+ess.getEvaporateName()+"蒸发站");
		}catch(Exception e){
			logger.error("数据修改失败：",e);
		}
		return new JsonResult();
	}
	//修改图片
		@RequestMapping("/updateImage")
		@ResponseBody
		public JsonResult updateImage(HttpServletRequest request,MultipartFile file){
			String see = request.getParameter("evaAdd");
			EvaporateSurveySite ess = JSONObject.parseObject(request.getParameter("evaAdd"), EvaporateSurveySite.class);
			File fiee = new File("D:/develop/upload/temp/"+ess.getEvaporateImage());
			if(fiee.exists()){
				fiee.delete();
			}
			//设置图片名称不能重复UUID
			String picName = UUID.randomUUID().toString();
			//获取文件名称
			String oriName = file.getOriginalFilename();
			//获取图片后缀
			String extName = oriName.substring(oriName.lastIndexOf("."));
			try {
				file.transferTo(new File("D:/develop/upload/temp/"+ picName + extName));
				ess.setUpdateTime(new Date());
				ess.setEvaporateImage(picName + extName);
				evaporateSurveySiteService.updateByPrimaryKey(ess);
				logger.info("修改成功："+ess.getEvaporateName()+"蒸发站");
			} catch (Exception e) {
				logger.error("修改失败",e);
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

















