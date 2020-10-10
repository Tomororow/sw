package com.zyjz.watersupply.service;

import com.zyjz.watersupply.entity.SynEquipment;

public interface EquipmentService {


	/**
	 * 根据id删除设备
	 * @Title: deleteByPrimaryKey
	 * @Description: 
	 * @param: @param id
	 * @param: @return
	 * @return: int
	 * @throws
	 */
    int deleteByPrimaryKey(String id);

    /**
     * 新增设备
     * @Title: insert
     * @Description: 
     * @param: @param record
     * @param: @return
     * @return: int
     * @throws
     */
    int insert(SynEquipment record);

    int insertSelective(SynEquipment record);

    SynEquipment selectByPrimaryKey(String id);

    /**修改设备信息
     * 
     * @Title: updateByPrimaryKeySelective
     * @Description: 
     * @param: @param record
     * @param: @return
     * @return: int
     * @throws
     */
    int updateByPrimaryKeySelective(SynEquipment record);

    int updateByPrimaryKey(SynEquipment record);
}
