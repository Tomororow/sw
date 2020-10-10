package com.zyjz.utils;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.zyjz.user.entity.SysPermission;
import com.zyjz.user.entity.SysPermissionVO;
import com.zyjz.user.entity.SysRolePermission;
import com.zyjz.user.entity.SysUser;
import com.zyjz.user.entity.SysUserRole;
import com.zyjz.user.service.PermissionService;
import com.zyjz.user.service.RolePermissionService;
import com.zyjz.user.service.UserRoleService;
/**
 * @ClassName: BaseUtils
 * @Description: 页面分类公共类
 * @Author: renww
 * @Date: 2018年3月28日 上午10:29:03
 */

public class BaseUtils{
	
	@Autowired
	private static UserRoleService userRoleService;
	@Autowired
	private static RolePermissionService rolePermissionService;
	@Autowired
	private static PermissionService permissionService;
	
	private static BaseUtils baseUtils;
	
	
	@PostConstruct     //关键二   通过@PostConstruct 和 @PreDestroy 方法 实现初始化和销毁bean之前进行的操作
    public void init() {  
		baseUtils = this;  
		baseUtils.userRoleService = this.userRoleService;   // 初使化时将已静态化的testService实例化
    }  
	
	
	/**
	 * @Title: showMenu
	 * @Description: 主要方法renww
	 * @param: @param model
	 * @param: @param request
	 * @return: void
	 * @throws
	 */
	public void showMenu(Model model,HttpServletRequest request,int state){
		
		//加载导航页面
		SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
		System.out.println("==========================444============================="+sysUser.getId());
		List<SysUserRole> sysUserRoleList = userRoleService.findSysUserRoleByUserId(sysUser.getId());
		
		//目前用户和角色关系一对一所以只去第一条
		List<SysRolePermission> sysRolePermissionList = rolePermissionService.findSysRolePermissionByRoleId(sysUserRoleList.get(0).getRoleId());
		
		sysRolePermissionList = menuDereplication(sysRolePermissionList);// 去重
		
		List<SysPermission> sysPermissionList = new ArrayList<SysPermission>();//此用户所有的权限
		List<SysPermission> sysPermissionList2 = new ArrayList<SysPermission>();//一级目录权限
		for(int i=0;i<sysRolePermissionList.size();i++){
			SysPermission sysPermission = permissionService.findPermissionById(sysRolePermissionList.get(i).getMenuId());
			System.out.println("========================="+sysPermission.getMenuName()+"==="+sysPermission.getMenuLevel());
			
			//判断选中状态
			if(sysPermission.getMenuCode()==state){
				//将此页面二级权限的code传过去，来判断是否选中
				model.addAttribute("twoMenuCode", sysPermission.getMenuCode());
				//拿一级权限的code
				SysPermission  pSysPermission = permissionService.findPermissionById(sysPermission.getParentMenuId());
				model.addAttribute("oneMenuCode", pSysPermission.getMenuCode());
				
			}
			if(sysPermission.getMenuLevel()==1){
				sysPermissionList2.add(sysPermission);
			}
			sysPermissionList.add(sysPermission);
		}
		
		
		//包装权限类
		List<SysPermissionVO> sysPermissionVOList = new ArrayList<>();
		for(int i=0;i<sysPermissionList2.size();i++){
			System.out.println("================================================="+sysPermissionList2.get(i).getMenuHref());
			SysPermissionVO sysPermissionVO = new SysPermissionVO();
			BeanUtils.copyProperties(sysPermissionList2.get(i), sysPermissionVO);
			
			List<SysPermission> sysPermissionList3 = permissionService.findPermissionByPId(sysPermissionList2.get(i).getId());
			for(int j=0;j<sysPermissionList3.size();j++){
				System.out.println("================================================="+sysPermissionList3.get(j).getMenuHref());
			}
			sysPermissionVO.setSysChildsPermissions(sysPermissionList3);
			sysPermissionVOList.add(sysPermissionVO);
			
		}
		model.addAttribute("sysPermissionVOList", sysPermissionVOList);
	}
	/**
	 * 权限去重 （
	 * @param sourceRoleMenuVOs 原权限
	 * @return
	 */
	private List<SysRolePermission> menuDereplication(List<SysRolePermission> sysRolePermissionList) {
		List<SysRolePermission> sysRolePermissionList2 = new ArrayList<>();
		for (SysRolePermission sysRolePermission : sysRolePermissionList) {
			if (!sysRolePermissionList2.contains(sysRolePermission)) {
				sysRolePermissionList2.add(sysRolePermission);
			}
		}
		return sysRolePermissionList2;
	}
}
