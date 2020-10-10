package com.zyjz.sitemanage.dao;

import java.util.List;

import com.zyjz.sitemanage.entity.MeteorSurveySite;


public interface MeteorSurveySiteMapper {
   
    int deleteByPrimaryKey(String id);

    int insert(MeteorSurveySite record);

    int insertSelective(MeteorSurveySite record);

    MeteorSurveySite selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(MeteorSurveySite record);

    int updateByPrimaryKey(MeteorSurveySite record);
    
    List<MeteorSurveySite> selectAdministrativeCoding(List<String> code);
}