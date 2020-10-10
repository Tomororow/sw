package com.zyjz.sysmanage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.zyjz.sysmanage.entity.SiteSluiceInfo;


public interface SiteSluiceService {
	/**
	 * 根据闸门站id获取闸门站信息
	 */
	List<SiteSluiceInfo> findSiteSluiceInfoByCanalCode(String ssiCanalCode);

	/**
	 * 根据闸门站id获取闸门站信息
	 */
	List<SiteSluiceInfo> findSiteSluiceInfoByCanalCodeJoin(String ssiCanalCode);
	
	/**
     * 查询水渠下面的闸门站
     * @Title: selectByPrimaryKey
     * @Description: 
     * @param: @param ssi_canal_code
     * @param: @return
     * @return: SiteSluiceInfo
     * @throws
     */
    public  List<SiteSluiceInfo> selectByPrimaryKey(List<String> canalCodes);
    
    
    /**
     * 添加闸门站点
     * @Title: insertSelective
     * @Description: 
     * @param: @param record
     * @param: @return
     * @return: int
     * @throws
     */
    public void insertSelective(SiteSluiceInfo record);
    
    
    /**
     * 根据闸门站id查询所有信息
     * @Title: selectById
     * @Description: 
     * @param: @param id
     * @param: @return
     * @return: SiteSluiceInfo
     * @throws
     */
    public SiteSluiceInfo  selectById(String id);
    
    /**
     * 修改
     * @Title: updateByPrimaryKeySelective
     * @Description: 
     * @param: @param record
     * @param: @return
     * @return: int
     * @throws
     */
    int updateByPrimaryKeySelective(SiteSluiceInfo record);
    
    
    int deleteByPrimaryKey(String id);
    
    
    public List<SiteSluiceInfo> findByCode(List<String> code);

    List<SiteSluiceInfo> findSiteSluiceInfoByCanalCodeByCodeOrName(String canalCode, String deviceSluiceCode, String deviceSluiceName);
}	
