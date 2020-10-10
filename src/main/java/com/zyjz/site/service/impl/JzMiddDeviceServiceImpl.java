package com.zyjz.site.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.site.dao.JzMiddDeviceMapper;
import com.zyjz.site.entity.JzMiddDevice;
import com.zyjz.site.service.JzMiddDeviceService;
@Service("JzMiddDeviceService")
public class JzMiddDeviceServiceImpl implements JzMiddDeviceService {
	
	@Autowired
	private JzMiddDeviceMapper jzMiddDeviceMapper;

	@Override
	public int selectCodeLength(List<String> code) {
		// TODO Auto-generated method stub
		return jzMiddDeviceMapper.selectCodeLength(code);
	}
	@Override
	public List<JzMiddDevice> selectDevicewaterCode(List<String> code) {
		// TODO Auto-generated method stub
		return jzMiddDeviceMapper.selectDevicewaterCode(code);
	}
}
