package com.zyjz.sysmanage.service;

import com.zyjz.sysmanage.entity.SysArea;

/**
 * @ClassName: ISysAreaService 
 * @Description: 行政区域service接口
 * @Author: zhaojx
 * @Date: 2017年12月21日 上午10:19:43
 */
public interface ISysAreaService {
	
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
    int insert(SysArea record);

    /**
     * @Title: insertSelective 
     * @Description: 有选择性的新增信息
     * @param: @param record
     * @return: int
     */
    int insertSelective(SysArea record);

    /**
     * @Title: selectByPrimaryKey 
     * @Description: 根据主键查询
     * @param: @param id
     * @return: SysArea
     */
    SysArea selectByPrimaryKey(String id);

    /**
     * @Title: updateByPrimaryKeySelective 
     * @Description: 根据主键有选择性更新信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKeySelective(SysArea record);

    /**
     * @Title: updateByPrimaryKey 
     * @Description: 根据主键更新信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKey(SysArea record);
    
}