package com.zyjz.sysmanage.service;

import com.zyjz.sysmanage.entity.SiteDeviceModel;

import java.util.List;

public interface SiteDeviceModelService {
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
    int insert(SiteDeviceModel record);

    /**
     * @Title: insertSelective
     * @Description: 有选择性的新增信息
     * @param: @param record
     * @return: int
     */
    int insertSelective(SiteDeviceModel record);

    /**
     * @Title: selectByPrimaryKey
     * @Description: 根据主键查询
     * @param: @param id
     * @return: SysArea
     */
    SiteDeviceModel selectByPrimaryKey(String id);

    /**
     * @Title: updateByPrimaryKeySelective
     * @Description: 根据主键有选择性更新信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKeySelective(SiteDeviceModel record);

    /**
     * @Title: updateByPrimaryKey
     * @Description: 根据主键更新信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKey(SiteDeviceModel record);

    /**
     * @Title: selectAll
     * @Description: 查询全部测量设备信息
     * @return: List<SiteDeviceModel>
     */
    List<SiteDeviceModel> selectAll();

    /**
     * 根据设备类型编码查询设备信息
     * @Title: selectByDeviceCode
     * @Description:
     * @param: @param deviceCode
     * @param: @return
     * @return: SiteDeviceModel
     * @throws
     */
    SiteDeviceModel selectByDeviceCode(Integer deviceCode);
}
