package com.zyjz.site.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.site.dao.DataSheetMapper;
import com.zyjz.site.entity.DataSheet;
import com.zyjz.site.service.DataSheetService;
@Service("dataSheetService")
public class DataSheetServiceImpl implements DataSheetService {
	
	@Autowired
	private DataSheetMapper dataSheetMapper;

	@Override
	public int deleteByPrimaryKey(String id) {
		
		return dataSheetMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(DataSheet record) {
		
		return dataSheetMapper.insert(record);
	}

	@Override
	public int insertSelective(DataSheet record) {
		
		return dataSheetMapper.insertSelective(record);
	}

	@Override
	public DataSheet selectByPrimaryKey(String id) {
		
		return dataSheetMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(DataSheet record) {
		
		return dataSheetMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(DataSheet record) {
		
		return dataSheetMapper.updateByPrimaryKey(record);
	}

	@Override
	public DataSheet selectCode(String waterCode) {
		return dataSheetMapper.selectCode(waterCode);
	}

	@Override
	public List<DataSheet> selectAll(String year) {
		return dataSheetMapper.selectAll(year);
	}

	@Override
	public DataSheet addUpData(String waterCode) {
		return dataSheetMapper.addUpData(waterCode);
	}

}
