package com.zyjz.user.service;

import com.zyjz.user.entity.SysUser;
import java.util.List;


public interface UserService {

	public SysUser findSysUserByUserNameAndUserPwd(String userName, String userPwd);

	public List<SysUser> findAllUser();

	public int addSysUser(SysUser sysUser);
	
	/**
	 * @Title: findUserById
	 * @Description: 更据id查询
	 * @param: @param id
	 * @param: @return
	 * @return: SysUser
	 * @throws
	 */
	public SysUser findUserById(String id);
	
	/**
	 * @Title: updateUser
	 * @Description:更新用户renww 
	 * @param: @return
	 * @return: int
	 * @throws
	 */
	public int updateUser(SysUser sysUser);
	
	/**
	 * @Title: deleteUserById
	 * @Description: 根据id删除
	 * @param: @param id
	 * @param: @return
	 * @return: int
	 * @throws
	 */
	public int deleteUserById(String id);

	/**
	 *
	 * @param waterAreaCode
	 * @return
	 */
	SysUser selectBySysWaterAreaCode(String waterAreaCode);

	/**
	 * 取得canalCode
	 * @param areaCode 行政区code
	 * @param waterAreaCode 水管区code
	 * @return
	 */
	SysUser getCanalCode(String areaCode,String waterAreaCode);

}