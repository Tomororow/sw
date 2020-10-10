package com.zyjz.sysmanage.service;

import com.zyjz.sysmanage.entity.SiteMiddleCanal;

import java.util.List;

public interface SiteMiddleCanalService {

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
    List<SiteMiddleCanal> selectCanalInfoByCodeIsNull(String canalCode, String columnName);

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
    List<SiteMiddleCanal> selectMiddleCanalInfoByCode(String code, String columnName);
}
