package com.zyjz.plan.service;

import java.util.List;

import com.zyjz.plan.entity.CropsTypeInfo;

/**
 * @ClassName: CropsTypeInfoService
 * @Description: 农作物管理service接口
 * @Author: zhaojx
 * @Date: 2018年2月25日 上午9:45:07
 */
public interface CropsTypeInfoService {
	
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
    int insert(CropsTypeInfo record);

    /**
     * @Title: insertSelective
     * @Description: 有选择的插入信息
     * @param: @param record
     * @return: int
     */
    int insertSelective(CropsTypeInfo record);

    /**
     * @Title: selectByPrimaryKey
     * @Description: 根据主键查询单条信息
     * @param: @param id
     * @return: CropsTypeInfo
     */
    CropsTypeInfo selectByPrimaryKey(String id);
    
    CropsTypeInfo findCropsTypeByCode(String cropsCode);

    /**
     * @Title: updateByPrimaryKeySelective
     * @Description: 有选择的修改信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKeySelective(CropsTypeInfo record);

    /**
     * @Title: updateByPrimaryKey
     * @Description: 修改信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKey(CropsTypeInfo record);
    
    /**
     * @Title: getCropsTypeList
     * @Description: 获取农作物信息
     * @param: @param params
     * @return: List<CropsTypeInfo>
     */
    List<CropsTypeInfo> getCropsList();
    
    /**
     * 根据cropsCode查询农作物信息
     * @Title: selectBycropsCode
     * @Description: 
     * @param: @param cropsCode
     * @param: @return
     * @return: CropsTypeInfo
     * @throws
     */
    public CropsTypeInfo selectBycropsCode(String cropsCode);
    
    
    /**
     * 根据获取农作物信息areaCode
     * @Title: findCropsTypeInfoByAreaCodes
     * @Description: 
     * @param: @param areaCodes
     * @param: @return
     * @return: List<CropsTypeInfo>
     * @throws
     */
   List<CropsTypeInfo> findCropsTypeInfoByAreaCodes(List<String> areaCodes);
    
   
   /**
    * 根据AreaCode获取农作物类型信息
    * @Title: findAreaCodeCropsTypeList
    * @Description: 
    * @param: @param cropsCode
    * @param: @return
    * @return: List<CropsTypeInfo>
    * @throws
    */
   public List<CropsTypeInfo> findAreaCodeCropsTypeList(String cropsCode);
    
}