package com.zyjz.sitemanage.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.sitemanage.dao.WaterSurveySiteMapper;
import com.zyjz.sitemanage.web.WaterTreeMenu;
import com.zyjz.sitemanage.entity.WaterSurveySite;
import com.zyjz.sitemanage.service.WaterSurveySiteService;
import com.zyjz.sysmanage.entity.CalCanalInfo;
import com.zyjz.sysmanage.service.CalCanalInfoService;
@Service("waterSurveySiteService")
public class WaterSurveySiteServiceImpl implements WaterSurveySiteService {
	@Autowired
	private WaterSurveySiteMapper waterSurveySiteMapper;
	
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(WaterSurveySite.class); 
	
	@Autowired
	private CalCanalInfoService calCanalInfoService;
	
	@Override
	public int deleteByPrimaryKey(String id) {
		
		return waterSurveySiteMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(WaterSurveySite record) {
		
		return waterSurveySiteMapper.insert(record);
	}

	@Override
	public int insertSelective(WaterSurveySite record) {
		
		return waterSurveySiteMapper.insertSelective(record);
	}

	@Override
	public WaterSurveySite selectByPrimaryKey(String id) {
		
		return waterSurveySiteMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(WaterSurveySite record) {
		
		return waterSurveySiteMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(WaterSurveySite record) {
		
		return waterSurveySiteMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<WaterSurveySite> findIdList(Long id) {
		
		return waterSurveySiteMapper.findIdList(id);
	}
	//查询渠道列表
	public  List<WaterTreeMenu> seet(){
	
	List<WaterTreeMenu> TreeList = sysAreaList();
	//查找级别字段的最小值
	List<Integer> rankList = new ArrayList<>();
	for(WaterTreeMenu menu:TreeList){
		rankList.add(menu.getCanallevelCode());
	}
	List<WaterTreeMenu> list = new ArrayList<>();
	try{
		//先找出一级菜单
		for(int i = 0;i<TreeList.size();i++){
			if(TreeList.get(i).getCanallevelCode() == Collections.min(rankList)){
				list.add(TreeList.get(i));
			}
		}
		//为一级菜单设置子菜单
		for(WaterTreeMenu treeMenu:list){
			treeMenu.setChildren(recursion(treeMenu.getId(),TreeList));
		}
		logger.info("查询渠道成功!");
	}catch(Exception e){
		logger.error("渠道查询失败！");
	}
			return list;
		}
	
	//调用方法
	 List<WaterTreeMenu> sysAreaList(){
		List<CalCanalInfo> listCalCanalInfo = calCanalInfoService.findAllCanal();
		List<WaterTreeMenu> listTreeMenu = new ArrayList<WaterTreeMenu>();
		for(CalCanalInfo calCanalInfo:listCalCanalInfo){
			WaterTreeMenu threeMenu =  new WaterTreeMenu();
				threeMenu.setCanalAddr(calCanalInfo.getCanalAddr());
				threeMenu.setCanalAngle(calCanalInfo.getCanalAngle());
				threeMenu.setCanalBuildTime(calCanalInfo.getCanalBuildTime());
				threeMenu.setCanalCode(calCanalInfo.getCanalCode());
				threeMenu.setCanalDesignFlow(calCanalInfo.getCanalDesignFlow());
				threeMenu.setCanalHeight(calCanalInfo.getCanalHeight());
				threeMenu.setCanalIrrigatedAcreage(calCanalInfo.getCanalIrrigatedAcreage());
				threeMenu.setCanalLength(calCanalInfo.getCanalLength());
				threeMenu.setCanallevelCode(calCanalInfo.getCanallevelCode());
				threeMenu.setCanalmaterialCode(calCanalInfo.getCanalmaterialCode());
				threeMenu.setLabel(calCanalInfo.getCanalName());
				threeMenu.setCanalParentId(calCanalInfo.getCanalParentId());
				threeMenu.setCanalPerfectRate(calCanalInfo.getCanalPerfectRate());
				threeMenu.setCanalPhoto(calCanalInfo.getCanalPhoto());
				threeMenu.setCanalPhotoCode(calCanalInfo.getCanalPhotoCode());
				threeMenu.setCanalRatio(calCanalInfo.getCanalRatio());
				threeMenu.setCanalRealityFlow(calCanalInfo.getCanalRealityFlow());
				threeMenu.setCanalRepairTime(calCanalInfo.getCanalRepairTime());
				threeMenu.setCanalRough(calCanalInfo.getCanalRough());
				threeMenu.setCanalSlope(calCanalInfo.getCanalSlope());
				threeMenu.setCanaltypeCode(calCanalInfo.getCanaltypeCode());
				threeMenu.setCanalusetypeCode(calCanalInfo.getCanalusetypeCode());
				threeMenu.setCanalWight(calCanalInfo.getCanalWight());
				threeMenu.setCciCreateTime(calCanalInfo.getCciCreateTime());
				threeMenu.setCciEditTime(calCanalInfo.getCciEditTime());
				threeMenu.setCciRemark(calCanalInfo.getCciRemark());
				threeMenu.setDecisionArea(calCanalInfo.getDecisionArea());
				threeMenu.setId(calCanalInfo.getId());
				threeMenu.setIrrigatedAreaName(calCanalInfo.getIrrigatedAreaName());
				threeMenu.setMathing(calCanalInfo.getMathing());
				threeMenu.setSysareaCode(calCanalInfo.getSysareaCode());
				threeMenu.setSysareaId(calCanalInfo.getSysareaId());
				threeMenu.setSyswaterareaCode(calCanalInfo.getSyswaterareaCode());
				threeMenu.setSyswaterareaId(calCanalInfo.getSyswaterareaId());
				listTreeMenu.add(threeMenu);
		}
		return listTreeMenu;
	}
	/*递归方法*/
	
	private List<WaterTreeMenu> recursion(String id,List<WaterTreeMenu>menus){
		List<WaterTreeMenu> menuList = new ArrayList<>();
		//将传过来的id与子菜单的parentAreaId比较
		for(WaterTreeMenu treeMenu:menus){
			if(id!=null){
				if(id.equals(treeMenu.getCanalParentId())){
					menuList.add(treeMenu);
				}
			}
		}
		//把子菜单再循环一遍
		for(WaterTreeMenu treeMenu:menuList){

			treeMenu.setChildren(recursion(treeMenu.getId(),menus));
		}
		//退出递归
		if(menuList.size()==0){
			return null;
		}
		return menuList;
		
	}

	@Override
	public List<WaterSurveySite> findRiverwayCoding(List<String> code) {
		
		return waterSurveySiteMapper.findRiverwayCoding(code);
	}

	@Override
	public List<WaterSurveySite> findRiverwayCodingJoin(String canalCode) {
		return waterSurveySiteMapper.findRiverwayCodingJoin(canalCode);
	}

	@Override
	public List<WaterSurveySite> selectArea(List<String> sysAreaCodeList){
		return waterSurveySiteMapper.selectArea(sysAreaCodeList);
	}
	
}
