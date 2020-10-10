package com.zyjz.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.user.dao.SysRoleMapper;
import com.zyjz.user.entity.SysRole;
import com.zyjz.user.service.RoleService;

@Service("RoleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	SysRoleMapper sysRoleMapper;

	@Override
	public List<SysRole> findAllRole() {
		return sysRoleMapper.findAllRole();
	}

	@Override
	public int addSysRole(SysRole sysRole) {
		return sysRoleMapper.insertSelective(sysRole);
	}

	@Override
	public SysRole findRoleById(String id) {
		return sysRoleMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateSysRole(SysRole sysRole) {
		return sysRoleMapper.updateByPrimaryKeySelective(sysRole);
	}

	@Override
	public int deleteRoleById(String id) {
		return sysRoleMapper.deleteByPrimaryKey(id);
	}
	
}