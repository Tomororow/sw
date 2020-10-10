package com.zyjz.bigdata.service.impl;

import com.zyjz.bigdata.dao.BigDataConfigMapper;
import com.zyjz.bigdata.entity.BigDataConfig;
import com.zyjz.bigdata.service.BigDataConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bigDataConfigService")
public class BigDataConfigServiceImpl implements BigDataConfigService {

    @Autowired
    BigDataConfigMapper bigDataConfigMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return bigDataConfigMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(BigDataConfig record) {
        return bigDataConfigMapper.insert(record);
    }

    @Override
    public int insertSelective(BigDataConfig record) {
        return bigDataConfigMapper.insertSelective(record);
    }

    @Override
    public BigDataConfig selectByPrimaryKey(Integer id) {
        return bigDataConfigMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(BigDataConfig record) {
        return bigDataConfigMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(BigDataConfig record) {
        return bigDataConfigMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<BigDataConfig> selectAll() {
        return bigDataConfigMapper.selectAll();
    }
}
