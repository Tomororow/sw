package com.zyjz.plan.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.plan.entity.CollectBaseParams;

public interface CollectBaseParamsService {
	 int deleteByPrimaryKey(String id);

	    int insert(CollectBaseParams record);

	    int insertSelective(CollectBaseParams record);

	    CollectBaseParams selectByPrimaryKey(String id);

	    int updateByPrimaryKeySelective(CollectBaseParams record);

	    int updateByPrimaryKey(CollectBaseParams record);
	    
	    List<CollectBaseParams> selectBaseInclude();
	    
	    CollectBaseParams selectByPrimaryBaseName(String baseName);
	    
	    CollectBaseParams selectByPrimaryBaseOne(String baseName, String level);
	    
	    List<CollectBaseParams> selectAll(String activeName);
}
