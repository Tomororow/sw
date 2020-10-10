package com.zyjz.site.service;

import java.util.List;

import com.zyjz.site.entity.JzMiddDevice;

public interface JzMiddDeviceService {
	 //查询条数
    int selectCodeLength(List<String> code);
  //查询实时数据
    List<JzMiddDevice> selectDevicewaterCode(List<String> code);
}
