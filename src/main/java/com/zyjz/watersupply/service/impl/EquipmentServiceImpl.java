package com.zyjz.watersupply.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.watersupply.dao.SynEquipmentMapper;
import com.zyjz.watersupply.entity.SynEquipment;
import com.zyjz.watersupply.service.EquipmentService;

/**
 * 设备service实现类
 * @ClassName: EquipmentServiceImpl
 * @Description: 
 * @Author: liyue
 * @Date: 2018年5月14日 下午5:29:57
 */
@Service("equipmentService")
public class EquipmentServiceImpl implements EquipmentService {

	@Autowired
	private SynEquipmentMapper synEquipmentMapper;
	
	@Override
	public int deleteByPrimaryKey(String id) {
		return synEquipmentMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(SynEquipment record) {
		return synEquipmentMapper.insert(record);
	}

	@Override
	public int insertSelective(SynEquipment record) {
		return synEquipmentMapper.insertSelective(record);
	}

	@Override
	public SynEquipment selectByPrimaryKey(String id) {
		return synEquipmentMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(SynEquipment record) {
		return synEquipmentMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(SynEquipment record) {
		return synEquipmentMapper.updateByPrimaryKey(record);
	}

}
