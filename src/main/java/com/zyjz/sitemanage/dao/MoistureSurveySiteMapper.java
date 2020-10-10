package com.zyjz.sitemanage.dao;


import java.util.List;

import com.zyjz.sitemanage.entity.MoistureSurveySite;

public interface MoistureSurveySiteMapper {


    int deleteByPrimaryKey(String id);

    int insert(MoistureSurveySite record);

    int insertSelective(MoistureSurveySite record);

    MoistureSurveySite selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(MoistureSurveySite record);

    int updateByPrimaryKey(MoistureSurveySite record);
    
    List<MoistureSurveySite> selectArea(List<String> record);

}