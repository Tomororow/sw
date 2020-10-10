package com.zyjz.user.dao;

import java.util.List;

import com.zyjz.user.entity.SysPermission;
import org.apache.ibatis.annotations.Param;

public interface SysPermissionMapper {

    int deleteByPrimaryKey(String id);

    int insert(SysPermission record);

    int insertSelective(SysPermission record);

    SysPermission selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysPermission record);

    int updateByPrimaryKey(SysPermission record);
    
    List<SysPermission> findAllPermission(); 
    
    List<SysPermission> findPermissionByMenuLevel(int menuLevel);
    
    List<SysPermission> findPermissionByPId(String parentMenuId);
    
    List<SysPermission> findPermissionByIds(List<String> sysPermissionIds);

    List<SysPermission> findMenuList(@Param("roleId") String roleId, @Param("menuLevel")Integer menuLevel);
    
}