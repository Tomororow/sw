package com.zyjz.bigdata.service.impl;

import com.zyjz.bigdata.dao.ReservoirLevelMapper;
import com.zyjz.bigdata.entity.ReservoirLevel;
import com.zyjz.bigdata.service.ReservoirLevelService;
import com.zyjz.utils.dataSource.DataSource;
import com.zyjz.utils.dataSource.DynamicDataSourceHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("reservoirLevelService")
@DataSource("dataSource_REVOIR_SAFETY")
public class ReservoirLevelServiceImpl implements ReservoirLevelService {

    @Autowired
    ReservoirLevelMapper reservoirLevelMapper;

    @Override
    public int deleteByPrimaryKey(String id) {
        return reservoirLevelMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(ReservoirLevel record) {
        return reservoirLevelMapper.insert(record);
    }

    @Override
    public int insertSelective(ReservoirLevel record) {
        return reservoirLevelMapper.insertSelective(record);
    }

    @Override
    public ReservoirLevel selectByPrimaryKey(String id) {
        return reservoirLevelMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(ReservoirLevel record) {
        return reservoirLevelMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(ReservoirLevel record) {
        return reservoirLevelMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<ReservoirLevel> selectLevelAndCapacityByCode(String reservoirCode,String createTime) {
//        DynamicDataSourceHolder.setDataSource("dataSource_REVOIR_SAFETY");
        return reservoirLevelMapper.selectLevelAndCapacityByCode(reservoirCode, createTime);
    }
}
