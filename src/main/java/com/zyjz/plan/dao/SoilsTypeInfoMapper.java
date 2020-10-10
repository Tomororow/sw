package com.zyjz.plan.dao;

import java.util.List;

import com.zyjz.plan.entity.SoilTypeInfo;

/**
 * @ClassName: SoilsTypeInfoMapper
 * @Description: 土地类型管理Dao接口
 * @Author: zhaojx
 * @Date: 2018年2月25日 上午9:35:08
 */
public interface SoilsTypeInfoMapper {
	
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
    int insert(SoilTypeInfo record);

    /**
     * @Title: insertSelective
     * @Description: 有选择的插入信息
     * @param: @param record
     * @return: int
     */
    int insertSelective(SoilTypeInfo record);

    /**
     * @Title: selectByPrimaryKey
     * @Description: 根据主键查询单条信息
     * @param: @param id
     * @return: SoilTypeInfo
     */
    SoilTypeInfo selectByPrimaryKey(String id);

    /**
     * @Title: updateByPrimaryKeySelective
     * @Description: 有选择的修改信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKeySelective(SoilTypeInfo record);

    /**
     * @Title: updateByPrimaryKey
     * @Description: 修改信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKey(SoilTypeInfo record);
    
    /**
     * @Title: getCropsTypeList
     * @Description: 获取农作物信息
     * @param: @param params
     * @return: List<SoilTypeInfo>
     */
    List<SoilTypeInfo> getSoilsList();
    
    public SoilTypeInfo getSoilName(String id);
    
    /**
     * 根据区域areaCodes获取土地类型
     * @Title: findSoilTypeByAreaCodes
     * @Description: 
     * @param: @param areaCodes
     * @param: @return
     * @return: List<SoilTypeInfo>
     * @throws
     */
    List<SoilTypeInfo> findSoilTypeByAreaCodes(List<String> areaCodes);
    
    
    /**
     * 根据cropsCode查询农作物生长周期
     * @Title: findAreaCropsGrowthCycleList
     * @Description: 
     * @param: @param cropsCode
     * @param: @return
     * @return: List<CropsTypeInfo>
     * @throws
     */
    public List<SoilTypeInfo> findAreaCropsSoilTypeInfoList(String cropsCode);

	SoilTypeInfo findsoilType(String soilType);
    
    
}