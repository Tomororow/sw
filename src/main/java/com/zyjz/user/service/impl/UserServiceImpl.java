package com.zyjz.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.user.dao.SysUserMapper;
import com.zyjz.user.entity.SysUser;
import com.zyjz.user.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	SysUserMapper sysUserMapper;

	@Override
	public SysUser findSysUserByUserNameAndUserPwd(String userName, String userPwd) {
		return sysUserMapper.findSysUserByUserNameAndUserPwd(userName, userPwd);
	}

	@Override
	public List<SysUser> findAllUser() {
		return sysUserMapper.findAllUser();
	}

	@Override
	public int addSysUser(SysUser sysUser) {
		return sysUserMapper.insertSelective(sysUser);
	}

	@Override
	public SysUser findUserById(String id) {
		return sysUserMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateUser(SysUser sysUser) {
		return sysUserMapper.updateByPrimaryKeySelective(sysUser);
	}

	@Override
	public int deleteUserById(String id) {
		return sysUserMapper.deleteByPrimaryKey(id);
	}

	@Override
	public SysUser selectBySysWaterAreaCode(String waterAreaCode) {
		return sysUserMapper.selectBySysWaterAreaCode(waterAreaCode);
	}

	@Override
	public SysUser getCanalCode(String areaCode, String waterAreaCode) {
		return sysUserMapper.getCanalCode(areaCode,waterAreaCode);
	}
}