package com.zyjz.user.dao;

import java.util.List;

import com.zyjz.user.entity.SysRole;

public interface SysRoleMapper {

    int deleteByPrimaryKey(String id);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);
    
    List<SysRole> findAllRole();
    
    
}