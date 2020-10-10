package com.zyjz.sitemanage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyjz.sitemanage.entity.DrivenSurveySite;
import com.zyjz.sitemanage.service.DrivenSurveySiteService;
import com.zyjz.sitemanage.service.MeteorSurveySiteService;
import com.zyjz.sitemanage.web.JsonResult;
import com.zyjz.sitemanage.web.MeteorTreeMenu;
import com.zyjz.utils.controller.BaseUtils;

@RequestMapping("/driven_survey_site")
@Controller
public class DrivenSurveySiteController {
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(DrivenSurveySite.class);
	
	private static final String LIST = "/sitemanage/driven_survey_site/list";
	@Autowired
	private DrivenSurveySiteService drivenSurveySiteService;
	
	@Autowired
	private MeteorSurveySiteService meteorSurveySiteService;
	
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
	
}
