package com.zyjz.user.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zyjz.user.dao.SysPermissionMapper;
import com.zyjz.user.entity.SysPermission;
import com.zyjz.user.entity.SysPermissionVO;
import com.zyjz.user.service.PermissionService;

@Service("PermissionService")
public class PermissionServiceImpl implements PermissionService{
	
	@Autowired
	SysPermissionMapper sysPermissionMapper;

	@Override
	public List<SysPermission> findAllPermission() {
		return sysPermissionMapper.findAllPermission();
	}

	@Override
	public int addPermission(SysPermission sysPermission) {
		return sysPermissionMapper.insertSelective(sysPermission);
	}

	@Override
	public SysPermission findPermissionById(String id) {
		return sysPermissionMapper.selectByPrimaryKey(id);
	}


	
	

	@Override
	public List<SysPermissionVO> findAllPermissionVO() {
		// 查询所有目录根据状态
		List<SysPermission> sysPermissionList = sysPermissionMapper.findPermissionByMenuLevel(1);
		
		List<SysPermissionVO> sysPermissionVOList = new ArrayList<>();
		for(int i=0;i<sysPermissionList.size();i++){
			SysPermissionVO sysPermissionVO = new SysPermissionVO();
			BeanUtils.copyProperties(sysPermissionList.get(i), sysPermissionVO);
			List<SysPermission> sysPermissionList2 = sysPermissionMapper.findPermissionByPId(sysPermissionList.get(i).getId());
			sysPermissionVO.setSysChildsPermissions(sysPermissionList2);
			sysPermissionVOList.add(sysPermissionVO);
		}
		

		// 查找该角色拥有的权限
		//RoleMenu queryRoleMenu = new RoleMenu();
		//queryRoleMenu.setRoleId(roleId);
		//List<RoleMenu> roleMenus = roleMenuMapper.selectList(new EntityWrapper<RoleMenu>(queryRoleMenu));

		//List<RoleMenuVO> roleMenuVOs = new ArrayList<>();

		// 遍历目录，设置该角色是否选中该目录
		//List<SysPermissionVO> sysPermissionVOList = new ArrayList<>();
		
		//for(int i=0;i<sysPermissionList.size();i++){
			/*SysPermissionVO sysPermissionVO = new SysPermissionVO();
			BeanUtils.copyProperties(sysPermissionList.get(i), sysPermissionVO);
			
			
			
			
			if()
			sysPermissionVO.setSysPermissions(sysPermissionList);
			sysPermissionVOList.add(sysPermissionVO);
		}*/
		return sysPermissionVOList;
	}

	@Override
	public List<SysPermission> findMenuList(String roleId, Integer menuLevel) {
		return sysPermissionMapper.findMenuList(roleId,menuLevel);
	}

	@Override
	public int updatePermission(SysPermission sysPermission) {
		return sysPermissionMapper.updateByPrimaryKeySelective(sysPermission);
	}

	@Override
	public List<SysPermission> findPermissionByPId(String id) {
		return sysPermissionMapper.findPermissionByPId(id);
	}

	@Override
	public List<SysPermission> findPermissionByIds(List<String> sysPermissionIds) {
		
		return sysPermissionMapper.findPermissionByIds(sysPermissionIds);
	}

	@Override
	public int deleteById(String id) {
		return sysPermissionMapper.deleteByPrimaryKey(id);
	}
}