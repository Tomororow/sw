package com.zyjz.remotecontrol.service.impl;

import com.zyjz.remotecontrol.dao.SiteSluiceControlOperationRecordMapper;
import com.zyjz.remotecontrol.entity.SiteSluiceControlOperationRecord;
import com.zyjz.remotecontrol.service.SiteSluiceControlOperationRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("siteSluiceControlOperationRecordService")
public class SiteSluiceControlOperationRecordServiceImpl implements SiteSluiceControlOperationRecordService {

    @Autowired
    private SiteSluiceControlOperationRecordMapper siteSluiceControlOperationRecordMapper;

    @Override
    public SiteSluiceControlOperationRecord selectByPrimaryKey(String id) {
        return siteSluiceControlOperationRecordMapper.selectByPrimaryKey(id);
    }

    @Override
    public int insert(SiteSluiceControlOperationRecord record) {
        return siteSluiceControlOperationRecordMapper.insert(record);
    }

    @Override
    public int insertSelective(SiteSluiceControlOperationRecord record) {
        return siteSluiceControlOperationRecordMapper.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKeySelective(SiteSluiceControlOperationRecord record) {
        return siteSluiceControlOperationRecordMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SiteSluiceControlOperationRecord record) {
        return siteSluiceControlOperationRecordMapper.updateByPrimaryKey(record);
    }

    @Override
    public int deleteByPrimaryKey(String id) {
        return siteSluiceControlOperationRecordMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<SiteSluiceControlOperationRecord> selectLatestOperationRecord() {
        return siteSluiceControlOperationRecordMapper.selectLatestOperationRecord();
    }

    @Override
    public List<SiteSluiceControlOperationRecord> selectHistoryDataList(String sscorSluiceCode) {
        return siteSluiceControlOperationRecordMapper.selectHistoryDataList(sscorSluiceCode);
    }

    @Override
    public List<SiteSluiceControlOperationRecord> selectHistoryDataListByDate(Map<String, Object> map) {
        return siteSluiceControlOperationRecordMapper.selectHistoryDataListByDate(map);
    }

    @Override
    public List<SiteSluiceControlOperationRecord> selectOperationRecordByCodeOrName(String sscorSluiceCode, String sscorSluiceName) {
        return siteSluiceControlOperationRecordMapper.selectOperationRecordByCodeOrName(sscorSluiceCode, sscorSluiceName);
    }

    @Override
    public List<SiteSluiceControlOperationRecord> selectOperationRecordByOperator(String sluiceOperatorName) {
        return siteSluiceControlOperationRecordMapper.selectOperationRecordByOperator(sluiceOperatorName);
    }
}
