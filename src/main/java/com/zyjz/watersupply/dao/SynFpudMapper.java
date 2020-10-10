package com.zyjz.watersupply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.watersupply.entity.SynFpud;

public interface SynFpudMapper {


    int deleteByPrimaryKey(String id);

    int insert(SynFpud record);

    int insertSelective(SynFpud record);

    SynFpud selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SynFpud record);

    int updateByPrimaryKey(SynFpud record);
    
	List<SynFpud> selectSysareaId(String id);
	
}