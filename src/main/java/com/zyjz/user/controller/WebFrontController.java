package com.zyjz.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zyjz.user.entity.SysPermissionVO;
import com.zyjz.user.service.PermissionService;


@Controller
@RequestMapping(value="/web_front")
public class WebFrontController {
	@Autowired
	PermissionService permissionService;
	
	protected static final String MENU_JSP =  "/menu";
	
	@RequestMapping(value="/list")
	public String list(Model model){
		System.out.println("==========================8989");
		// 管理员信息
		//UserVO user = userService.getById(SingletonLoginUtils.getUserId());
		//model.addAttribute("user", user);
		// 系统目录
		List<SysPermissionVO> sysPermissionVOList = permissionService.findAllPermissionVO();
		//roleMenuService.listByUserId(SingletonLoginUtils.getUserId(), StatusEnum.NORMAL.getStatus());
		model.addAttribute("sysPermissionVOList", sysPermissionVOList);
		System.out.println("===========================101010");
		return MENU_JSP;
	}
	
}
