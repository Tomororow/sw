package com.zyjz.user.service;

import java.util.List;

import com.zyjz.user.entity.SysUserRole;

public interface UserRoleService {

	public int addSysUserRole(SysUserRole sysUserRole);

	public int update(SysUserRole sysUserRole);

	public List<SysUserRole> findSysUserRoleByUserId(String userId);
	
	/**
	 * @Title: deleteUserRoleById
	 * @Description: 根据id删除
	 * @param: @param id
	 * @param: @return
	 * @return: int
	 * @throws
	 */
	int deleteUserRoleById(String id);

}