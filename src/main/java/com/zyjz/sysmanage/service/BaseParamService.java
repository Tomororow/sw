package com.zyjz.sysmanage.service;

import java.util.List;

import com.zyjz.sysmanage.entity.CalCanalMaterial;
import com.zyjz.sysmanage.entity.CalCanalType;
import com.zyjz.sysmanage.entity.CalCanalUsetype;
import com.zyjz.sysmanage.entity.SiteDeviceModel;

public interface BaseParamService {
	/**
	 * <p>Description: 渠道衬砌材料添加</p>
	 * @author rww
	 *	@data 2018年1月15日 上午8:13:19
	 */
	public int addCanalMaterial(CalCanalMaterial calCanalMaterial);
	
	public List<CalCanalMaterial> findAllCalCanalMaterial();
	
	public int updateCanalMaterial(CalCanalMaterial calCanalMaterial);
	
	public CalCanalMaterial findCalCanalMaterialById(String id);
	
	public int deleteMaterialById(String id);
	
	public int addCanalType(CalCanalType calCanalType);
	
	public List<CalCanalType> findAllCalCanalType();
	
	public int updateCanalType(CalCanalType calCanalType);
	
	public CalCanalType findCalCanalTypeById(String id);
	
	public int deleteTypeById(String id);
	
	
	
	public int addCanalUsetype(CalCanalUsetype calCanalUsetype);
	
	public List<CalCanalUsetype> findAllCalCanalUsetype();
	
	public int updateCanalUsetype(CalCanalUsetype calCanalUsetype);
	
	public CalCanalUsetype findCalCanalUsetypeById(String id);
	
	public int deleteUseTypeById(String id);
	
	
	public int addSiteDeviceModel(SiteDeviceModel siteDeviceModel);
	
	public List<SiteDeviceModel> findAllSiteDeviceModel();
	
	public int updateSiteDeviceModel(SiteDeviceModel siteDeviceModel);
	
	public SiteDeviceModel findSiteDeviceModelById(String id);
	
	public int deleteSiteDeviceModelById(String id);
	
	 /**
     * 根据设备类型编码查询设备信息
     * @Title: selectByDeviceCode
     * @Description: 
     * @param: @param deviceCode
     * @param: @return
     * @return: SiteDeviceModel
     * @throws
     */
    SiteDeviceModel selectByDeviceCode(Integer integer);
	
	
	
}
