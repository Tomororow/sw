package com.zyjz.remotecontrol.dao;

import com.zyjz.remotecontrol.entity.SiteSluiceJzMiddDevice;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SiteSluiceJzMiddDeviceMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(SiteSluiceJzMiddDevice record);

    int insertSelective(SiteSluiceJzMiddDevice record);

    SiteSluiceJzMiddDevice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SiteSluiceJzMiddDevice record);

    int updateByPrimaryKey(SiteSluiceJzMiddDevice record);
}