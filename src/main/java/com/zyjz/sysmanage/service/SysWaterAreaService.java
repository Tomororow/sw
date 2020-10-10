/**
 * 
 */
package com.zyjz.sysmanage.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zyjz.sysmanage.entity.SysWaterArea;
import org.apache.ibatis.annotations.Param;


/** <p>Title:SysWaterAreaService </p>
 * <p>Description: </p>
 * <p>Company: </p> 
 * @author rww
 *	@data 2017年12月22日 下午5:00:52
 */
public interface SysWaterAreaService {
	
	public List<SysWaterArea> findAllWaterAreas();

	public List<SysWaterArea> selectByPrimaryWater(String id,String waterCode);
	
	public SysWaterArea findWaterAreaById(String id);
	
	public int add(SysWaterArea sysWaterArea);
	
	public List<SysWaterArea> findSonSysWaterAreasByPidAndWaterAreaLevel(String pId, int waterAreaLevel);
	
	public List<SysWaterArea> findWaterAreaByLevel(int level);
	public List<SysWaterArea> selectByPageNumSize(SysWaterArea sysWaterArea, int a, int b);
	public PageInfo<SysWaterArea> queryByPage(String id, Integer pageNo, Integer pageSize);
	public List<SysWaterArea> selectSysWaterAreasById(String id, String parentWaterareaId);
	public List<SysWaterArea> findWaterAreaByPId(String id);
	public int deleteById(String id);
	public int updateWaterArea(SysWaterArea sysWaterArea);
	public SysWaterArea findWaterAreaBySyswaterareaCode(String syswaterareaCode);
	/**
	 * @Title: findSonWaterAreasByCode
	 * @Description: 更据水管区code查询他的子级
	 * @param: @return
	 * @return: List<SysWaterArea>
	 * @throws
	 */
	public List<SysWaterArea> findSonWaterAreasByCode(String syswaterareaCode);
	
	/**
	 * @Title: findWaterAreasByIds
	 * @Description: 更据id集合查询
	 * @param: @param ids
	 * @param: @return
	 * @return: List<SysWaterArea>
	 * @throws
	 */
	List<SysWaterArea> findWaterAreasByIds(List<String> ids);

	List<SysWaterArea> getWaterAreasList(List<String> list);

	/**
	 * 水管区域修改
	 * @param sysWaterArea
	 * @return
	 */
	int updateByPrimaryKeySelective(SysWaterArea sysWaterArea);

	/**
	 * 根据水管区编码和权限级别查找最后一个子水管区
	 * @param code
	 * @param level
	 * @return
	 */
	SysWaterArea selectChildSysWaterAreaByCode(String code, String level);
}
