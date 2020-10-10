package com.zyjz.watersupply.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.watersupply.dao.WaterTreeStructureMapper;
import com.zyjz.watersupply.entity.WaterTreeStructure;
import com.zyjz.watersupply.service.WaterTreeStructureService;
@Service("waterTreeStructure")
public class WaterTreeStructureServiceImpl implements WaterTreeStructureService  {
	
	@Autowired
	private WaterTreeStructureMapper waterTreeStructureMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(WaterTreeStructure.class);
	
	
	@Override
	public int deleteByPrimaryKey(String id) {
		
		return waterTreeStructureMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(WaterTreeStructure record) {
		
		return waterTreeStructureMapper.insert(record);
	}

	@Override
	public int insertSelective(WaterTreeStructure record) {
		
		return waterTreeStructureMapper.insertSelective(record);
	}

	@Override
	public WaterTreeStructure selectByPrimaryKey(String id) {
		
		return waterTreeStructureMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(WaterTreeStructure record) {
		
		return waterTreeStructureMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(WaterTreeStructure record) {
		
		return waterTreeStructureMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<WaterTreeStructure> selectCode(String record) {
		
		return waterTreeStructureMapper.selectCode(record);
	}

	//水厂树形菜单
	@Override
	public List<WaterTreeStructure> selectTree(){
		List<WaterTreeStructure> TreeList = waterTreeStructureMapper.selectAll();
		//查找级别字段的最小值
		List<Double> rankList = new ArrayList<>();
		for(WaterTreeStructure menu:TreeList){
			rankList.add(menu.getTreeLevel());
		}
		List<WaterTreeStructure> list = new ArrayList<>();
		try{
			//先找出一级菜单
			for(int i = 0;i<TreeList.size();i++){
				if(TreeList.get(i).getTreeLevel() == Collections.min(rankList)){
					list.add(TreeList.get(i));
				}
			}
			//为一级菜单设置子菜单
			for(WaterTreeStructure treeMenu:list){
				treeMenu.setChildren(recursion(treeMenu.getId(),TreeList));
			}
			logger.info("查询水厂树成功!");
		}catch(Exception e){
			logger.error("查询水厂树失败！");
		}
				return list;
}
	
	/*public List<WaterTreeStructure> all(){
		List<WaterTreeStructure> allList = new ArrayList<>();
		List<WaterTreeStructure> TreeList = waterTreeStructureMapper.selectAll();
		for(WaterTreeStructure list:TreeList){
			WaterTreeStructure wts = new WaterTreeStructure();
			wts.setId(list.getId());
			wts.setLabel(list.getLabel());
			wts.setParentLevelId(list.getParentLevelId());
			wts.setTreeCode(list.getTreeCode());
			wts.setTreeLevel(list.getTreeLevel());
			wts.setTreeRemark(list.getTreeRemark());
			wts.setCreationTime(list.getCreationTime());
			wts.setUpdationTime(list.getUpdationTime());
			allList.add(wts);
		}
		return allList;
		
	}*/
	
		/*递归方法*/
	private List<WaterTreeStructure> recursion(String id,List<WaterTreeStructure>menus){
		List<WaterTreeStructure> menuList = new ArrayList<>();
		//将传过来的id与子菜单的parentAreaId比较
		for(WaterTreeStructure treeMenu:menus){
			if(id!=null){
				if(id.equals(treeMenu.getParentLevelId())){
					menuList.add(treeMenu);
				}
			}
		}
		//把子菜单再循环一遍
		for(WaterTreeStructure treeMenu:menuList){

			treeMenu.setChildren(recursion(treeMenu.getId(),menus));
		}
		//退出递归
		if(menuList.size()==0){
			return null;
		}
		return menuList;
		
	}

	@Override
	public List<WaterTreeStructure> selectAll() {
		
		System.out.println(waterTreeStructureMapper.selectAll().size()+"========================");
		
		return waterTreeStructureMapper.selectAll();
	}

	@Override
	public WaterTreeStructure selectMin() {
		return waterTreeStructureMapper.selectMin();
	}

}
