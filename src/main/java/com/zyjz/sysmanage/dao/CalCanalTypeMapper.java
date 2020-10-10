package com.zyjz.sysmanage.dao;


import java.util.List;

import com.zyjz.sysmanage.entity.CalCanalType;

public interface CalCanalTypeMapper {


    int deleteByPrimaryKey(String id);

    int insert(CalCanalType record);

    int insertSelective(CalCanalType record);


    CalCanalType selectByPrimaryKey(String id);
    
    List<CalCanalType> selectAll();

    int updateByPrimaryKeySelective(CalCanalType record);

    int updateByPrimaryKey(CalCanalType record);
    
    
}