package com.zyjz.remotecontrol.dao;

import com.zyjz.remotecontrol.entity.SiteSluiceControlOperationRecord;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SiteSluiceControlOperationRecordMapper {

    SiteSluiceControlOperationRecord selectByPrimaryKey(String id);

    int insert(SiteSluiceControlOperationRecord record);

    int insertSelective(SiteSluiceControlOperationRecord record);

    int updateByPrimaryKeySelective(SiteSluiceControlOperationRecord record);

    int updateByPrimaryKey(SiteSluiceControlOperationRecord record);

    int deleteByPrimaryKey(String id);

    List<SiteSluiceControlOperationRecord> selectLatestOperationRecord();

    List<SiteSluiceControlOperationRecord> selectHistoryDataList(String sscorSluiceCode);

    List<SiteSluiceControlOperationRecord> selectHistoryDataListByDate(Map<String, Object> map);

    List<SiteSluiceControlOperationRecord> selectOperationRecordByCodeOrName(
            @Param("sscorSluiceCode") String sscorSluiceCode, @Param("sscorSluiceName") String sscorSluiceName);

    List<SiteSluiceControlOperationRecord> selectOperationRecordByOperator(@Param("sluiceOperatorName") String sluiceOperatorName);
}
