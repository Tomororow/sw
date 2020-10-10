package com.zyjz.watersupply.dao;

import com.zyjz.watersupply.entity.SynEquipment;
import org.apache.ibatis.annotations.Param;
/**
 * 设备信息dao
 * @ClassName: SynEquipmentMapper
 * @Description: 
 * @Author: 李玥
 * @Date: 2018年5月14日 下午5:28:26
 */
public interface SynEquipmentMapper {


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