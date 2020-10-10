package com.zyjz.sitemanage.dao;

import com.zyjz.sitemanage.entity.WaterSurveySite;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WaterSurveySiteMapper {
    
	List<WaterSurveySite> findIdList(Long id);
	
    int deleteByPrimaryKey(String id);

    int insert(WaterSurveySite record);

    int insertSelective(WaterSurveySite record);

    WaterSurveySite selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WaterSurveySite record);

    int updateByPrimaryKey(WaterSurveySite record);
    
    List<WaterSurveySite> findRiverwayCoding(List<String> code);
    
    List<WaterSurveySite> findRiverwayCodingJoin(String code);

    List<WaterSurveySite> selectArea(List<String> sysAreaCodeList);
}