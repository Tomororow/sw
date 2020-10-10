package com.zyjz.site.dao;

import java.util.List;

import com.zyjz.site.entity.AreaRainfallStation;

/**
 * @ClassName: AreaRainfallStationMapper
 * @Description: 行政区域雨量站dao接口
 * @Author: zhaojx
 * @Date: 2018年3月4日 上午12:04:15
 */
public interface AreaRainfallStationMapper {

    int deleteByPrimaryKey(String id);

    int insert(AreaRainfallStation record);

    int insertSelective(AreaRainfallStation record);

    AreaRainfallStation selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(AreaRainfallStation record);

    int updateByPrimaryKey(AreaRainfallStation record);
    
    List<AreaRainfallStation> getAreaRainfallStationInfo();
    
}