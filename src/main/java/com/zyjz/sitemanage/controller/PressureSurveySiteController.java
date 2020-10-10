package com.zyjz.sitemanage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zyjz.sitemanage.service.WaterSurveySiteService;
import com.zyjz.sitemanage.web.WaterTreeMenu;
import com.zyjz.utils.controller.BaseUtils;

@RequestMapping("/pressure_survey_site")
@Controller
public class PressureSurveySiteController
{
    private static final String WATER_SURVEY_JSP = "/sitemanage/pressure_survey_site/list";
    
    @Autowired
    private WaterSurveySiteService waterSurveySiteService;
    
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
        List<WaterTreeMenu> treeMenusList = waterSurveySiteService.seet();
        return treeMenusList;
    }
}
