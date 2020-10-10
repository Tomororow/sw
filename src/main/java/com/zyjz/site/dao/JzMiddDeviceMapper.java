package com.zyjz.site.dao;

import com.zyjz.site.entity.JzMiddDevice;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface JzMiddDeviceMapper {
    //查询条数
    int selectCodeLength(List<String> code);
    //查询实时数据
    List<JzMiddDevice> selectDevicewaterCode(List<String> code);
    
}