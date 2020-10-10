package com.zyjz.sitemanage.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sitemanage.dao.MeteorSurveySiteMapper;
import com.zyjz.sitemanage.entity.MeteorSurveySite;
import com.zyjz.sitemanage.service.MeteorSurveySiteService;
import com.zyjz.sitemanage.web.MeteorTreeMenu;
import com.zyjz.sysmanage.dao.SysAreaMapper;
import com.zyjz.sysmanage.entity.SysArea;
@Service("meteorSurveySiteService")
public class MeteorSurveySiteServiceImpl implements MeteorSurveySiteService {
	@Autowired
	private MeteorSurveySiteMapper meteorSurveySiteMapper;
	
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(SysArea.class); 
	
	@Autowired
	private SysAreaMapper sysAreaMapper;
	
	@Override
	public int deleteByPrimaryKey(String id) {
		return meteorSurveySiteMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(MeteorSurveySite record) {
		return meteorSurveySiteMapper.insert(record);
	}

	@Override
	public int insertSelective(MeteorSurveySite record) {
		return meteorSurveySiteMapper.insertSelective(record);
	}

	@Override
	public MeteorSurveySite selectByPrimaryKey(String id) {
		return meteorSurveySiteMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(MeteorSurveySite record) {
		return meteorSurveySiteMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(MeteorSurveySite record) {
		return meteorSurveySiteMapper.updateByPrimaryKey(record);
	}
	
	@Override
	public List<MeteorTreeMenu> selectTreeImpl() {
		//查询全部数据
		List<MeteorTreeMenu> InvokeList = invokeImpl();
		//查找级别最小的值
		List<Integer> minList = new ArrayList<>();
		for(MeteorTreeMenu sysArea:InvokeList){

			minList.add(sysArea.getAreaLevel());
		}
		List<MeteorTreeMenu> list = new ArrayList<>();
		try{
			for(MeteorTreeMenu sysArea:InvokeList){
				if(sysArea.getAreaLevel() ==Collections.min(minList)){
					list.add(sysArea);
				}
			}
			for(MeteorTreeMenu ysa:list){
				ysa.setChildren(recursion(ysa.getId(),InvokeList));
			}
			logger.info("查询行政区成功");
		}catch(Exception e){
			logger.error("查询行政区失败");
		}
		return list;
	}
	
	 List<MeteorTreeMenu> invokeImpl(){
		 List<SysArea> iklsList = sysAreaMapper.findAllAreas();
		List<MeteorTreeMenu> InvokList = new ArrayList<>();
		for(SysArea saa:iklsList){
			MeteorTreeMenu mtm = new MeteorTreeMenu();
			mtm.setAreaCode(saa.getAreaCode());
			mtm.setAreaLevel(saa.getAreaLevel());
			mtm.setId(saa.getId());
			mtm.setLabel(saa.getAreaName());
			mtm.setParentAreaId(saa.getParentAreaId());
			mtm.setParentAreaName(saa.getParentAreaName());
			mtm.setSaCreateTime(saa.getSaCreateTime());
			mtm.setSaEditTime(saa.getSaEditTime());
			mtm.setSaRemark(saa.getSaRemark());
			InvokList.add(mtm);
		}
		
		return InvokList;
	}
	
	 /*递归方法*/
	
	private List<MeteorTreeMenu> recursion(String id,List<MeteorTreeMenu>menus){
		List<MeteorTreeMenu> menuList = new ArrayList<>();
		//将传过来的id与子菜单的parentAreaId比较
		for(MeteorTreeMenu treeMenu:menus){
			if(id!=null){
				if(id.equals(treeMenu.getParentAreaId())){
					menuList.add(treeMenu);
				}
			}
		}
		//把子菜单再循环一遍
		for(MeteorTreeMenu treeMenu:menuList){

			treeMenu.setChildren(recursion(treeMenu.getId(),menus));
		}
		//退出递归
		if(menuList.size()==0){
			return null;
		}
		return menuList;
		
	}

	@Override
	public List<MeteorSurveySite> selectAdministrativeCoding(List<String> code) {
		return meteorSurveySiteMapper.selectAdministrativeCoding(code);
	}


}
