package com.zyjz.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.SoilsTypeInfoMapper;
import com.zyjz.plan.entity.SoilTypeInfo;
import com.zyjz.plan.service.SoilsTypeInfoService;

/**
 * @ClassName: SoilsTypeInfoServiceImpl
 * @Description: 土地类型service实现
 * @Author: zhaojx
 * @Date: 2018年2月25日 上午9:56:54
 */
@Service("SoilsTypeInfoService")
public class SoilsTypeInfoServiceImpl implements SoilsTypeInfoService{
	
	@Autowired
	private SoilsTypeInfoMapper soilsTypeInfoMapper;

	@Override
	public int deleteByPrimaryKey(String ids) {
		int result = 0;
		if(ids != null){
			String[] idArray = ids.split(",");
			for (int i = 0; i < idArray.length; i++) {
				result = soilsTypeInfoMapper.deleteByPrimaryKey(idArray[i]);
			}
		}
		return result;
	}

	@Override
	public int insert(SoilTypeInfo soilTypeInfo) {
		return soilsTypeInfoMapper.insert(soilTypeInfo);
	}

	@Override
	public int insertSelective(SoilTypeInfo soilTypeInfo) {
		return soilsTypeInfoMapper.insertSelective(soilTypeInfo);
	}

	@Override
	public SoilTypeInfo selectByPrimaryKey(String id) {
		return soilsTypeInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(SoilTypeInfo soilTypeInfo) {
		return soilsTypeInfoMapper.updateByPrimaryKeySelective(soilTypeInfo);
	}

	@Override
	public int updateByPrimaryKey(SoilTypeInfo soilTypeInfo) {
		return soilsTypeInfoMapper.updateByPrimaryKey(soilTypeInfo);
	}

	@Override
	public List<SoilTypeInfo> getSoilsList() {
		return soilsTypeInfoMapper.getSoilsList();
	}

	@Override
	public SoilTypeInfo getSoilName(String id) {
		return soilsTypeInfoMapper.getSoilName(id);
	}

	@Override
	public List<SoilTypeInfo> findSoilTypeByAreaCodes(List<String> areaCodes) {
		return soilsTypeInfoMapper.findSoilTypeByAreaCodes(areaCodes);
	}

	@Override
	public List<SoilTypeInfo> findAreaCropsSoilTypeInfoList(String cropsCode) {
		return soilsTypeInfoMapper.findAreaCropsSoilTypeInfoList(cropsCode);
	}

	@Override
	public SoilTypeInfo findsoilType(String soilType) {
		return soilsTypeInfoMapper.findsoilType(soilType);
	}

}