package com.zyjz.sysmanage.dao;


import java.util.List;

import com.zyjz.sysmanage.entity.SiteReservoirInfo;

public interface SiteReservoirInfoMapper {

    int deleteByPrimaryKey(String id);

    int insert(SiteReservoirInfo record);

    int insertSelective(SiteReservoirInfo record);

    SiteReservoirInfo selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(SiteReservoirInfo record);

    int updateByPrimaryKey(SiteReservoirInfo record);
    
    List<SiteReservoirInfo> findAllReservoir();

    List<SiteReservoirInfo> selectReservoirList(String canalCode);
}