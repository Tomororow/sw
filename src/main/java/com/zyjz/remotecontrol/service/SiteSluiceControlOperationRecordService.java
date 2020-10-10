package com.zyjz.remotecontrol.service;

import com.zyjz.remotecontrol.entity.SiteSluiceControlOperationRecord;

import java.util.List;
import java.util.Map;

public interface SiteSluiceControlOperationRecordService {
    SiteSluiceControlOperationRecord selectByPrimaryKey(String id);

    int insert(SiteSluiceControlOperationRecord record);

    int insertSelective(SiteSluiceControlOperationRecord record);

    int updateByPrimaryKeySelective(SiteSluiceControlOperationRecord record);

    int updateByPrimaryKey(SiteSluiceControlOperationRecord record);

    int deleteByPrimaryKey(String id);

    /**
     * 按渠道查询最新记录
     * @return
     */
    List<SiteSluiceControlOperationRecord> selectLatestOperationRecord();

    /**
     * 按闸门编码查询历史数据
     * @param sscorSluiceCode
     * @return
     */
    List<SiteSluiceControlOperationRecord> selectHistoryDataList(String sscorSluiceCode);

    /**
     * 按日期查询闸门控制操作历史数据
     * @param map
     * @return
     */
    List<SiteSluiceControlOperationRecord> selectHistoryDataListByDate(Map<String, Object> map);

    /**
     * 按闸门名称和闸门编码查询闸门操作记录
     * @param sscorSluiceCode
     * @param sscorSluiceName
     * @return
     */
    List<SiteSluiceControlOperationRecord> selectOperationRecordByCodeOrName(String sscorSluiceCode, String sscorSluiceName);

    /**
     * 按闸门控制操作人员查询
     * @param sluiceOperatorName
     * @return
     */
    List<SiteSluiceControlOperationRecord> selectOperationRecordByOperator(String sluiceOperatorName);
}
