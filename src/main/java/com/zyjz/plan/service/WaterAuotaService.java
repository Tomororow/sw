package com.zyjz.plan.service;

import java.util.List;

import com.zyjz.plan.entity.WaterAuota;

public interface WaterAuotaService {
	public WaterAuota findWaterAuotaBySoilAndCrops(String soilTypeCode, String cropsTypeCode);
	public int add(WaterAuota waterAuota);
	
	
	public List<WaterAuota> findAllWaterAuota();
	
	 int insertSelective(WaterAuota record);
	 
	 WaterAuota selectByPrimaryKey(String id);
	 
	 int updateByPrimaryKeySelective(WaterAuota record);
	 
	 int deleteByPrimaryKey(String id);
	 
	 
	public List<WaterAuota> findWaterAuotaByAreaCodes(List<String> areaCodes);
}
