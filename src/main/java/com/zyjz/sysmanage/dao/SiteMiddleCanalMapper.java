package com.zyjz.sysmanage.dao;

import com.zyjz.sysmanage.entity.SiteMiddleCanal;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface SiteMiddleCanalMapper {
    /**
     * 根据canalcode查询水位站编码
     * @param canalCode
     * @return
     */
    List<SiteMiddleCanal> findSiteWaterCodeByCanalCode(String canalCode);

    /**
     * 查询某个编码code为空是否存在数据
     * @param canalCode
     * @param columnName
     * @return
     */
    List<SiteMiddleCanal> selectCanalInfoByCodeIsNull(@Param("canalCode") String canalCode, @Param("columnName") String columnName);

    /**
     *新增
     * @param siteMiddleCanal
     * @return
     */
    int insertSelective(SiteMiddleCanal siteMiddleCanal);

    /**
     * 更新
     * @param siteMiddleCanal
     * @return
     */
    int updateByPrimaryKeySelective(SiteMiddleCanal siteMiddleCanal);

    /**
     * 查询该code数据
     * @param code
     * @param columnName
     * @return
     */
    List<SiteMiddleCanal> selectMiddleCanalInfoByCode(@Param("code")String code, @Param("columnName")String columnName);
}
