package com.zyjz.sysmanage.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.zyjz.sysmanage.dao.SysWaterAreaMapper;
import com.zyjz.sysmanage.entity.SysWaterArea;
import com.zyjz.sysmanage.service.SysWaterAreaService;

/** <p>Title:SysWaterAreaImpl </p>
 * <p>Description: </p>
 * <p>Company: </p> 
 * @author rww
 *	@data 2017年12月22日 下午5:01:27
 */

@Service("SysWaterAreaService")
public class SysWaterAreaIServicempl implements SysWaterAreaService {

	@Autowired
	SysWaterAreaMapper sysWaterAreaMapper;

	
	@Override
	public List<SysWaterArea> findAllWaterAreas() {
		return sysWaterAreaMapper.findAllWaterAreas();
	}

	@Override
	public List<SysWaterArea> selectByPrimaryWater(String id, String waterCode) {
		return sysWaterAreaMapper.selectByPrimaryWater(id,waterCode);
	}


	@Override
	public SysWaterArea findWaterAreaById(String id) {
		SysWaterArea sysWaterArea = sysWaterAreaMapper.selectByPrimaryKey(id);
		return sysWaterArea;
	}


	
	@Override
	public int add(SysWaterArea sysWaterArea) {
		
		return sysWaterAreaMapper.insertSelective(sysWaterArea);
	}


	@Override
	public List<SysWaterArea> findSonSysWaterAreasByPidAndWaterAreaLevel(
			String pId, int waterAreaLevel) {
		SysWaterArea sysWaterArea = new SysWaterArea();
		sysWaterArea.setParentWaterareaId(pId);
		sysWaterArea.setWaterAreaLevel(waterAreaLevel);
		List<SysWaterArea> sysWaterAreaList = sysWaterAreaMapper.findSonSysWaterAreasByPidAndWaterAreaLevel(sysWaterArea);
		return sysWaterAreaList;
	}


	@Override
	public List<SysWaterArea> findWaterAreaByLevel(int level) {
		List<SysWaterArea> sysWaterArea = sysWaterAreaMapper.findWaterAreaByLevel(level);
		return sysWaterArea;
	}


	@Override
	public List<SysWaterArea> selectByPageNumSize(SysWaterArea sysWaterArea,int a,int b) {
		return null;
	}


	


	@Override
	public PageInfo<SysWaterArea> queryByPage(String id, Integer pageNo,
			Integer pageSize) {
		
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    
	    List<SysWaterArea> list = sysWaterAreaMapper.selectSysWaterAreasById(id,id);
	    //用PageInfo对结果进行包装
	    PageInfo<SysWaterArea> page = new PageInfo<SysWaterArea>(list);
	    return page;
	}


	@Override
	public List<SysWaterArea> selectSysWaterAreasById(String id,String parentWaterareaId) {
		return sysWaterAreaMapper.selectSysWaterAreasById(id,parentWaterareaId);
	}


	@Override
	public List<SysWaterArea> findWaterAreaByPId(String id) {
		
		return sysWaterAreaMapper.findWaterAreaByPId(id);
	}


	@Override
	public int deleteById(String id) {
		return sysWaterAreaMapper.deleteByPrimaryKey(id);
	}


	@Override
	public int updateWaterArea(SysWaterArea sysWaterArea) {
		return sysWaterAreaMapper.updateWaterArea(sysWaterArea);
				
	}


	@Override
	public SysWaterArea findWaterAreaBySyswaterareaCode(String syswaterareaCode) {
		return sysWaterAreaMapper.findBySyswaterareaCode(syswaterareaCode);
	}


	List<String> ids = new ArrayList<>();
	@Override
	public List<SysWaterArea> findSonWaterAreasByCode(String syswaterareaCode) {
		SysWaterArea sysWaterArea = sysWaterAreaMapper.findBySyswaterareaCode(syswaterareaCode);
		getSonSysWaterAreas(sysWaterArea.getId());
		ids.add(sysWaterArea.getId());
		List<SysWaterArea> sysWaterAreaList = sysWaterAreaMapper.findWaterAreasByIds(ids);
		ids.clear();
		return sysWaterAreaList;
	}

	//更据id查他的子级目录
	public void getSonSysWaterAreas(String id){
			//List<String> canalCodes = new ArrayList<String>();
			List<SysWaterArea>  sysWaterAreaList = sysWaterAreaMapper.findWaterAreaByPId(id);
			if(sysWaterAreaList!=null&&sysWaterAreaList.size()>0){
				for(int i=0;i<sysWaterAreaList.size();i++){
					ids.add(sysWaterAreaList.get(i).getId());
					List<SysWaterArea>  sysWaterAreaList2 = sysWaterAreaMapper.findWaterAreaByPId(sysWaterAreaList.get(i).getId());
					if(sysWaterAreaList2!=null&&sysWaterAreaList2.size()>0){
						getSonSysWaterAreas(sysWaterAreaList.get(i).getId());
					}
				}
			}
	}


	@Override
	public List<SysWaterArea> findWaterAreasByIds(List<String> ids) {
		return sysWaterAreaMapper.findWaterAreasByIds(ids);
	}

	@Override
	public List<SysWaterArea> getWaterAreasList(List<String> list) {
		return sysWaterAreaMapper.getWaterAreasList(list);
	}

	@Override
	public int updateByPrimaryKeySelective(SysWaterArea sysWaterArea) {
		return sysWaterAreaMapper.updateByPrimaryKeySelective(sysWaterArea);
	}

	@Override
	public SysWaterArea selectChildSysWaterAreaByCode(String code, String level) {
		return sysWaterAreaMapper.selectChildSysWaterAreaByCode(code, level);
	}
}
