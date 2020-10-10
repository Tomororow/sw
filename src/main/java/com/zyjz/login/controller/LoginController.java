package com.zyjz.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import com.zyjz.user.entity.SysPermission;
import com.zyjz.utils.controller.BaseUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zyjz.user.entity.SysUser;
import com.zyjz.user.service.UserService;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	
	@Autowired
	UserService userService;
	
	/** 视图解析页面路径 */
	protected static final String SYS_LOGIN_JSP =  "/login/user_login";
	
	@RequestMapping(value="/login_page")
	public String loginPage(){
		return SYS_LOGIN_JSP;
	}


	@RequestMapping(value="/login")
	public String login(String userName,String userPwd,Model model,HttpServletRequest request){
		if(userName ==null ||userPwd == null ||userName.isEmpty()||userPwd.isEmpty()){
			model.addAttribute("loginMessage", "用户名或密码为空");
			return SYS_LOGIN_JSP;
		}else{
			SysUser sysUser = userService.findSysUserByUserNameAndUserPwd(userName,userPwd);
			if(sysUser!=null){
				//登录成功把用户放到session中
				request.getSession().setAttribute("sysUser", sysUser);
				return "redirect:/login/menuIndex";
			}else{
				model.addAttribute("loginMessage", "用户名或密码错误");
				return SYS_LOGIN_JSP;
			}
		}
	}
	/**
	 * 退出系统
	 * @return
	 */
	@RequestMapping(value="/quitAccount")
	@ResponseBody
	public void quitSysAccount(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("sysUser");
	}
	
	@RequestMapping(value="/layout")
	public String Layout(HttpServletRequest request){
		request.getSession().removeAttribute("sysUser");
		return SYS_LOGIN_JSP;
	}

	/**
	 * 顶部导航栏封装方法
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/headerIndex")
	public ModelAndView headerIndex(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/header");
		HttpSession session = request.getSession();
		SysUser sysUser = (SysUser)session.getAttribute("sysUser");
		mav.addObject("sysUser",sysUser);
		return mav;
	}

	/**
	 * 左侧菜单的分装方法
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/menuIndex")
	public ModelAndView menuIndex(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/menuList");

		return mav;
	}


	/**
	 * 左侧菜单的数据查询方法
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/menuData",produces = "text/html; charset=utf-8")
	@ResponseBody
	public String menuData(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> pageInfo = new HashMap<>();
		HttpSession session = request.getSession();
		BaseUtils baseUtils = new BaseUtils();
		List<SysPermission> menuList = baseUtils.menuData(request,response);
		pageInfo.put("menuList",menuList);pageInfo.put("sysUser",(SysUser)session.getAttribute("sysUser"));
		return JSONObject.toJSONString(pageInfo);
	}

	@RequestMapping(value="/permission_denied")
	public String permissionDeniedPage(){
		return "/permissionDenied";
	}
}
