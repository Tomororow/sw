package com.zyjz.plan.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.zyjz.plan.entity.WaterTreeUser;
import com.zyjz.plan.service.WaterTreeUserService;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.utils.controller.BaseUtils;

@RequestMapping("/water_tree_user")
@Controller
public class WaterTreeUserController {
	
	private static final Logger logger = LoggerFactory.getLogger(WaterTreeUser.class);
	
	private static final String LIST = "/plan/water_tree_user/list";

	private static final String SELECTREE = "/plan/water_tree_user/list";
	
	@Autowired
	private WaterTreeUserService waterTreeUserService;
	
	@RequestMapping("/list")
	public String list(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return LIST;
		
	}
	//查询树结构
	public String selectTree(Model model){
		return SELECTREE;
	}
	//新增数据
	@RequestMapping("/insertData")
	@ResponseBody
	public JsonResult insertData(HttpServletRequest request,String parentId,Double level){
		WaterTreeUser wtu = JSONObject.parseObject(request.getParameter("watesr"), WaterTreeUser.class);
		wtu.setCreationTime(new Date());
		wtu.setParentLevelId(parentId);
		wtu.setTreeLevel(level+1);
		waterTreeUserService.insertSelective(wtu);
		return new JsonResult();
	}
	//查询树结构
	@RequestMapping("/selectTree")
	@ResponseBody
	public JsonResult selectTree(String parentId){
		List<WaterTreeUser> list = null;
			if(parentId==""||parentId==null){
				WaterTreeUser waterTreeUser = waterTreeUserService.selectMin();
				list = waterTreeUserService.selectParentId(waterTreeUser.getId());
			}else{
				list = waterTreeUserService.selectParentId(parentId);
			}
		
		return new JsonResult(list);
	}
	//修改树结构
	@RequestMapping("/updateTree")
	@ResponseBody
	public JsonResult updateTree(HttpServletRequest request){
		WaterTreeUser waterTreeUser = JSONObject.parseObject(request.getParameter("updateData"), WaterTreeUser.class);
		waterTreeUser.setUpdationTime(new Date());
		waterTreeUserService.updateByPrimaryKeySelective(waterTreeUser);
		return new JsonResult();
	}
	//删除树结构
	@RequestMapping("/deleteTree")
	@ResponseBody
	public JsonResult deleteTree(String id){
		waterTreeUserService.deleteByPrimaryKey(id);
		return new JsonResult();
	}
	
	

}
