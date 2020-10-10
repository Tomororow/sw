package com.zyjz.plan.controller;

import com.zyjz.sysmanage.entity.SiteWaterInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description: 水库监测
 * @Author: zyjzjs
 * @Date: 2020/7/1
 */
@Controller
@RequestMapping("/reservoir_monitor")
public class ReservoirMonitorController {

    private static final Logger logger = LoggerFactory.getLogger(ReservoirMonitorController.class);

    //水库监测画面路径
    private static final String LIST = "/plan/reservoir_monitor/list";

    /**
     * 水库监测页面
     * @return
     */
    @RequestMapping("/list")
    public String list(){return LIST;}
}
