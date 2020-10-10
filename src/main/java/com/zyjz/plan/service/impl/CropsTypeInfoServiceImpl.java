package com.zyjz.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.CropsTypeInfoMapper;
import com.zyjz.plan.entity.CropsTypeInfo;
import com.zyjz.plan.service.CropsTypeInfoService;

/**
 * @ClassName: CropsTypeInfoServiceImpl
 * @Description: 农作物类型service实现
 * @Author: zhaojx
 * @Date: 2018年2月25日 上午9:56:54
 */
@Service("CropsTypeInfoService")
public class CropsTypeInfoServiceImpl implements CropsTypeInfoService{
	
	@Autowired
	private CropsTypeInfoMapper cropsTypeInfoMapper;

	@Override
	public int deleteByPrimaryKey(String ids) {
		int result = 0;
		if(ids != null){
			String[] idArray = ids.split(",");
			for (int i = 0; i < idArray.length; i++) {
				result = cropsTypeInfoMapper.deleteByPrimaryKey(idArray[i]);
			}
		}
		return result;
	}

	@Override
	public int insert(CropsTypeInfo cropsTypeInfo) {
		return cropsTypeInfoMapper.insert(cropsTypeInfo);
	}

	@Override
	public int insertSelective(CropsTypeInfo cropsTypeInfo) {
		return cropsTypeInfoMapper.insertSelective(cropsTypeInfo);
	}

	@Override
	public CropsTypeInfo selectByPrimaryKey(String id) {
		return cropsTypeInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(CropsTypeInfo cropsTypeInfo) {
		return cropsTypeInfoMapper.updateByPrimaryKeySelective(cropsTypeInfo);
	}

	@Override
	public int updateByPrimaryKey(CropsTypeInfo cropsTypeInfo) {
		return cropsTypeInfoMapper.updateByPrimaryKey(cropsTypeInfo);
	}

	@Override
	public List<CropsTypeInfo> getCropsList() {
		return cropsTypeInfoMapper.getCropsList();
	}

	@Override
	public CropsTypeInfo selectBycropsCode(String cropsCode) {
		return cropsTypeInfoMapper.selectBycropsCode(cropsCode);
	}

	@Override
	public List<CropsTypeInfo> findCropsTypeInfoByAreaCodes(
			List<String> areaCodes) {
		return cropsTypeInfoMapper.findCropsTypeInfoByAreaCodes(areaCodes);
	}

	@Override
	public List<CropsTypeInfo> findAreaCodeCropsTypeList(String cropsCode) {
		return cropsTypeInfoMapper.findAreaCodeCropsTypeList(cropsCode);
	}

	@Override
	public CropsTypeInfo findCropsTypeByCode(String cropsCode) {
		return cropsTypeInfoMapper.findCropsTypeByCode(cropsCode);
	}

}