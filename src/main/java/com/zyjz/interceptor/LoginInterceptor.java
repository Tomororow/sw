package com.zyjz.interceptor;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zyjz.user.entity.SysRolePermission;
import com.zyjz.user.entity.SysUser;
import com.zyjz.user.entity.SysUserRole;
import com.zyjz.user.service.RolePermissionService;
import com.zyjz.user.service.RoleService;
import com.zyjz.user.service.UserRoleService;
import com.zyjz.user.service.UserService;

public class LoginInterceptor implements HandlerInterceptor {

	@Autowired
	UserService userService;
	@Autowired
	UserRoleService userRoleService;
	@Autowired
	RoleService roleService;
	@Autowired
	RolePermissionService rolePermissionService;

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object arg2) throws Exception {
		String url = request.getRequestURI();
		// URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制
		if (url.indexOf("login") >= 0) {
			return true;
		}
		// 获取Session
		HttpSession session = request.getSession();
		SysUser sysUser = (SysUser) session.getAttribute("sysUser");
		if (sysUser != null) {
			List<SysUserRole> userRoleList = userRoleService.findSysUserRoleByUserId(sysUser.getId());

			List<SysRolePermission> sysRolePermissionList = new ArrayList<SysRolePermission>();
			for (int i = 0; i < userRoleList.size(); i++) {
				String roleId = userRoleList.get(i).getRoleId();
				List<SysRolePermission> sysRolePermissionList2 = rolePermissionService.findSysRolePermissionByRoleId(roleId);
				sysRolePermissionList.addAll(sysRolePermissionList2);
			}

			Set<SysRolePermission> set = new HashSet<SysRolePermission>();
			set.addAll(sysRolePermissionList);
			sysRolePermissionList.addAll(set);
			session.setAttribute("sysRolePermissionList", sysRolePermissionList);
			return true;
		}

		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + "/"
				+ request.getContextPath() + "/";
		// 不符合条件的，跳转到登录界面
		response.sendRedirect(basePath + "login/login_page");
		return false;
	}

}