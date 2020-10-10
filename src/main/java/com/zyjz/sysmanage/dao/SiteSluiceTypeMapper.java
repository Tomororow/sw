package com.zyjz.sysmanage.dao;

import com.zyjz.sysmanage.entity.SiteSluiceType;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SiteSluiceTypeMapper {

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table site_sluice_type
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table site_sluice_type
     *
     * @mbggenerated
     */
    int insert(SiteSluiceType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table site_sluice_type
     *
     * @mbggenerated
     */
    int insertSelective(SiteSluiceType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table site_sluice_type
     *
     * @mbggenerated
     */
    SiteSluiceType selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table site_sluice_type
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(SiteSluiceType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table site_sluice_type
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(SiteSluiceType record);

    List<SiteSluiceType> selectAll();
}