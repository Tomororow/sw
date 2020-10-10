package com.zyjz.sysmanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sysmanage.dao.CalCanalMaterialMapper;
import com.zyjz.sysmanage.dao.CalCanalTypeMapper;
import com.zyjz.sysmanage.dao.CalCanalUsetypeMapper;
import com.zyjz.sysmanage.dao.SiteDeviceModelMapper;
import com.zyjz.sysmanage.entity.CalCanalMaterial;
import com.zyjz.sysmanage.entity.CalCanalType;
import com.zyjz.sysmanage.entity.CalCanalUsetype;
import com.zyjz.sysmanage.entity.SiteDeviceModel;
import com.zyjz.sysmanage.service.BaseParamService;

@Service("BaseParamService")
public class BaseParamServiceImpl implements BaseParamService{
	
	@Autowired
	CalCanalMaterialMapper calCanalMaterialMapper;
	
	@Autowired
	CalCanalTypeMapper calCanalTypeMapper;
	
	@Autowired
	CalCanalUsetypeMapper calCanalUsetypeMapper;
	
	@Autowired
	SiteDeviceModelMapper siteDeviceModelMapper;
	

	@Override
	public int addCanalMaterial(CalCanalMaterial calCanalMaterial) {
		return calCanalMaterialMapper.insertSelective(calCanalMaterial);
	}

	@Override
	public List<CalCanalMaterial> findAllCalCanalMaterial() {
		return calCanalMaterialMapper.selectAll();
	}

	@Override
	public int updateCanalMaterial(CalCanalMaterial calCanalMaterial) {
		return calCanalMaterialMapper.updateByPrimaryKeySelective(calCanalMaterial);
	}

	@Override
	public CalCanalMaterial findCalCanalMaterialById(String id) {
		return calCanalMaterialMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteMaterialById(String id) {
		return calCanalMaterialMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int addCanalType(CalCanalType calCanalType) {
		
		return calCanalTypeMapper.insertSelective(calCanalType);
	}

	@Override
	public List<CalCanalType> findAllCalCanalType() {
		return calCanalTypeMapper.selectAll();
	}

	@Override
	public int updateCanalType(CalCanalType calCanalType) {
		return calCanalTypeMapper.updateByPrimaryKeySelective(calCanalType);
	}

	@Override
	public CalCanalType findCalCanalTypeById(String id) {
		return calCanalTypeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteTypeById(String id) {
		return calCanalTypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int addCanalUsetype(CalCanalUsetype calCanalUsetype) {
		return calCanalUsetypeMapper.insertSelective(calCanalUsetype);
	}

	@Override
	public List<CalCanalUsetype> findAllCalCanalUsetype() {
		return calCanalUsetypeMapper.selectAll();
	}

	@Override
	public int updateCanalUsetype(CalCanalUsetype calCanalUsetype) {
		return calCanalUsetypeMapper.updateByPrimaryKeySelective(calCanalUsetype);
	}

	@Override
	public CalCanalUsetype findCalCanalUsetypeById(String id) {
		return calCanalUsetypeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteUseTypeById(String id) {
		return calCanalUsetypeMapper.deleteByPrimaryKey(id);
	}
	
	
	
	

	@Override
	public int addSiteDeviceModel(SiteDeviceModel siteDeviceModel) {
		return siteDeviceModelMapper.insertSelective(siteDeviceModel);
	}

	@Override
	public List<SiteDeviceModel> findAllSiteDeviceModel() {
		return siteDeviceModelMapper.selectAll();
	}

	@Override
	public int updateSiteDeviceModel(SiteDeviceModel siteDeviceModel) {
		return siteDeviceModelMapper.updateByPrimaryKeySelective(siteDeviceModel);
	}

	@Override
	public SiteDeviceModel findSiteDeviceModelById(String id) {
		return siteDeviceModelMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteSiteDeviceModelById(String id) {
		return siteDeviceModelMapper.deleteByPrimaryKey(id);
	}

	@Override
	public SiteDeviceModel selectByDeviceCode(Integer deviceCode) {
		return siteDeviceModelMapper.selectByDeviceCode(deviceCode);
	}
	
	

}
