package com.zyjz.sitemanage.dao;

import java.util.List;

import com.zyjz.sitemanage.entity.EvaporateSurveySite;

public interface EvaporateSurveySiteMapper {

    int deleteByPrimaryKey(String id);

    int insert(EvaporateSurveySite record);

    int insertSelective(EvaporateSurveySite record);

    EvaporateSurveySite selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(EvaporateSurveySite record);

    int updateByPrimaryKey(EvaporateSurveySite record);
    
    List<EvaporateSurveySite> selectArea(List<String> record);

}