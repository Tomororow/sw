package com.zyjz.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.plan.dao.ConsumerSoilMapper;
import com.zyjz.plan.entity.ConsumerSoil;
import com.zyjz.plan.service.ConsumerSoilService;



@Service("ConsumerSoilService")
public class ConsumerSoilServiceImpl implements ConsumerSoilService {
	
	@Autowired
	ConsumerSoilMapper consumerSoilMapper;

	@Override
	public List<ConsumerSoil> findConsumerSoilsByCanalCodes(
			List<String> canalCodeList) {
		return consumerSoilMapper.findConsumerSoilsByCanalCodes(
				canalCodeList) ;
	}

	@Override
	public List<ConsumerSoil> findConsumerSoilsByCanalCodesJoin(String canalCode) {
		return consumerSoilMapper.findConsumerSoilsByCanalCodesJoin(canalCode);
	}
	
	@Override
	public int addConsumerSoil(ConsumerSoil consumerSoil) {
		return consumerSoilMapper.insertSelective(consumerSoil);
	}

	@Override
	public ConsumerSoil selectByPrimaryKey(String id) {
		return consumerSoilMapper.selectByPrimaryKey(id);
	}

	@Override
	public int deleteByPrimaryKey(String id) {
		return consumerSoilMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(ConsumerSoil record) {
		return consumerSoilMapper.updateByPrimaryKey(record);
	}

	@Override
	public int updateByPrimaryKey(ConsumerSoil record) {
		return consumerSoilMapper.updateByPrimaryKey(record);
	}



}
