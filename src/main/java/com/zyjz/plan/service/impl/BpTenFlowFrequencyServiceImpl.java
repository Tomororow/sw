package com.zyjz.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.BpTenFlowFrequencyMapper;
import com.zyjz.plan.entity.BpTenFlowFrequency;
import com.zyjz.plan.service.BpTenFlowFrequencyService;

@Service("bpTenFlowFrequencyService")
public class BpTenFlowFrequencyServiceImpl implements
		BpTenFlowFrequencyService {

	@Autowired
	private BpTenFlowFrequencyMapper bpTenFlowFrequencyMapper;
	
	@Override
	public int deleteByPrimaryKey(String id) {
		return bpTenFlowFrequencyMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(BpTenFlowFrequency record) {
		return bpTenFlowFrequencyMapper.insert(record);
	}

	@Override
	public int insertSelective(BpTenFlowFrequency record) {
		return bpTenFlowFrequencyMapper.insertSelective(record);
	}

	@Override
	public BpTenFlowFrequency selectByPrimaryKey(String id) {
		return bpTenFlowFrequencyMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(BpTenFlowFrequency record) {
		return bpTenFlowFrequencyMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(BpTenFlowFrequency record) {
		return bpTenFlowFrequencyMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<BpTenFlowFrequency> findBpTenFlowFrequencyByCanalCodes(
			List<String> canalCodes) {
		return bpTenFlowFrequencyMapper.findBpTenFlowFrequencyByCanalCodes(canalCodes);
	}

	

}
