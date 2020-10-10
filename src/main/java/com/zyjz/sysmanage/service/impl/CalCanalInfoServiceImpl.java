package com.zyjz.sysmanage.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.zyjz.utils.dataSource.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sysmanage.dao.CalCanalBuildingMapper;
import com.zyjz.sysmanage.dao.CalCanalInfoMapper;
import com.zyjz.sysmanage.dao.CalCanalLengthCalssifyMapper;
import com.zyjz.sysmanage.dao.CalCanalMaterialMapper;
import com.zyjz.sysmanage.dao.CalCanalPhotoMapper;
import com.zyjz.sysmanage.dao.CalCanalSluiceMapper;
import com.zyjz.sysmanage.dao.CalCanalTypeMapper;
import com.zyjz.sysmanage.dao.CalCanalUsetypeMapper;
import com.zyjz.sysmanage.entity.CalCanalBuilding;
import com.zyjz.sysmanage.entity.CalCanalInfo;
import com.zyjz.sysmanage.entity.CalCanalLengthCalssify;
import com.zyjz.sysmanage.entity.CalCanalMaterial;
import com.zyjz.sysmanage.entity.CalCanalPhoto;
import com.zyjz.sysmanage.entity.CalCanalSluice;
import com.zyjz.sysmanage.entity.CalCanalType;
import com.zyjz.sysmanage.entity.CalCanalUsetype;
import com.zyjz.sysmanage.service.CalCanalInfoService;

/**
 * <p>Description: 渠道服务</p>
 * <p>Company: </p> 
 * @author rww
 *	@data 2017年12月28日 下午5:32:09
 */
@Service("CalCanaInfoService")
public class CalCanalInfoServiceImpl implements CalCanalInfoService {
	@Autowired
	CalCanalInfoMapper calCanalInfoMapper;
	
	@Autowired
	CalCanalPhotoMapper calCanalPhotoMapper;
	
	@Autowired
	CalCanalLengthCalssifyMapper calCanalLengthCalssifyMapper;
	
	@Autowired
	CalCanalMaterialMapper calCanalMaterialMapper;
	
	@Autowired
	CalCanalTypeMapper calCanalTypeMapper;
	
	@Autowired
	CalCanalUsetypeMapper calCanalUsetypeMapper;
	
	@Autowired
	CalCanalBuildingMapper calCanalBuildingMapper;
	
	@Autowired
	CalCanalSluiceMapper calCanalSluiceMapper;

	@Override
	public List<CalCanalInfo> findAllCanal(){
		return calCanalInfoMapper.findAllCanal();
	}

	@Override
	public CalCanalInfo findCanalById(String id) {
		return calCanalInfoMapper.findCanalById(id);
	}

	@Override
	public int add(CalCanalInfo calCanalInfo) {
		return calCanalInfoMapper.insertSelective(calCanalInfo);
	}
	
	@Override
	public int update(CalCanalInfo calCanalInfo) {
		
		return calCanalInfoMapper.updateByPrimaryKeySelective(calCanalInfo);
	}
	
	
	@Override
	public CalCanalInfo findCanalByLevel(int level) {
		return calCanalInfoMapper.findCanalByLevel(level);
	}

	@Override
	public List<CalCanalInfo> findCanalCode(String canalCode) {
		return calCanalInfoMapper.findCanalCode(canalCode);
	}

	@Override
	public List<CalCanalInfo> selectCalCanalInfoById(String id,
			String canalParentId) {
		 return calCanalInfoMapper.selectCalCanalInfoById(id,canalParentId);
	}

	@Override
	public List<CalCanalPhoto> selectCalCanalPhotoByCanalId(String id) {
		return calCanalPhotoMapper.selectCalCanalPhotoByCanalId(id);
	}
	
