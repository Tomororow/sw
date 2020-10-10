package com.zyjz.sysmanage.service;

import java.util.List;

import com.zyjz.sysmanage.entity.CalCanalBuilding;
import com.zyjz.sysmanage.entity.CalCanalInfo;
import com.zyjz.sysmanage.entity.CalCanalLengthCalssify;
import com.zyjz.sysmanage.entity.CalCanalMaterial;
import com.zyjz.sysmanage.entity.CalCanalPhoto;
import com.zyjz.sysmanage.entity.CalCanalSluice;
import com.zyjz.sysmanage.entity.CalCanalType;
import com.zyjz.sysmanage.entity.CalCanalUsetype;

public interface CalCanalInfoService {

	public List<CalCanalInfo> findAllCanal();
	public CalCanalInfo findCanalById(String id);
	
	public List<CalCanalInfo> findCanalByPId(String canalParentId);
	
	public int add(CalCanalInfo calCanalInfo);
	
	public int update(CalCanalInfo calCanalInfo);
	
	public int updateCalCanalLengthCalssify(CalCanalLengthCalssify calCanalLengthCalssify);
	
	public CalCanalInfo findCanalByLevel(int level);

	List<CalCanalInfo> findCanalCode(String canalCode);
	
	public CalCanalInfo findCanalByCode(String canalCode);
	
	public List<CalCanalInfo> selectCalCanalInfoById(String id, String canalParentId);
	
	public List<CalCanalPhoto> selectCalCanalPhotoByCanalId(String id);
	
	public int deleteById(String id);
	
	//添加照片
	public int addCanalPhoto(CalCanalPhoto calCanalPhoto);
	//添加高标准长度说明
	public int addCalCanalLengthCalssify(CalCanalLengthCalssify calCanalLengthCalssify);
	
	//查找所有材料
	public List<CalCanalMaterial> finAllCalCanalMaterial();
	//查询所有渠道类型
	public List<CalCanalType> finAllCalCanalType();
	//查询所有用途
	List<CalCanalUsetype> finAllCalCanalUsetype();
	
	public CalCanalLengthCalssify findCalCanalLengthCalssifyByCanalId(String canalId);
	
	public List<CalCanalPhoto> findAllPhotoByCanalId(String canalId);
	
	public CalCanalPhoto findCanalPhotoById(String id);
	
	public int updateCanalPhoto(CalCanalPhoto calCanalPhoto);
	
	public int deleteCanalPhotoById(String id);
	
	public int deleteCanalBuildingById(String id);
	
	public List<CalCanalBuilding> selectCalCanalBuildingByCanalId(String id);
	
	public int addCanalBuilding(CalCanalBuilding calCanalBuilding);
	
	public CalCanalBuilding findCanalBuildingById(String id);
	
	public int updateCanalBuilding(CalCanalBuilding calCanalBuilding);
	
	public int addCanalSluice(CalCanalSluice calCanalSluice);
	
	public CalCanalSluice findCanalSluiceById(String id);
	
	public int updateCanalsluice(CalCanalSluice calCanalSluice);
	
	public List<CalCanalSluice> selectCalCanalSluiceByCanalId(String id);
	
	public int deleteCanalSluiceById(String id);
	
	public List<CalCanalInfo> findCanalsByLevel(int canallevelCode);
	
	public List<CalCanalInfo> findAllCanalsByWaterAreaCode(String waterAreaCode);
	
	public CalCanalInfo findMinCode();
	
	List<CalCanalInfo> selectByPrimaryKey(String id,String waterCode);
	/**
	 * @Title: findCanalsInfoById
	 * @Description: 更据id查询他以及他的子级
	 * @param: @param id
	 * @param: @return
	 * @return: List<CalCanalInfo>
	 * @throws
	 */
	public List<CalCanalInfo> findCanalsByIds(List<String> ids);
	
	public CalCanalInfo slectMin();
	
	CalCanalInfo selectCanalName(String canalName);

	/**
	 * 根据渠道编码和权限级别查找最后一个子行政区
	 * @param code
	 * @param level
	 * @return
	 */
	CalCanalInfo selectChildCalCanalByCode(String code, String level);
	//查询父id下子集
	List<CalCanalInfo> getcalList(List<String> list);
    //渠道闸门信息查询
	CalCanalSluice selectByPrimaryKey(String id);

	//查询渠道闸门信息
	List<CalCanalInfo> getsluiceList(List<CalCanalInfo> list);
	List<CalCanalInfo> getphotoList(List<CalCanalInfo> list);
	//渠道建筑物信息
	List<CalCanalInfo> getbulidingList(List<CalCanalInfo> list);
	//根据水管区Id查询渠道信息
    List<CalCanalInfo> findCanalsBySysWaterAreaCode(List<String> sysWaterAreaIdList);

    //根据行政区Id查询渠道信息
    List<CalCanalInfo> findCanalsBySysAreaCode(List<String> sysAreaIdList);

    //单独修改渠道建筑物照片
	public int updateCanalBuildingImage(CalCanalBuilding calCanalBuilding);

	List<CalCanalInfo> findSubsetInfoByCanalCode(String canalCode);
}
