package com.zyjz.site.controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServlet;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

public class ServletListenerController extends HttpServlet implements ServletContextListener {
    
    private static final long serialVersionUID = -3189203153904874518L;
    //服务器停止时执行该事件
    public void contextDestroyed(ServletContextEvent sce) {
    	
    }
    //服务器启动时执行该事件
    public void contextInitialized(ServletContextEvent sce) {
    	
    }
}