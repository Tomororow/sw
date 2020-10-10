package com.zyjz.user.dao;

import java.util.List;

import com.zyjz.user.entity.SysUserRole;

public interface SysUserRoleMapper {

    int deleteByPrimaryKey(String id);

    int insert(SysUserRole record);

    int insertSelective(SysUserRole record);

    SysUserRole selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysUserRole record);

    int updateByPrimaryKey(SysUserRole record);
    
    List<SysUserRole> findSysUserRoleByUserId(String userId);
}