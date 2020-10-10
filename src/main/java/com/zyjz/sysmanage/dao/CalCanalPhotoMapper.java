package com.zyjz.sysmanage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.sysmanage.entity.CalCanalPhoto;

public interface CalCanalPhotoMapper {

    int deleteByPrimaryKey(String id);

    int insert(CalCanalPhoto record);

    int insertSelective(CalCanalPhoto record);

    CalCanalPhoto selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(CalCanalPhoto record);

    int updateByPrimaryKey(CalCanalPhoto record);
    
    List<CalCanalPhoto> findAllByCanalId(String canalId);
    
    List <CalCanalPhoto>  selectCalCanalPhotoByCanalId(
            @Param("canalId") String canalId);
}