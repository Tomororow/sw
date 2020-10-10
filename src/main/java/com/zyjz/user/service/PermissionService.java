package com.zyjz.user.service;

import java.util.List;

import com.zyjz.user.entity.SysPermission;
import com.zyjz.user.entity.SysPermissionVO;
import org.apache.ibatis.annotations.Param;

public interface PermissionService {
	public List<SysPermission> findAllPermission();

	public int addPermission(SysPermission sysPermission);

	public SysPermission findPermissionById(String id);
	
	public List<SysPermissionVO> findAllPermissionVO();

	List<SysPermission> findMenuList(String roleId, Integer menuLevel);
	
	/**
	 * @Title: updatePermission
	 * @Description: 更新权限==renww
	 * @param: @param sysPermission
	 * @param: @return
	 * @return: int
	 * @throws
	 */
	int updatePermission(SysPermission sysPermission);
	
	/**
	 * @Title: findPermissionByPId
	 * @Description: 根据父id查询子权限==renww
	 * @param: @param id
	 * @param: @return
	 * @return: List<SysPermission>
	 * @throws
	 */
	List<SysPermission>  findPermissionByPId(String id);
	/**
	 * @Title: findPermissionByIds
	 * @Description: 更据id集合查询权限
	 * @param: @param sysPermissionIds
	 * @param: @return
	 * @return: List<SysPermission>
	 * @throws
	 */
	List<SysPermission> findPermissionByIds(List<String> sysPermissionIds);
	/**
	 * @Title: delete
	 * @Description: 更据id删除
	 * @param: @param id
	 * @param: @return
	 * @return: int
	 * @throws
	 */
	int deleteById(String id);
	
}