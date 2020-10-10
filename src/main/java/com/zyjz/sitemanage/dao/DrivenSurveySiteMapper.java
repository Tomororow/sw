package com.zyjz.sitemanage.dao;

import java.util.List;

import com.zyjz.sitemanage.entity.DrivenSurveySite;

public interface DrivenSurveySiteMapper {

    int deleteByPrimaryKey(String id);

    int insert(DrivenSurveySite record);

    int insertSelective(DrivenSurveySite record);

    DrivenSurveySite selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(DrivenSurveySite record);

    int updateByPrimaryKey(DrivenSurveySite record);
    
    List<DrivenSurveySite> selectArea(String code);
}