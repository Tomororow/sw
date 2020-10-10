package com.zyjz.video.service;

import java.util.List;

import com.zyjz.video.entity.SiteVideoInfo;

/**
 * @ClassName: SiteVideoInfoService
 * @Description: 视频站点管理service接口
 * @Author: zhaojx
 * @Date: 2018年3月9日 下午4:20:45
 */
public interface SiteVideoInfoService {
	
	/**
	 * @Title: deleteByPrimaryKey 
	 * @Description: 根据主键删除
	 * @param: @param id
	 * @return: int
	 */
    int deleteByPrimaryKey(String id);

    /**
     * @Title: insert
     * @Description: 新增全部信息
     * @param: @param record
     * @return: int
     */
    int insert(SiteVideoInfo record);

    /**
     * @Title: insertSelective 
     * @Description: 有选择性的新增信息
     * @param: @param record
     * @return: int
     */
    int insertSelective(SiteVideoInfo record);

    /**
     * @Title: selectByPrimaryKey 
     * @Description: 根据主键查询
     * @param: @param id
     * @return: SysArea
     */
    SiteVideoInfo selectByPrimaryKey(String id);

    /**
     * @Title: updateByPrimaryKeySelective 
     * @Description: 根据主键有选择性更新信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKeySelective(SiteVideoInfo record);

    /**
     * @Title: updateByPrimaryKey 
     * @Description: 根据主键更新信息
     * @param: @param record
     * @return: int
     */
    int updateByPrimaryKey(SiteVideoInfo record);
    
    /**
     * @Title: getVideosByCanalCode
     * @Description: 根据渠道编码获取视频站信息
     * @param: @param canalCode
     * @return: List<SiteVideoInfo>
     */
    List<SiteVideoInfo> getVideosByCanalCode(String canalCode);

    /**
     * 查询出所有水位站下的视频站信息
     * @Title: findSiteVideoByCanalCodes
     * @Description: 
     * @param: @param canalCodes
     * @param: @return
     * @return: List<SiteVideoInfo>
     * @throws
     */
	List<SiteVideoInfo> findSiteVideoByCanalCodes(List<String> canalCodes);
	
	/**
	 * 查询出所有水位站下的视频站信息
	 * @Title: findSiteVideoByCanalCodeJoin
	 * @Description: 
	 * @param: @param canalCode
	 * @param: @return
	 * @return: List<SiteVideoInfo>
	 * @throws
	 */
	List<SiteVideoInfo> findSiteVideoByCanalCodeJoin(String canalCode);

	SiteVideoInfo byDeviceSerialInfo(String deviceSerial);
	
	/**
	 * 更新萤石云accessToken
	 * @Title: updateAccessToken
	 * @Description: 
	 * @param: @param accessToken
	 * @param: @return
	 * @return: int
	 * @throws
	 */
	 int updateAccessToken(String accesstoken);
	 
	 
	 /**
		 * 根据渠道编码获取视频站信息
		 * @Title: getVideoInfoBySviCanalCode
		 * @Description: 
		 * @param: @param sviCanalCode
		 * @param: @return
		 * @return: SiteVideoInfo
		 * @throws
		 */
		SiteVideoInfo getVideoInfoBySviCanalCode(String sviCanalCode);
	
		/**
		 * 获取已有的AccessToken
		 * @Title: getExistingAccessToken
		 * @Description: 
		 * @param: @return
		 * @return: String
		 * @throws
		 */
		String getExistingAccessToken();

	/**
	 * 查询所有视频站
	 * @return
	 */
	List<SiteVideoInfo> findAllSiteVideoInfo();
}