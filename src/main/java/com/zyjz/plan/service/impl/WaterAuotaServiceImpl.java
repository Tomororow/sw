package com.zyjz.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.WaterAuotaMapper;
import com.zyjz.plan.entity.WaterAuota;
import com.zyjz.plan.service.WaterAuotaService;

@Service("WaterAuotaService")
public class WaterAuotaServiceImpl implements WaterAuotaService {
	@Autowired
	WaterAuotaMapper waterAuotaMapper;

	@Override
	public WaterAuota findWaterAuotaBySoilAndCrops(String soilTypeCode,
			String cropsTypeCode) {
		return waterAuotaMapper.findWaterAuotaBySoilAndCrops(soilTypeCode,cropsTypeCode);
	}

	@Override
	public int add(WaterAuota waterAuota) {
		return waterAuotaMapper.insertSelective(waterAuota);
	}

	@Override
	public List<WaterAuota> findAllWaterAuota() {
		return waterAuotaMapper.findAllWaterAuota();
	}

	@Override
	public int insertSelective(WaterAuota record) {
		return waterAuotaMapper.insertSelective(record);
	}

	@Override
	public WaterAuota selectByPrimaryKey(String id) {
		return waterAuotaMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(WaterAuota record) {
		return waterAuotaMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		return waterAuotaMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<WaterAuota> findWaterAuotaByAreaCodes(List<String> areaCodes) {
		return waterAuotaMapper.findWaterAuotaByAreaCodes(areaCodes);
	}

}
