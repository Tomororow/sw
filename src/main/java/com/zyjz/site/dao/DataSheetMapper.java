package com.zyjz.site.dao;

import java.util.List;

import com.zyjz.site.entity.DataSheet;

public interface DataSheetMapper {


    int deleteByPrimaryKey(String id);

    int insert(DataSheet record);

    int insertSelective(DataSheet record);

    DataSheet selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(DataSheet record);

    int updateByPrimaryKey(DataSheet record);
    
    DataSheet selectCode(String waterCode);
    
    List<DataSheet> selectAll(String year);

    /**
     * 根据站点编码查询 当年月累计流量数据    李玥
     * @Title: addUpData
     * @Description: 
     * @param: @param devicewaterCode
     * @param: @return
     * @return: List<DataSheetExcel>
     * @throws
     */
	DataSheet addUpData(String waterCode);
}