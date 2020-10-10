package com.zyjz.sysmanage.dao;


import java.util.List;

import com.zyjz.sysmanage.entity.CalCanalMaterial;

public interface CalCanalMaterialMapper {


    int deleteByPrimaryKey(String id);

    int insert(CalCanalMaterial record);

    int insertSelective(CalCanalMaterial record);


    CalCanalMaterial selectByPrimaryKey(String id);

    List<CalCanalMaterial> selectAll();

    int updateByPrimaryKeySelective(CalCanalMaterial record);

    int updateByPrimaryKey(CalCanalMaterial record);
}