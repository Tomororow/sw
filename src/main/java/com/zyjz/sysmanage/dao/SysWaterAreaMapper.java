package com.zyjz.sysmanage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zyjz.sysmanage.entity.SysWaterArea;
import org.springframework.stereotype.Repository;

public interface SysWaterAreaMapper {


    int deleteByPrimaryKey(String id);

    int insert(SysWaterArea record);

    int insertSelective(SysWaterArea record);


    SysWaterArea selectByPrimaryKey(String id);

    List<SysWaterArea> selectByPrimaryWater(@Param("id")String id,@Param("waterCode")String waterCode);


    int updateByPrimaryKeySelective(SysWaterArea record);

    int updateByPrimaryKey(SysWaterArea record);
    
    List<SysWaterArea> findAllWaterAreas();
    
    List<SysWaterArea> findSonSysWaterAreasByPidAndWaterAreaLevel(SysWaterArea sysWaterArea);
    
    List<SysWaterArea> findWaterAreaByLevel(int level);
    
   
    
    
    List <SysWaterArea>  selectSysWaterAreasById(
            @Param("id") String id,
            @Param("parentWaterareaId") String parentWaterareaId);
    
    
    List<SysWaterArea> findWaterAreaByPId(String id);
    
    int updateWaterArea(SysWaterArea sysWaterArea);
    
    SysWaterArea findBySyswaterareaCode(String syswaterareaCode);
    
    /**
     * @Title: findWaterAreasByIds
     * @Description: 更据id集合查询水管区
     * @param: @param ids
     * @param: @return
     * @return: List<SysWaterArea>
     * @throws
     */
    List<SysWaterArea> findWaterAreasByIds(List<String> ids);

    List<SysWaterArea> getWaterAreasList(List<String> list);

    /**
     * 根据水管区编码和权限级别查找最后一个子水管区
     * @param code
     * @param level
     * @return
     */
    SysWaterArea selectChildSysWaterAreaByCode(@Param("code") String code, @Param("level") String level);
}