	@Override
	public int deleteById(String id) {
		return calCanalInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<CalCanalInfo> findCanalByPId(String canalParentId) {
		return calCanalInfoMapper.findCanalByPId(canalParentId);
	}

	@Override
	public int addCanalPhoto(CalCanalPhoto calCanalPhoto) {
		return calCanalPhotoMapper.insertSelective(calCanalPhoto);
	}

	@Override
	public int addCalCanalLengthCalssify(
			CalCanalLengthCalssify calCanalLengthCalssify) {
		return calCanalLengthCalssifyMapper.insertSelective(calCanalLengthCalssify);
	}

	@Override
	public List<CalCanalMaterial> finAllCalCanalMaterial() {
		return calCanalMaterialMapper.selectAll();
	}

	@Override
	public List<CalCanalType> finAllCalCanalType() {
		return calCanalTypeMapper.selectAll();
	}

	@Override
	public List<CalCanalUsetype> finAllCalCanalUsetype() {
		return calCanalUsetypeMapper.selectAll();
	}

	@Override
	public CalCanalLengthCalssify findCalCanalLengthCalssifyByCanalId(
			String canalId) {
		
		return calCanalLengthCalssifyMapper.findByCanlId(canalId);
	}

	@Override
	public List<CalCanalPhoto> findAllPhotoByCanalId(String canalId) {
		
		
		return calCanalPhotoMapper.findAllByCanalId(canalId);
	}

	@Override
	public int updateCalCanalLengthCalssify(
			CalCanalLengthCalssify calCanalLengthCalssify) {
		
		return calCanalLengthCalssifyMapper.updateByPrimaryKeySelective(calCanalLengthCalssify);
	}

	@Override
	public CalCanalPhoto findCanalPhotoById(String id) {
		return calCanalPhotoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateCanalPhoto(CalCanalPhoto calCanalPhoto) {
		return calCanalPhotoMapper.updateByPrimaryKeySelective(calCanalPhoto);
	}

	@Override
	public int deleteCanalPhotoById(String id) {
		return calCanalPhotoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<CalCanalBuilding> selectCalCanalBuildingByCanalId(String id) {
		return calCanalBuildingMapper.selectCalCanalBuildingByCanalId(id);
	}

	@Override
	public int addCanalBuilding(CalCanalBuilding calCanalBuilding) {
		
		
		return calCanalBuildingMapper.insertSelective(calCanalBuilding);
	}

	@Override
	public int deleteCanalBuildingById(String id) {
		return calCanalBuildingMapper.deleteByPrimaryKey(id);
	}

	@Override
	public CalCanalBuilding findCanalBuildingById(String id) {
		return calCanalBuildingMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateCanalBuilding(CalCanalBuilding calCanalBuilding) {
		
		return calCanalBuildingMapper.updateByPrimaryKeySelective(calCanalBuilding);
	}

	@Override
	public int addCanalSluice(CalCanalSluice calCanalSluice) {
		return calCanalSluiceMapper.insertSelective(calCanalSluice);
	}

	@Override
	public CalCanalSluice findCanalSluiceById(String id) {
		return calCanalSluiceMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateCanalsluice(CalCanalSluice calCanalSluice) {
		return calCanalSluiceMapper.updateByPrimaryKeySelective(calCanalSluice);
	}

	@Override
	public List<CalCanalSluice> selectCalCanalSluiceByCanalId(String id) {
		return calCanalSluiceMapper.selectCalCanalSluiceByCanalId(id);
	}

	@Override
	public int deleteCanalSluiceById(String id) {
		return calCanalSluiceMapper.deleteByPrimaryKey(id);
	}

	@Override
	public CalCanalInfo findCanalByCode(String canalCode) {
		return calCanalInfoMapper.findCanalByCode(canalCode);
	}

	@Override
	public List<CalCanalInfo> findCanalsByLevel(int canallevelCode) {
		return calCanalInfoMapper.findCanalsByLevel(canallevelCode);
	}
	

	
	List<String> ids = new ArrayList<>();
	@Override
	public List<CalCanalInfo> findAllCanalsByWaterAreaCode(String waterAreaCode) {
		
		List<CalCanalInfo> calCanalInfoList =  calCanalInfoMapper.findAllCanalsByWaterAreaCode(waterAreaCode);
		//取最高级的渠道(集合第一个)
		CalCanalInfo calCanalInfo = calCanalInfoList.get(0);
		getSonCanals(calCanalInfo.getId());
		ids.add(calCanalInfo.getId());
		List<CalCanalInfo> calCanalInfoList2 = calCanalInfoMapper.findCanalsByIds(ids);
		ids.clear();
		return  calCanalInfoList2;
	}
	

	//更据id查他的子级目录
	public void getSonCanals(String id){
			//List<String> canalCodes = new ArrayList<String>();
			List<CalCanalInfo>  sysCalCanalInfoList = calCanalInfoMapper.findCanalByPId(id);
			if(sysCalCanalInfoList!=null&&sysCalCanalInfoList.size()>0){
				for(int i=0;i<sysCalCanalInfoList.size();i++){
					ids.add(sysCalCanalInfoList.get(i).getId());
					List<CalCanalInfo>  sysCalCanalInfoList2 = calCanalInfoMapper.findCanalByPId(sysCalCanalInfoList.get(i).getId());
					if(sysCalCanalInfoList2!=null&&sysCalCanalInfoList2.size()>0){
						getSonCanals(sysCalCanalInfoList.get(i).getId());
					}
				}
			}
	}

	@Override
	public List<CalCanalInfo> findCanalsByIds(List<String> ids) {
		
		return calCanalInfoMapper.findCanalsByIds(ids);
	}

	@Override
	public CalCanalInfo findMinCode() {
		return calCanalInfoMapper.findMinCode();
	}

	@Override
	public CalCanalInfo slectMin() {
		return calCanalInfoMapper.slectMin();
	}

	@Override
	public CalCanalInfo selectCanalName(String canalName) {
		return calCanalInfoMapper.selectCanalName(canalName);
	}

	@Override
	public List<CalCanalInfo> selectByPrimaryKey(String id,String canalCode) {
		return calCanalInfoMapper.selectByPrimaryKey(id,canalCode);
	}

	@Override
	public CalCanalInfo selectChildCalCanalByCode(String code, String level) {
		return calCanalInfoMapper.selectChildCalCanalByCode(code, level);
	}

	@Override
	public List<CalCanalInfo> getcalList(List<String> list) {
		return calCanalInfoMapper.getcalList(list);
	}
//渠道闸门信息查询
	@Override
	public CalCanalSluice selectByPrimaryKey(String id) {
		return calCanalSluiceMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<CalCanalInfo> getsluiceList(List<CalCanalInfo> list) {
		return calCanalInfoMapper.getsluiceList(list);
	}

	@Override
	public List<CalCanalInfo> getphotoList(List<CalCanalInfo> list) {
		return calCanalInfoMapper.getphotoList(list);
	}

	@Override
	public List<CalCanalInfo> getbulidingList(List<CalCanalInfo> list) {
		return calCanalInfoMapper.getbulidingList(list);
	}

	@Override
	public List<CalCanalInfo> findCanalsBySysWaterAreaCode(List<String> sysWaterAreaIdList) {
		return calCanalInfoMapper.findCanalsBySysWaterAreaCode(sysWaterAreaIdList);
	}

	@Override
	public List<CalCanalInfo> findCanalsBySysAreaCode(List<String> sysAreaIdList) {
		return calCanalInfoMapper.findCanalsBySysAreaCode(sysAreaIdList);
	}

	@Override
	public int updateCanalBuildingImage(CalCanalBuilding calCanalBuilding) {
		return calCanalBuildingMapper.updateByPrimaryKeySelective(calCanalBuilding);
	}

	@Override
	public List<CalCanalInfo> findSubsetInfoByCanalCode(String canalCode) {
		return calCanalInfoMapper.findSubsetInfoByCanalCode(canalCode);
	}
}
