package com.zyjz.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.user.dao.SysUserRoleMapper;
import com.zyjz.user.entity.SysUserRole;
import com.zyjz.user.service.UserRoleService;

@Service("UserRoleService")
public class UserRoleServiceImpl implements UserRoleService {
	
	@Autowired
	SysUserRoleMapper sysUserRoleMapper;

	@Override
	public int addSysUserRole(SysUserRole sysUserRole) {
		return sysUserRoleMapper.insertSelective(sysUserRole);
	}

	@Override
	public int update(SysUserRole sysUserRole) {
		return sysUserRoleMapper.updateByPrimaryKeySelective(sysUserRole);
	}

	@Override
	public List<SysUserRole> findSysUserRoleByUserId(String userId) {
		return sysUserRoleMapper.findSysUserRoleByUserId(userId);
	}

	@Override
	public int deleteUserRoleById(String id) {
		return sysUserRoleMapper.deleteByPrimaryKey(id);
	}
	
}