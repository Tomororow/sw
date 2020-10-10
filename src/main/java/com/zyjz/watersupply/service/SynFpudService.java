package com.zyjz.watersupply.service;

import java.util.List;

import com.zyjz.watersupply.entity.SynFpud;

public interface SynFpudService {
	  int deleteByPrimaryKey(String id);

	    int insert(SynFpud record);

	    int insertSelective(SynFpud record);

	    SynFpud selectByPrimaryKey(String id);

	    int updateByPrimaryKeySelective(SynFpud record);

	    int updateByPrimaryKey(SynFpud record);
	    
	    List<SynFpud> selectSysareaId(String id);
}
