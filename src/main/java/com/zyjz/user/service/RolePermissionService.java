package com.zyjz.user.service;

import java.util.List;

import com.zyjz.user.entity.SysRolePermission;

public interface RolePermissionService {

	public int addSysRolePermission(SysRolePermission sysRolePermission);

	public int update(SysRolePermission sysRolePermission);

	/**
	 * @Title: findSysRolePermissionsByRoleId
	 * @Description: 更据角色id查询角色权限renww
	 * @param: @param roleId
	 * @param: @return
	 * @return: List<SysRolePermission>
	 * @throws
	 */
	public List<SysRolePermission> findSysRolePermissionByRoleId(String roleId);
	
	/**
	 * @Title: findSysRolePermissionsByRolePermissionIds
	 * @Description: 更据角色权限id集合查角色权限renww
	 * @param: @param sysRolePermissionIds
	 * @param: @return
	 * @return: List<SysRolePermission>
	 * @throws
	 */
	List<SysRolePermission> findSysRolePermissionsByRolePermissionIds(List<String> sysRolePermissionIds);
	
	/**
	 * @Title: deleteRolePermissionById
	 * @Description: 更据id删除renww
	 * @param: @param id
	 * @param: @return
	 * @return: int
	 * @throws
	 */
	int deleteRolePermissionById(String id);
	
	/**
	 * @Title: deleteRolePermissionByRoleId
	 * @Description:更据角色id 删除角色权限
	 * @param: @param id
	 * @param: @return
	 * @return: int
	 * @throws
	 */
	int deleteRolePermissionByRoleId(String id);

}