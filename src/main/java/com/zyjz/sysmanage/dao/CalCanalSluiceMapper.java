package com.zyjz.sysmanage.dao;

import java.util.List;

import com.zyjz.sysmanage.entity.CalCanalSluice;

public interface CalCanalSluiceMapper {

    int deleteByPrimaryKey(String id);

    int insert(CalCanalSluice record);

    int insertSelective(CalCanalSluice record);

    CalCanalSluice selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(CalCanalSluice record);

    int updateByPrimaryKey(CalCanalSluice record);
    
    List<CalCanalSluice> selectCalCanalSluiceByCanalId(String id);
}