package com.zyjz.sysmanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sysmanage.dao.SysDatabaseInfoMapper;
import com.zyjz.sysmanage.entity.SysDatabaseInfo;
import com.zyjz.sysmanage.service.SysDatabaseInfoService;

/**
 * @ClassName: SysDatabaseInfoServiceImpl
 * @Description: 数据提取连接信息service实现
 * @Author: zhaojx
 * @Date: 2018年3月15日 下午4:28:48
 */
@Service("sysDatabaseInfoService")
public class SysDatabaseInfoServiceImpl implements SysDatabaseInfoService{

	@Autowired
	private SysDatabaseInfoMapper sysDatabaseInfoMapper ;
	
	@Override
	public int deleteByPrimaryKey(String id) {
		return sysDatabaseInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(SysDatabaseInfo record) {
		return sysDatabaseInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(SysDatabaseInfo record) {
		return sysDatabaseInfoMapper.insertSelective(record);
	}

	@Override
	public SysDatabaseInfo selectByPrimaryKey(String id) {
		return sysDatabaseInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(SysDatabaseInfo record) {
		return sysDatabaseInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(SysDatabaseInfo record) {
		return sysDatabaseInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<SysDatabaseInfo> getBaseAll() {
		return sysDatabaseInfoMapper.getBaseAll();
	}

}