package com.zyjz.sysmanage.service;

import java.util.List;
import java.util.Map;

import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.entity.SysWaterArea;

/**
 * @ClassName: ISysAreaService 
 * @Description: 行政区域service接口
 * @Author: zhaojx
 * @Date: 2017年12月21日 上午10:19:43
 */
public interface SysAreaService {
	
	/**
	 * @Title: getAllSysAreaInfo
	 * @Description: 查询全部信息
	 * @param: @param params
	 * @return: SysArea
	 */
	List<SysArea> getAllSysAreaInfo();
	
	/**
	 * @Title: deleteByPrimaryKey
	 * @Description: 根据主键删除
	 * @param: @param id
	 * @return: int
	 */
    int deleteByPrimaryKey(String ids);

    /**
     * @Title: insert 
     * @Description: 新增全部信息
     * @param: @param record
     * @return: int
     */
    int insert(SysArea record);

    /**
     * @Title: insertSelective 
     * @Description: 有选择性的新增信息
     * @param: @param record
     * @return: int
     */
    int insertSelective(SysArea record);

    /**
     * @Title: selectByPrimaryKey 
     * @Description: 根据主键查询
     * @param: @param id
     * @return: SysArea
     */
    SysArea selectByPrimaryKey(String id);

    /**
     * @Title: updateByPrimaryKeySelective 
     * @Description: 根据主键有选择性更新信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKeySelective(SysArea record);

    /**
     * @Title: updateByPrimaryKey 
     * @Description: 根据主键更新信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKey(SysArea record);
    
    /**
	 * @Title: getAreaList
	 * @Description: 查询全部信息
	 * @param: @param params
	 * @return: SysArea
	 */
	List<SysArea> getAreasList(List<String> list);
	
	/**
	 * @Title: getParentAreaByLevel
	 * @Description: 根据级别获取最大区域Id
	 * @param: @param level
	 * @return: String
	 */
	String getParentAreaByLevel(int level);
	
	/** rww */
	public List<SysArea> findAreaByLevel(int level);
	
	public SysArea findAreaById(String id);
	
	public List<SysArea> findAreaByPId(String id);
	
	/**
	 * @Title: findAreaBySysareaCode
	 * @Description: 根据行政区编码查询行政区renww
	 * @param: @param areaCode
	 * @param: @return
	 * @return: SysArea
	 * @throws
	 */
	public SysArea findAreaBySysareaCode(String areaCode);
	
	/**
	 * @Title: findSonAreasByCode
	 * @Description: 更据code查询所有子目录
	 * @param: @param sysareaCode
	 * @param: @return
	 * @return: List<SysArea>
	 * @throws
	 */
	List<SysArea> findSonAreasByCode(String sysareaCode);
	
	public SysArea findBySysareaCode(String id);
	
	List<SysArea> findAllAreas();
	
	List<SysArea> selectParentId(String code);

	List<SysArea> selectByIdOrCode(String id, String areaCode);

	/**
	 * 根据行政区编码和权限级别查找最后一个子行政区
	 * @param code
	 * @param level
	 * @return
	 */
	SysArea selectChildSysAreaByCode(String code, String level);
    
}