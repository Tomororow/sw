package com.zyjz.sysmanage.dao;


import java.util.List;

import com.zyjz.sysmanage.entity.SiteWaterInfo;
import org.apache.ibatis.annotations.Param;

public interface SiteWaterInfoMapper {


    int deleteByPrimaryKey(String id);

    int insert(SiteWaterInfo record);

    int insertSelective(SiteWaterInfo record);

    SiteWaterInfo selectByPrimaryKey(String id);
    
    List<SiteWaterInfo> selectAll();

    int updateByPrimaryKeySelective(SiteWaterInfo record);

    int updateByPrimaryKey(SiteWaterInfo record);
    
    List<SiteWaterInfo> findSiteWaterInfoByCanalCode(String swiCanalCode);
    
    List<SiteWaterInfo> findSiteWaterByCanalCodes(List<String> canalCodes);
    
    List<SiteWaterInfo> findSiteWaterByCanalCodesJoin(String canalCode);
    
	SiteWaterInfo findSiteWaterInfoByCode(String deviceWaterCode);
	
	List<SiteWaterInfo> selectCodetype(@Param("swiCanalCode") List<String> swiCanalCode, @Param("swiDevicemodelCode") String swiDevicemodelCode);
	
	List<SiteWaterInfo> selectCode(List<String> code);
	
	List<SiteWaterInfo> selectCodecanal(List<String> code);
	
	SiteWaterInfo selectName(String deviceWaterName);
	
	List<String> findSiteWaterByCanalString(List<String> canalCodes);
	
	Integer findSiteWaterCount(List<String> canalCodes);
	
	Integer findSiteWaterByCanalCodeJoinCount(String canalCode);


    List<SiteWaterInfo> findSiteWaterJoinSiteMiddleCanal(String canalCode);

}