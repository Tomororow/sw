package com.zyjz.sysmanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sysmanage.dao.ReservoirWaterLevelVolumMapper;
import com.zyjz.sysmanage.entity.ReservoirWaterLevelVolum;
import com.zyjz.sysmanage.service.ReservoirCapacityService;

@Service("ReservoirCapacityService")
public class ReservoirCapacityServiceImpl implements ReservoirCapacityService {
	
	@Autowired
	ReservoirWaterLevelVolumMapper reservoirWaterLevelVolumMapper;

	@Override
	public List<ReservoirWaterLevelVolum> findAllReservoirWaterLevelVolumsByReservoirCode(
			String reservoirCode) {
		return reservoirWaterLevelVolumMapper.findAllReservoirWaterLevelVolumsByReservoirCode(reservoirCode);
	}

}
