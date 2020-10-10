package com.zyjz.user.dao;

import java.util.List;

import com.zyjz.user.entity.SysRolePermission;

public interface SysRolePermissionMapper {

    int deleteByPrimaryKey(String id);

    int insert(SysRolePermission record);

    int insertSelective(SysRolePermission record);

    SysRolePermission selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysRolePermission record);

    int updateByPrimaryKey(SysRolePermission record);
    
    List<SysRolePermission> findSysRolePermissionByRoleId(String roleId);
    
    List<SysRolePermission> findSysRolePermissionsByRolePermissionIds(List<String> sysRolePermissionIds);
    
    int deleteRolePermissionByRoleId(String roleId); 
    
}