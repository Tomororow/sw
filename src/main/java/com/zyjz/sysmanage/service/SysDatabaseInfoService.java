package com.zyjz.sysmanage.service;

import java.util.List;

import com.zyjz.sysmanage.entity.SysDatabaseInfo;

/**
 * @ClassName: SysDatabaseInfoService
 * @Description: 数据提取连接信息service接口
 * @Author: zhaojx
 * @Date: 2018年3月15日 下午4:27:34
 */
public interface SysDatabaseInfoService {
	
	/**
	 * @Title: deleteByPrimaryKey 
	 * @Description: 根据主键删除
	 * @param: @param id
	 * @return: int
	 */
    int deleteByPrimaryKey(String id);

    /**
     * @Title: insert
     * @Description: 新增全部信息
     * @param: @param record
     * @return: int
     */
    int insert(SysDatabaseInfo record);

    /**
     * @Title: insertSelective 
     * @Description: 有选择性的新增信息
     * @param: @param record
     * @return: int
     */
    int insertSelective(SysDatabaseInfo record);

    /**
     * @Title: selectByPrimaryKey 
     * @Description: 根据主键查询
     * @param: @param id
     * @return: SysArea
     */
    SysDatabaseInfo selectByPrimaryKey(String id);

    /**
     * @Title: updateByPrimaryKeySelective 
     * @Description: 根据主键有选择性更新信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKeySelective(SysDatabaseInfo record);

    /**
     * @Title: updateByPrimaryKey 
     * @Description: 根据主键更新信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKey(SysDatabaseInfo record);
    
    /**
     * @Title: getBaseAll
     * @Description: 获取全部信息
     * @return: List<SysDatabaseInfo>
     */
    List<SysDatabaseInfo> getBaseAll();
    
}