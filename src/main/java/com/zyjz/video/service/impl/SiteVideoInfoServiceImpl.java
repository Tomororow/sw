package com.zyjz.video.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.video.dao.SiteVideoInfoMapper;
import com.zyjz.video.entity.SiteVideoInfo;
import com.zyjz.video.service.SiteVideoInfoService;

/**
 * @ClassName: SiteVideoInfoServiceImpl
 * @Description: 视频站点管理service实现
 * @Author: zhaojx
 * @Date: 2018年3月9日 下午4:22:13
 */
@Service("siteVideoInfoService")
public class SiteVideoInfoServiceImpl implements SiteVideoInfoService{
	
	@Autowired
	private SiteVideoInfoMapper siteVideoInfoMapper;

	@Override
	public int deleteByPrimaryKey(String id) {
		return siteVideoInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(SiteVideoInfo record) {
		return siteVideoInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(SiteVideoInfo record) {
		return siteVideoInfoMapper.insertSelective(record);
	}

	@Override
	public SiteVideoInfo selectByPrimaryKey(String id) {
		return siteVideoInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(SiteVideoInfo record) {
		return siteVideoInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(SiteVideoInfo record) {
		return siteVideoInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<SiteVideoInfo> getVideosByCanalCode(String canalCode) {
		return siteVideoInfoMapper.getVideosByCanalCode(canalCode);
	}

	@Override
	public List<SiteVideoInfo> findSiteVideoByCanalCodes(List<String> canalCodes) {
		return siteVideoInfoMapper.findSiteVideoByCanalCodes(canalCodes);
	}

	@Override
	public List<SiteVideoInfo> findSiteVideoByCanalCodeJoin(String canalCode) {
		return siteVideoInfoMapper.findSiteVideoByCanalCodeJoin(canalCode);
	}


	@Override
	public SiteVideoInfo byDeviceSerialInfo(String deviceSerial) {
		return siteVideoInfoMapper.byDeviceSerialInfo(deviceSerial);
	}

	@Override
	public int updateAccessToken(String accesstoken) {
		System.out.println("=================updateAccessToken=============");
		return siteVideoInfoMapper.updateAccessToken(accesstoken);
	}

	@Override
	public SiteVideoInfo getVideoInfoBySviCanalCode(String sviCanalCode) {
		return siteVideoInfoMapper.getVideoInfoBySviCanalCode(sviCanalCode);
	}

	@Override
	public String getExistingAccessToken() {
		return siteVideoInfoMapper.getExistingAccessToken();
	}

	@Override
	public List<SiteVideoInfo> findAllSiteVideoInfo() {
		return siteVideoInfoMapper.findAllSiteVideoInfo();
	}
}