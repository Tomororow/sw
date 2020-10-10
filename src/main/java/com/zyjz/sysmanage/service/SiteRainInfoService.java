package com.zyjz.sysmanage.service;

import java.util.List;
import java.util.Map;

import com.zyjz.sysmanage.entity.SiteRainInfo;

/**
 * @ClassName: SiteRainInfoService
 * @Description: 雨量站信息管理service接口
 * @Author: zhaojx
 * @Date: 2018年3月2日 下午5:11:32
 */
public interface SiteRainInfoService {
	
	/**
	 * @Title: deleteByPrimaryKey 
	 * @Description: 根据主键删除
	 * @param: @param id
	 * @return: int
	 */
    int deleteByPrimaryKey(String id);

    /**
     * @Title: insert
     * @Description: 新增全部信息
     * @param: @param record
     * @return: int
     */
    int insert(SiteRainInfo record);

    /**
     * @Title: insertSelective 
     * @Description: 有选择性的新增信息
     * @param: @param record
     * @return: int
     */
    int insertSelective(SiteRainInfo record);

    /**
     * @Title: selectByPrimaryKey 
     * @Description: 根据主键查询
     * @param: @param id
     * @return: SiteRainInfo
     */
    SiteRainInfo selectByPrimaryKey(String id);

    /**
     * @Title: updateByPrimaryKeySelective 
     * @Description: 根据主键有选择性更新信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKeySelective(SiteRainInfo record);

    /**
     * @Title: updateByPrimaryKey 
     * @Description: 根据主键更新信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKey(SiteRainInfo record);
    
    /**
     * @Title: getRainByArea
     * @Description: 根据行政区域获取雨量站树菜单
     * @return: List<SiteRainInfo>
     * @throws
     */
    List<SiteRainInfo> getRainNameByAreaId(String areaId);
    
    /**
     * @Title: getRainSiteAll
     * @Description: 区域信息不为空 获取所属区域下雨量站相关联的全部信息
     * @param: @return
     * @return: List<SiteRainInfo>
     */
    List<SiteRainInfo> getRainSiteByAreaId(Map<String, Object> params);
    
    
    
    List<SiteRainInfo>findSiteRainByAreaIds(List<String> areaIds);
    
    
    
}