package com.zyjz.user.service;

import java.util.List;

import com.zyjz.user.entity.SysRole;

public interface RoleService {
	
	public List<SysRole> findAllRole();
	
	public int addSysRole(SysRole sysRole);
	
	public SysRole findRoleById(String id);
	
	/**
	 * @Title: updateSysRole
	 * @Description: 更新角色
	 * @param: @param sysRole
	 * @param: @return
	 * @return: int
	 * @throws
	 */
	int updateSysRole(SysRole sysRole);
	
	/**
	 * @Title: deleteRoleById
	 * @Description: 更据id删除角色
	 * @param: @param id
	 * @param: @return
	 * @return: int
	 * @throws
	 */
	int deleteRoleById(String id);

}
