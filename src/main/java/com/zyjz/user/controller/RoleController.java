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
import com.zyjz.user.entity.SysPermission;
import com.zyjz.user.entity.SysRole;
import com.zyjz.user.entity.SysRolePermission;
import com.zyjz.user.service.PermissionService;
import com.zyjz.user.service.RolePermissionService;
import com.zyjz.user.service.RoleService;
import com.zyjz.utils.controller.BaseUtils;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	RoleService roleService;
	@Autowired
	PermissionService permissionService;
	@Autowired
	RolePermissionService rolePermissionService;
	
	/** 视图解析页面路径 */
	protected static final String SYS_ROLE_JSP =  "/sysmanage/sys_role/list";
	protected static final String ADD_ROLE_JSP =  "/sysmanage/sys_role/add_role";
	protected static final String EDIT_ROLE_JSP =  "/sysmanage/sys_role/edit_role";
	
	@RequestMapping(value="/list")
	public String list(Model model,HttpServletRequest request){
		
//		BaseUtils baseUtils = new BaseUtils();
//		baseUtils.showMenu(model, request, state);
		
		return SYS_ROLE_JSP;
		
	}
	
	@RequestMapping(value="/page")
	public @ResponseBody List<SysRole> page(HttpServletRequest request,
			@RequestParam(required=true,defaultValue="1") Integer page,
            @RequestParam(required=false,defaultValue="3") Integer pageSize){
		//当前点击的区域
		//把当前的区域加入到列表中
			PageHelper.startPage(page, pageSize);
			List<SysRole> list = roleService.findAllRole();
			PageInfo<SysRole> pages = new PageInfo<SysRole>(list);
			request.getSession().setAttribute("sysRolePages", pages);
		
		return list;
	}
	
	
	@RequestMapping(value="/page_nav")
	public @ResponseBody PageInfo<SysRole> pageNav(HttpServletRequest request){
		PageInfo<SysRole> pages = (PageInfo<SysRole>) request.getSession().getAttribute("sysRolePages");
		return pages;
	}
	
	
	/**
	 * @Title: addPage
	 * @Description: 进入添加页面renww
	 * @param: @param model
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add_page")
	public String addPage(Model model){
		List<SysPermission> sysPermissionList = permissionService.findAllPermission();
		model.addAttribute("sysPermissionList", sysPermissionList);
		return ADD_ROLE_JSP;
	}
	
	/**
	 * @Title: add
	 * @Description: 添加角色renww
	 * @param: @param sysRole
	 * @param: @param request
	 * @param: @return
	 * @param: @throws Exception
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add")
	public String add(SysRole sysRole,HttpServletRequest request) throws Exception{
		System.out.println("==================");
		sysRole.setSrCreateTime(new Date());
		int a = roleService.addSysRole(sysRole);
		List<String> sysRolePermissionIds = (List<String>) request.getSession().getAttribute("sysRolePermissionIds");
		//查所有角色权限列表
		List<SysRolePermission> sysRolePermissionList =rolePermissionService.findSysRolePermissionsByRolePermissionIds(sysRolePermissionIds);
		
		
		System.out.println("================================1111"+((List<String>) request.getSession().getAttribute("sysRolePermissionIds")).size());
		SysRolePermission sysRolePermission  = new SysRolePermission();
		for(int i=0;i<sysRolePermissionList.size();i++){
			sysRolePermission = sysRolePermissionList.get(i);
			System.out.println("================================22222"+sysRolePermission.getId());
			sysRolePermission.setRoleId(sysRole.getId());
			int b = rolePermissionService.update(sysRolePermission);
		}
		return "redirect:/role/list";
	}
	
	/**
	 * @Title: addRolePermission
	 * @Description: 添加角色权限renww
	 * @param: @param selectIds
	 * @param: @param request
	 * @param: @return
	 * @param: @throws Exception
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/add_role_permission")
	public @ResponseBody String addRolePermission(@RequestParam(value = "selectIds[]")String[] selectIds,HttpServletRequest request) throws Exception{
		List<String> sysRolePermissionIds = new ArrayList<String>();
		int a=0;
		for(int i=0;i<selectIds.length;i++){
			SysRolePermission sysRolePermission = new SysRolePermission();
			sysRolePermission.setMenuId(selectIds[i]);
			sysRolePermission.setSpCreateTime(new Date());
			a+=rolePermissionService.addSysRolePermission(sysRolePermission);
			sysRolePermissionIds.add(sysRolePermission.getId());
			System.out.println("================================="+sysRolePermission.getId());
		}
		request.getSession().setAttribute("sysRolePermissionIds", sysRolePermissionIds);
		return a+"";
	}
	
	/**
	 * @Title: addPage
	 * @Description: 进入编辑页面renww
	 * @param: @param model
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/edit_page")
	public String editPage(String id,Model model){
		
		//角色回显
		SysRole sysRole = roleService.findRoleById(id);
		model.addAttribute("sysRole", sysRole);
		//角色权限回显
		List<SysRolePermission> sysRolePermissionList =rolePermissionService.findSysRolePermissionByRoleId(id);
		model.addAttribute("sysRolePermissionList", sysRolePermissionList);
		
		List<String> permissionIds = new ArrayList<String>();
		
		for(int i=0;i<sysRolePermissionList.size();i++){
			permissionIds.add(sysRolePermissionList.get(i).getMenuId());
			
		}
		
		//更据权限id集合查询权限(部分回显权限)
		//List<SysPermission> permissionList = permissionService.findPermissionByIds(permissionIds);
		
		model.addAttribute("permissionIds", permissionIds);
		
		//显示权限
		List<SysPermission> sysPermissionList = permissionService.findAllPermission();
		model.addAttribute("sysPermissionList", sysPermissionList);
		
		return EDIT_ROLE_JSP;
	}
	
	
	/**
	 * @Title: edit
	 * @Description: 角色编辑提交renww
	 * @param: @param sysRole
	 * @param: @param request
	 * @param: @return
	 * @param: @throws Exception
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/edit")
	public String edit(SysRole sysRole,HttpServletRequest request) throws Exception{
		
		//角色更新
		sysRole.setSrEditTime(new Date());
		int a = roleService.updateSysRole(sysRole);
		
		
		//拿到编辑后的角色权限id集合
		List<String> sysRolePermissionIds = (List<String>) request.getSession().getAttribute("permissionIds");
		System.out.println(sysRolePermissionIds);
		//后台判断是否有权限的修改
		if(sysRolePermissionIds!=null){//角色权限修改后才进入
			//拿到此角色已有的权限
			List<SysRolePermission> sysRolePermissionList = rolePermissionService.findSysRolePermissionByRoleId(sysRole.getId());
			//删除原来的角色权限
			for(int i=0;i<sysRolePermissionList.size();i++){
				 rolePermissionService.deleteRolePermissionById(sysRolePermissionList.get(i).getId());
			}
			//拿到后清空
			request.getSession().setAttribute("permissionIds",null);
			//查所有角色权限列表
			List<SysRolePermission> sysRolePermissionList2 =rolePermissionService.findSysRolePermissionsByRolePermissionIds(sysRolePermissionIds);
			
			//将角色id更新到角色权限表中
			SysRolePermission sysRolePermission  = new SysRolePermission();
			for(int i=0;i<sysRolePermissionList2.size();i++){
				sysRolePermission = sysRolePermissionList2.get(i);
				sysRolePermission.setRoleId(sysRole.getId());
				int b = rolePermissionService.update(sysRolePermission);
			}
		}
		return "redirect:/role/list";
	}
	
	/**
	 * @Title: editRolePermission
	 * @Description: 角色权限编辑提交renww
	 * @param: @param selectIds
	 * @param: @param request
	 * @param: @return
	 * @param: @throws Exception
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/edit_role_permission")
	public @ResponseBody String editRolePermission(@RequestParam(value = "selectIds[]")String[] selectIds,HttpServletRequest request) throws Exception{
		List<String> sysRolePermissionIds = new ArrayList<String>();
		int a=0;
		for(int i=0;i<selectIds.length;i++){
			SysRolePermission sysRolePermission = new SysRolePermission();
			sysRolePermission.setMenuId(selectIds[i]);
			sysRolePermission.setSpCreateTime(new Date());
			a+=rolePermissionService.addSysRolePermission(sysRolePermission);
			sysRolePermissionIds.add(sysRolePermission.getId());
		}
		request.getSession().setAttribute("permissionIds", sysRolePermissionIds);
		
		return a+"";
	}
	
	/**
	 * @Title: delete
	 * @Description: 角色删除
	 * @param: @return
	 * @return: String
	 * @throws
	 */
	@RequestMapping(value="/delete")
	public @ResponseBody String delete(String id){
		//先删除角色
		int a = roleService.deleteRoleById(id);
		//删除角色对应的角色权限表
		//查出角色id对应的角色权限表
		List<SysRolePermission> sysRolePermissionList = rolePermissionService.findSysRolePermissionByRoleId(id);
		
		for(int i=0;i<sysRolePermissionList.size();i++){
			rolePermissionService.deleteRolePermissionById(sysRolePermissionList.get(i).getId());
		}
		
		//int b = rolePermissionService.deleteRolePermissionByRoleId(id);
		
		return a+"";
	}
	
}
