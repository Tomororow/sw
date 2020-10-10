package com.zyjz.sysmanage.dao;


import java.util.List;

import com.zyjz.sysmanage.entity.CalCanalUsetype;

public interface CalCanalUsetypeMapper {

    int deleteByPrimaryKey(String id);

    int insert(CalCanalUsetype record);

    int insertSelective(CalCanalUsetype record);


    CalCanalUsetype selectByPrimaryKey(String id);
    List<CalCanalUsetype> selectAll();


    int updateByPrimaryKeySelective(CalCanalUsetype record);

    int updateByPrimaryKey(CalCanalUsetype record);
}