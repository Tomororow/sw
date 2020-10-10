package com.zyjz.sysmanage.dao;



import com.zyjz.sysmanage.entity.CalCanalLengthCalssify;

public interface CalCanalLengthCalssifyMapper {


    int deleteByPrimaryKey(String id);

    int insert(CalCanalLengthCalssify record);

    int insertSelective(CalCanalLengthCalssify record);


    CalCanalLengthCalssify selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(CalCanalLengthCalssify record);

    int updateByPrimaryKey(CalCanalLengthCalssify record);
    
    CalCanalLengthCalssify findByCanlId(String canalId);
}