package com.zyjz.sysmanage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sysmanage.dao.SiteRainInfoMapper;
import com.zyjz.sysmanage.entity.SiteRainInfo;
import com.zyjz.sysmanage.service.SiteRainInfoService;

/**
 * @ClassName: SiteRainInfoServiceImpl
 * @Description: 雨量站信息管理service实现
 * @Author: zhaojx
 * @Date: 2018年3月2日 下午5:14:09
 */
@Service("siteRainInfoService")
public class SiteRainInfoServiceImpl implements SiteRainInfoService{
	
	@Autowired
	private SiteRainInfoMapper siteRainInfoMapper;

	@Override
	public int deleteByPrimaryKey(String id) {
		return siteRainInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(SiteRainInfo record) {
		return siteRainInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(SiteRainInfo record) {
		return siteRainInfoMapper.insertSelective(record);
	}

	@Override
	public SiteRainInfo selectByPrimaryKey(String id) {
		return siteRainInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(SiteRainInfo record) {
		return siteRainInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(SiteRainInfo record) {
		return siteRainInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<SiteRainInfo> getRainNameByAreaId(String areaId) {
		return siteRainInfoMapper.getRainNameByAreaId(areaId);
	}

	@Override
	public List<SiteRainInfo> getRainSiteByAreaId(Map<String,Object> params) {
		return siteRainInfoMapper.getRainSiteByAreaId(params);
	}
	

	@Override
	public List<SiteRainInfo> findSiteRainByAreaIds(List<String> areaIds) {
		return siteRainInfoMapper.findSiteRainByAreaIds(areaIds);
	}

}