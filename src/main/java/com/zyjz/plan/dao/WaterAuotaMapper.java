package com.zyjz.plan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.plan.entity.WaterAuota;

public interface WaterAuotaMapper {

    int deleteByPrimaryKey(String id);

    int insert(WaterAuota record);

    int insertSelective(WaterAuota record);


    WaterAuota selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(WaterAuota record);

    int updateByPrimaryKey(WaterAuota record);
    
    WaterAuota findWaterAuotaBySoilAndCrops(@Param("soilTypeCode") String soilTypeCode,
                                            @Param("cropsTypeCode") String cropsTypeCode);
    
    
    public List<WaterAuota> findAllWaterAuota();
    
    
    public List<WaterAuota> findWaterAuotaByAreaCodes(List<String> areaCodes);
    
}