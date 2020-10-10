package com.zyjz.sysmanage.dao;

import java.util.List;

import com.zyjz.sysmanage.entity.SiteSluiceInfo;
import org.apache.ibatis.annotations.Param;

public interface SiteSluiceInfoMapper {


    int deleteByPrimaryKey(String id);

    
    int insert(SiteSluiceInfo record);

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
     * 查询水渠下面的闸门站
     * @Title: selectByPrimaryKey
     * @Description: 
     * @param: @param ssi_canal_code
     * @param: @return
     * @return: SiteSluiceInfo
     * @throws
     */
    public   List<SiteSluiceInfo> selectByPrimaryKey(List<String> ssiCanalCode);

    int updateByPrimaryKeySelective(SiteSluiceInfo record);

    int updateByPrimaryKey(SiteSluiceInfo record);
    
    List<SiteSluiceInfo> findSiteSluiceInfoByCanalCode(String ssiCanalCode);
    
    List<SiteSluiceInfo> findSiteSluiceInfoByCanalCodeJoin(String ssiCanalCode);
    
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
     * 根据渠道编码查询数据
     */
    public List<SiteSluiceInfo> findByCode(List<String> code);

    List<SiteSluiceInfo> findSiteSluiceInfoByCanalCodeByCodeOrName(@Param("canalCode") String canalCode,@Param("deviceSluiceCode")  String deviceSluiceCode,@Param("deviceSluiceName")  String deviceSluiceName);
}