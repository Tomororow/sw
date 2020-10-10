package com.zyjz.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.user.dao.SysRolePermissionMapper;
import com.zyjz.user.entity.SysRolePermission;
import com.zyjz.user.service.RolePermissionService;

@Service("RolePermissionService")
public class RolePermissionServiceImpl implements RolePermissionService {

	@Autowired
	SysRolePermissionMapper sysRolePermissionMapper;
	
	@Override
	public int addSysRolePermission(SysRolePermission sysRolePermission) {
		return sysRolePermissionMapper.insertSelective(sysRolePermission);
	}

	@Override
	public int update(SysRolePermission sysRolePermission) {
		return sysRolePermissionMapper.updateByPrimaryKeySelective(sysRolePermission);
	}

	@Override
	public List<SysRolePermission> findSysRolePermissionByRoleId(String roleId) {
		return sysRolePermissionMapper.findSysRolePermissionByRoleId(roleId);
	}
	
	@Override
	public List<SysRolePermission> findSysRolePermissionsByRolePermissionIds(
			List<String> sysRolePermissionIds) {
		return sysRolePermissionMapper.findSysRolePermissionsByRolePermissionIds(
				sysRolePermissionIds);
	}

	@Override
	public int deleteRolePermissionById(String id) {
		return sysRolePermissionMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteRolePermissionByRoleId(String id) {
		return sysRolePermissionMapper.deleteRolePermissionByRoleId(id);
	}
}