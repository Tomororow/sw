package com.zyjz.user.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.entity.SysWaterArea;
import com.zyjz.sysmanage.service.SysAreaService;
import com.zyjz.sysmanage.service.SysWaterAreaService;
import com.zyjz.user.service.PermissionService;
import com.zyjz.user.service.RolePermissionService;
import com.zyjz.user.service.RoleService;
import com.zyjz.user.service.UserRoleService;
import com.zyjz.user.service.UserService;
import com.zyjz.user.entity.SysRole;
import com.zyjz.user.entity.SysUser;
import com.zyjz.user.entity.SysUserRole;
import com.zyjz.utils.controller.BaseUtils;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	UserService userService;
	@Autowired
	RoleService roleService;
	
	@Autowired
	UserRoleService userRoleService;
	
	@Autowired
	SysWaterAreaService sysWaterAreaService;
	
	@Autowired
	SysAreaService sysAreaService;
	
	@Autowired
	PermissionService permissionService;
	
	@Autowired
	RolePermissionService rolePermissionService;
	
	/** 视图解析页面路径 */
	protected static final String SYS_USER_JSP =  "/sysmanage/sys_user/list";
	protected static final String ADD_USER_JSP =  "/sysmanage/sys_user/add_user";
	protected static final String EDIT_USER_JSP =  "/sysmanage/sys_user/edit_user";

	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request,int state){
		BaseUtils baseUtils = new BaseUtils();
		baseUtils.showMenu(model, request, state);
		return SYS_USER_JSP;
	}
	
	
	
	
	
	@RequestMapping(value="/page")
	public @ResponseBody List<SysUser> page(HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="10") Integer pageSize){
		//当前点击的区域
		//把当前的区域加入到列表中
			PageHelper.startPage(page, pageSize);
			List<SysUser> list = userService.findAllUser();
			PageInfo<SysUser> pages = new PageInfo<SysUser>(list);
			request.getSession().setAttribute("sysUserPages", pages);
		
		return list;
	}
	
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<SysUser> pageNav(HttpServletRequest request){
		PageInfo<SysUser> pages = (PageInfo<SysUser>) request.getSession().getAttribute("sysUserPages");
		return pages;
	}
	
	@RequestMapping(value="/add_page")
	public String addPage(Model model){
		List<SysRole> roleList = roleService.findAllRole();
		model.addAttribute("roleList", roleList);
		
		List<SysArea> sysAreaList = sysAreaService.findAreaByLevel(0);
		model.addAttribute("sysAreaList", sysAreaList);
		
		List<SysWaterArea> sysWaterAreaList = sysWaterAreaService.findWaterAreaByLevel(0);
		model.addAttribute("sysWaterAreaList", sysWaterAreaList);
		return ADD_USER_JSP;
	}
	
	@RequestMapping(value="/add")
	public String add(SysUser sysUser,HttpServletRequest request) throws Exception{
		System.out.println("11111111111111111111111111111111");
		sysUser.setSuCreateTime(new Date());
		int a = userService.addSysUser(sysUser);
		List<SysUserRole> sysUserRoleList = (List<SysUserRole>) request.getSession().getAttribute("sysUserRoleList");
		
		for(int i=0;i<sysUserRoleList.size();i++){
			SysUserRole sysUserRole  = new SysUserRole();
			sysUserRole = sysUserRoleList.get(i);
			sysUserRole.setUserId(sysUser.getId());
			int b = userRoleService.update(sysUserRole);
		}
		return "redirect:/user/list?state=74";
	}
	
	@RequestMapping(value="/add_user_role")
	public @ResponseBody String addUserRole(String roleId,HttpServletRequest request) throws Exception{
		System.out.println("11111222333444=====================");
		List<SysUserRole> sysUserRoleList = new ArrayList<SysUserRole>();
//		int a=0;
//		for(int i=0;i<roleIds.length;i++){
//			SysUserRole sysUserRole = new SysUserRole();
//			//sysRolePermission.setRoleId(roleId);
//			sysUserRole.setRoleId(roleIds[i]);
//			sysUserRole.setSurCreateTime(new Date());
//			a+=userRoleService.addSysUserRole(sysUserRole);
//			sysUserRoleList.add(sysUserRole);
//		}

		SysUserRole sysUserRole = new SysUserRole();
		//sysRolePermission.setRoleId(roleId);
		sysUserRole.setRoleId(roleId);
		sysUserRole.setSurCreateTime(new Date());
		int a = userRoleService.addSysUserRole(sysUserRole);
		sysUserRoleList.add(sysUserRole);
		request.getSession().setAttribute("sysUserRoleList", sysUserRoleList);
		return a+"";
	}
	
	/**
	 * @Title: addReservoirPage
	 * @Description: 进入用户编辑页面renww
	 * @param: @param model
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/edit_page")
	public String editPage(String id,Model model){
		
		SysUser sysUser = userService.findUserById(id);
		model.addAttribute("sysUser", sysUser);
		
		String areaCode = sysUser.getSysareaCode();
		String waterAreaCode = sysUser.getSyswaterareaCode();
		
		
		SysWaterArea sysWaterArea = sysWaterAreaService.findWaterAreaBySyswaterareaCode(waterAreaCode);
		
		
		String waterAreaNames ="{=="+sysWaterArea.getWaterAreaLevel()+":"+sysWaterArea.getWaterAreaName()+"==}";
		String parentWaterareaId = sysWaterArea.getParentWaterareaId();
		int sysWaterAreaLevel = sysWaterArea.getWaterAreaLevel();
		for(int i=0;i<sysWaterAreaLevel;i++){
			SysWaterArea pSysWaterArea = sysWaterAreaService.findWaterAreaById(parentWaterareaId);
			if(pSysWaterArea!=null){
				waterAreaNames="{=="+pSysWaterArea.getWaterAreaLevel()+":"+pSysWaterArea.getWaterAreaName()+"==}"+waterAreaNames;
				parentWaterareaId=pSysWaterArea.getParentWaterareaId();
			}
		}
		model.addAttribute("waterAreaNames", waterAreaNames);
		
		SysArea sysArea = sysAreaService.findAreaBySysareaCode(areaCode);
		
		String areaNames ="{=="+sysArea.getAreaLevel()+":"+sysArea.getAreaName()+"==}";
		String parentAreaId = sysArea.getParentAreaId();
		int sysAreaLevel = sysArea.getAreaLevel();
		for(int i=0;i<sysAreaLevel;i++){
			SysArea pSysArea = sysAreaService.findAreaById(parentAreaId);
			if(pSysArea!=null){
				areaNames="{=="+pSysArea.getAreaLevel()+":"+pSysArea.getAreaName()+"==}"+areaNames;
				parentAreaId=pSysArea.getParentAreaId();
			}
		}
		
		model.addAttribute("areaNames",areaNames);
		
		//下拉框信息
		List<SysRole> roleList = roleService.findAllRole();
		model.addAttribute("roleList", roleList);

		List<SysArea> sysAreaList = sysAreaService.findAreaByLevel(0);
		model.addAttribute("sysAreaList", sysAreaList);
		
		List<SysWaterArea> sysWaterAreaList = sysWaterAreaService.findWaterAreaByLevel(0);
		model.addAttribute("sysWaterAreaList", sysWaterAreaList);
		
		//用户角色回显
		
		List<SysUserRole> sysUserRoleList = userRoleService.findSysUserRoleByUserId(id);
		model.addAttribute("sysUserRoleList", sysUserRoleList);
		
		
		
		return EDIT_USER_JSP;
	}
	
	
	
	@RequestMapping(value="/edit")
	public String edit(SysUser sysUser,HttpServletRequest request) throws Exception{
		System.out.println("==========================================111111111111111"+sysUser.getId());
		sysUser.setSuCreateTime(new Date());
		int a = userService.updateUser(sysUser);
		
		
		//拿到此用户已有的角色
		List<SysUserRole> sysUserRoleList = userRoleService.findSysUserRoleByUserId(sysUser.getId());
		//删除原来的用户角色
		for(int i=0;i<sysUserRoleList.size();i++){
			userRoleService.deleteUserRoleById(sysUserRoleList.get(i).getId());
		}
		
		//拿到编辑后的用户角色
		List<SysUserRole> sysUserRoleList2 = (List<SysUserRole>) request.getSession().getAttribute("sysUserRoleList");
		
		for(int i=0;i<sysUserRoleList2.size();i++){
			SysUserRole sysUserRole  = new SysUserRole();
			sysUserRole = sysUserRoleList2.get(i);
			
			System.out.println("========================================================="+sysUser.getId());
			
			sysUserRole.setUserId(sysUser.getId());
			int b = userRoleService.update(sysUserRole);
		}
		return "redirect:/user/list?state=74";
	}
	
	@RequestMapping(value="/edit_user_role")
	public @ResponseBody String editUserRole(@RequestParam(value = "roleIds[]")String[] roleIds,HttpServletRequest request) throws Exception{
		
		List<SysUserRole> sysUserRoleList = new ArrayList<SysUserRole>();
		int a=0;
		
		for(int i=0;i<roleIds.length;i++){
			SysUserRole sysUserRole = new SysUserRole();
			//sysRolePermission.setRoleId(roleId);
			sysUserRole.setRoleId(roleIds[i]);
			sysUserRole.setSurCreateTime(new Date());
			a+=userRoleService.addSysUserRole(sysUserRole);
			sysUserRoleList.add(sysUserRole);
		}
		request.getSession().setAttribute("sysUserRoleList", sysUserRoleList);
		return a+"";
	}
	
	/**
	 * @Title: delete
	 * @Description: 用户删除
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id){
		//先删除角色
		int a = userService.deleteUserById(id);
		System.out.println("=================================================222");
		
		//删除用户对应用户角色表
		//查出用户id对应的用户角色表
		List<SysUserRole> sysUserRoleList = userRoleService.findSysUserRoleByUserId(id);
		
		for(int i=0;i<sysUserRoleList.size();i++){
			userRoleService.deleteUserRoleById(sysUserRoleList.get(i).getId());
		}
		
		//int b = rolePermissionService.deleteRolePermissionByRoleId(id);
		
		System.out.println("=================================================333");
		
		return a+"";
	}

	@RequestMapping(value = "/getCanalCode")
	public @ResponseBody String getCanalCode(String areaCode, String waterAreaCode){
		SysUser sysUser = userService.getCanalCode(areaCode, waterAreaCode);
		if(sysUser == null){
			return "";
		}
		return sysUser.getCanalCode();
	}
}