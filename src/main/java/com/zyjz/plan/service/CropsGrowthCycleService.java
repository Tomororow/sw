package com.zyjz.plan.service;

import java.util.List;

import com.zyjz.plan.entity.CropsGrowthCycle;

/**
 * @ClassName: CropsGrowthCycleService
 * @Description: 农作物生长周期service接口
 * @Author: zhaojx
 * @Date: 2018年2月28日 下午5:42:57
 */
public interface CropsGrowthCycleService {
	
	/**
	 * @Title: deleteByPrimaryKey
	 * @Description: 根据Id删除
	 * @param: @param id
	 * @return: int
	 */
	int deleteByPrimaryKey(String ids);
	
	/**
	 * @Title: insert
	 * @Description: 插入信息
	 * @param: @param record
	 * @return: int
	 */
    int insert(CropsGrowthCycle record);

    /**
     * @Title: insertSelective
     * @Description: 有选择的插入信息
     * @param: @param record
     * @return: int
     */
    int insertSelective(CropsGrowthCycle record);

    /**
     * @Title: selectByPrimaryKey
     * @Description: 根据主键查询单条信息
     * @param: @param id
     * @return: CropsTypeInfo
     */
    CropsGrowthCycle selectByPrimaryKey(String id);

    /**
     * @Title: updateByPrimaryKeySelective
     * @Description: 有选择的修改信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKeySelective(CropsGrowthCycle record);

    /**
     * @Title: updateByPrimaryKey
     * @Description: 修改信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKey(CropsGrowthCycle record);
    
    /**
     * @Title: getCropsTypeList
     * @Description: 获取农作物生长周期信息
     * @param: @param params
     * @return: List<CropsTypeInfo>
     */
    List<CropsGrowthCycle> getCropsCycleList();
    
    CropsGrowthCycle getCycleNameList(String id);
    
  
    /**
     * 根据areaCodes查询农作物生长周期
     * @Title: findCropsGrowthByAreaCodes
     * @Description: 
     * @param: @param areaCodes
     * @param: @return
     * @return: List<CropsGrowthCycle>
     * @throws
     */
    List<CropsGrowthCycle> findCropsGrowthByAreaCodes(List<String> areaCodes);
    
    
    /**
     * 根据cropsCode查询农作物生长周期
     * @Title: findAreaCropsGrowthCycleList
     * @Description: 
     * @param: @param cropsCode
     * @param: @return
     * @return: List<CropsTypeInfo>
     * @throws
     */
    public List<CropsGrowthCycle> findAreaCropsGrowthCycleList(String cropsCode);
    
    
    /**
     * 根据农作物类型id查询农作物生长周期
     * @Title: findCropsTypeIdGrowthCycleList
     * @Description: 
     * @param: @param cropsTypeId
     * @param: @return
     * @return: List<CropsGrowthCycle>
     * @throws
     */
    public List<CropsGrowthCycle> findCropsTypeIdGrowthCycleList(String cropsTypeId);
    
    /**
     * 根据土地类型、农作物类型查询农作物信息
     * @Title: findGrowthCycleBy_soilType_cropsType
     * @Description: 
     * @param: @param soilType
     * @param: @param cropsType
     * @param: @return
     * @return: List<CropsGrowthCycle>
     * @throws
     */
    public List<CropsGrowthCycle> findGrowthCycleBy_soilType_cropsType(String cropsType, String soilType);
    
}