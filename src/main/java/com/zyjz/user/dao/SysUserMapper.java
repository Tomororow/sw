package com.zyjz.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.user.entity.SysUser;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

public interface SysUserMapper {

    int deleteByPrimaryKey(String id);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);
    
    SysUser findSysUserByUserNameAndUserPwd(@Param("userName") String userName, @Param("userPwd") String userPwd);
    
    public List<SysUser> findAllUser();

    SysUser selectBySysWaterAreaCode(String waterAreaCode);

    SysUser getCanalCode(@Param("areaCode") String areaCode, @Param("waterAreaCode") String waterAreaCode);
    
}