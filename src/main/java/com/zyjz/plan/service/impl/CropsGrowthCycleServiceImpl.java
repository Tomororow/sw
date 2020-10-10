package com.zyjz.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.CropsGrowthCycleMapper;
import com.zyjz.plan.entity.CropsGrowthCycle;
import com.zyjz.plan.service.CropsGrowthCycleService;

/**
 * @ClassName: CropsGrowthCycleServiceImpl
 * @Description: 农作物生长周期service实现
 * @Author: zhaojx
 * @Date: 2018年2月28日 下午5:44:15
 */
@Service("CropsGrowthCycleService")
public class CropsGrowthCycleServiceImpl implements CropsGrowthCycleService{
	
	@Autowired
	private CropsGrowthCycleMapper cropsGrowthCycleMapper;

	@Override
	public int deleteByPrimaryKey(String ids) {
		int result = 0;
		if(ids != null){
			String[] idArray = ids.split(",");
			for (int i = 0; i < idArray.length; i++) {
				result = cropsGrowthCycleMapper.deleteByPrimaryKey(idArray[i]);
			}
		}
		return result;
	}

	@Override
	public int insert(CropsGrowthCycle cropsGrowthCycle) {
		return cropsGrowthCycleMapper.insert(cropsGrowthCycle);
	}

	@Override
	public int insertSelective(CropsGrowthCycle cropsGrowthCycle) {
		return cropsGrowthCycleMapper.insertSelective(cropsGrowthCycle);
	}

	@Override
	public CropsGrowthCycle selectByPrimaryKey(String id) {
		return cropsGrowthCycleMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(CropsGrowthCycle cropsGrowthCycle) {
		return cropsGrowthCycleMapper.updateByPrimaryKeySelective(cropsGrowthCycle);
	}

	@Override
	public int updateByPrimaryKey(CropsGrowthCycle cropsGrowthCycle) {
		return cropsGrowthCycleMapper.updateByPrimaryKey(cropsGrowthCycle);
	}

	@Override
	public List<CropsGrowthCycle> getCropsCycleList() {
		return cropsGrowthCycleMapper.getCropsCycleList();
	}

	@Override
	public CropsGrowthCycle getCycleNameList(String id) {
		return cropsGrowthCycleMapper.getCycleNameList(id);
	}

	@Override
	public List<CropsGrowthCycle> findCropsGrowthByAreaCodes(
			List<String> areaCodes) {
		return cropsGrowthCycleMapper.findCropsGrowthByAreaCodes(areaCodes);
	}

	@Override
	public List<CropsGrowthCycle> findAreaCropsGrowthCycleList(String cropsCode) {
		return cropsGrowthCycleMapper.findAreaCropsGrowthCycleList(cropsCode);
	}

	@Override
	public List<CropsGrowthCycle> findCropsTypeIdGrowthCycleList(
			String cropsTypeId) {
		return cropsGrowthCycleMapper.findCropsTypeIdGrowthCycleList(cropsTypeId);
	}

	@Override
	public List<CropsGrowthCycle> findGrowthCycleBy_soilType_cropsType(
			 String cropsType,String soilType) {
		return cropsGrowthCycleMapper.findGrowthCycleBy_soilType_cropsType(cropsType,soilType);
	}

}