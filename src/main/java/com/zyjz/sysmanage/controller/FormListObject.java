package com.zyjz.sysmanage.controller;

import java.io.Serializable;
import java.util.ArrayList;

import com.zyjz.sysmanage.entity.CanalFlowHight;
import com.zyjz.sysmanage.entity.SiteWaterInfo;

public class FormListObject implements Serializable{
	  
	
	private static final long serialVersionUID = 1L;
	
	private ArrayList<CanalFlowHight> canalFlowHightList;
	
	private SiteWaterInfo siteWaterInfo;
	
	public ArrayList<CanalFlowHight> getCanalFlowHightList() {
		return canalFlowHightList;
	}
	public void setCanalFlowHightList(ArrayList<CanalFlowHight> canalFlowHightList) {
		this.canalFlowHightList = canalFlowHightList;
	}
	public SiteWaterInfo getSiteWaterInfo() {
		return siteWaterInfo;
	}
	public void setSiteWaterInfo(SiteWaterInfo siteWaterInfo) {
		this.siteWaterInfo = siteWaterInfo;
	}
	 
	 
}
