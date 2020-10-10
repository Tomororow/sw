package com.zyjz.sysmanage.service;

import java.util.List;

import com.zyjz.sysmanage.entity.ReservoirWaterLevelVolum;

public interface ReservoirCapacityService {
	public List<ReservoirWaterLevelVolum> findAllReservoirWaterLevelVolumsByReservoirCode(String reservoirCode);

}
