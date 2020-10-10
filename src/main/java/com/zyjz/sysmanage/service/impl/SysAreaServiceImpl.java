package com.zyjz.sysmanage.service.impl;

import java.util.ArrayList;
import java.util.Map;
import java.util.List;

import com.zyjz.sysmanage.entity.SysWaterArea;
import com.zyjz.utils.dataSource.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sysmanage.dao.SysAreaMapper;
import com.zyjz.sysmanage.entity.SysArea;
import com.zyjz.sysmanage.service.SysAreaService;

/**
 * @ClassName: SysAreaServiceImpl 
 * @Description: 行政区域service实现类
 * @Author: zhaojx
 * @Date: 2017年12月21日 上午10:29:31
 */
@Service("sysAreaService")
public class SysAreaServiceImpl implements SysAreaService{
	
	@Autowired
	private SysAreaMapper sysAreaMapper;

	@Override
	public int deleteByPrimaryKey(String ids) {
		int result = 0;
		if(ids != null){
			String[] idArray = ids.split(",");
			for (int i = 0; i < idArray.length; i++) {
				result = sysAreaMapper.deleteByPrimaryKey(idArray[i]);
			}
		}
		return result;
	}

	@Override
	public int insert(SysArea record) {
		return sysAreaMapper.insert(record);
	}

	@Override
	public int insertSelective(SysArea record) {
		return sysAreaMapper.insertSelective(record);
	}

	@Override
	public SysArea selectByPrimaryKey(String id) {
		return sysAreaMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(SysArea record) {
		return sysAreaMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(SysArea record) {
		return sysAreaMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<SysArea> getAllSysAreaInfo() {
		return sysAreaMapper.getAllSysAreaInfo();
	}

	@Override
	public List<SysArea> getAreasList(List<String> list) {
		return sysAreaMapper.getAreasList(list);
	}
	
	/** rww */
	@Override
	public List<SysArea> findAreaByLevel(int level) {
		List<SysArea> sysArea = sysAreaMapper.findAreaByLevel(level);
		return sysArea;
	}
	
	@Override
	public SysArea findAreaById(String id) {
		SysArea sysArea = sysAreaMapper.selectByPrimaryKey(id);
		return sysArea;
	}
	
	@Override
	public List<SysArea> findAreaByPId(String id) {
		return sysAreaMapper.findAreaByPId(id);
	}

	@Override
	public String getParentAreaByLevel(int level) {
		return sysAreaMapper.getParentAreaByLevel(level);
	}

	@Override
	public SysArea findAreaBySysareaCode(String areaCode) {
		return sysAreaMapper.findAreaBySysareaCode(areaCode);
	}

	List<String> ids = new ArrayList<>();
	@Override
	public List<SysArea> findSonAreasByCode(String sysareaCode) {
		SysArea sysArea = sysAreaMapper.findAreaBySysareaCode(sysareaCode);
		getSonSysAreas(sysArea.getId());
		ids.add(sysArea.getId());
		List<SysArea> sysAreaList = sysAreaMapper.findAreasByIds(ids);
		ids.clear();
		return sysAreaList;
	}
	

	//更据id查他的子级目录
	public void getSonSysAreas(String id){
			//List<String> canalCodes = new ArrayList<String>();
			List<SysArea>  sysAreaList = sysAreaMapper.findAreaByPId(id);
			if(sysAreaList!=null&&sysAreaList.size()>0){
				for(int i=0;i<sysAreaList.size();i++){
					ids.add(sysAreaList.get(i).getId());
					List<SysArea>  sysAreaList2 = sysAreaMapper.findAreaByPId(sysAreaList.get(i).getId());
					if(sysAreaList2!=null&&sysAreaList2.size()>0){
						getSonSysAreas(sysAreaList.get(i).getId());
					}
				}
			}
	}
	
	

	@Override
	public SysArea findBySysareaCode(String id) {
		return sysAreaMapper.findBySysareaCode(id);
	}

	@Override
	public List<SysArea> findAllAreas() {
		return sysAreaMapper.findAllAreas();
	}

	@Override
	public List<SysArea> selectParentId(String code) {
		return sysAreaMapper.selectParentId(code);
	}

	@Override
	public List<SysArea> selectByIdOrCode(String id, String areaCode){
		return sysAreaMapper.selectByIdOrCode(id,areaCode);
	}

	@Override
	public SysArea selectChildSysAreaByCode(String code, String level) {
		return sysAreaMapper.selectChildSysAreaByCode(code, level);
	}
}