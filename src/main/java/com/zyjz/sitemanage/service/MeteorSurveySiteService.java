package com.zyjz.sitemanage.service;

import java.util.List;

import com.zyjz.sitemanage.entity.MeteorSurveySite;
import com.zyjz.sitemanage.web.MeteorTreeMenu;

public interface MeteorSurveySiteService {
	  int deleteByPrimaryKey(String id);

	    int insert(MeteorSurveySite record);

	    int insertSelective(MeteorSurveySite record);

	    MeteorSurveySite selectByPrimaryKey(String id);

	    int updateByPrimaryKeySelective(MeteorSurveySite record);

	    int updateByPrimaryKey(MeteorSurveySite record);
	    
	    List<MeteorTreeMenu>selectTreeImpl();
	    
	    List<MeteorSurveySite> selectAdministrativeCoding(List<String> code);

}
