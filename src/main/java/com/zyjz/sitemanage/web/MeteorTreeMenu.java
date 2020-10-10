package com.zyjz.sitemanage.web;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class MeteorTreeMenu implements Serializable {
		
	/** 
	 * @Fields: serialVersionUID: 
	 */ 
	
	private static final long serialVersionUID = 1L;
		// 主键ID
		private String id;
		// 行政区域编码
	    private String areaCode;
	    // 行政区域名称
	    private String label;
	    // 行政区域级别
	    private Integer areaLevel;
	    // 所属父行政区域
	    private String parentAreaId;
	    //临时字段（可忽略不计）
	    private List<MeteorTreeMenu> children;
	    // 创建时间
	    private Date saCreateTime;
	    // 上次修改时间
	    private Date saEditTime;
	    // 备注
	    private String saRemark;
	    // 行政区域名称    自定义包装
	    private String parentAreaName;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getAreaCode() {
			return areaCode;
		}
		public void setAreaCode(String areaCode) {
			this.areaCode = areaCode;
		}
		public String getLabel() {
			return label;
		}
		public void setLabel(String label) {
			this.label = label;
		}
		public Integer getAreaLevel() {
			return areaLevel;
		}
		public void setAreaLevel(Integer areaLevel) {
			this.areaLevel = areaLevel;
		}
		public String getParentAreaId() {
			return parentAreaId;
		}
		public void setParentAreaId(String parentAreaId) {
			this.parentAreaId = parentAreaId;
		}
		public List<MeteorTreeMenu> getChildren() {
			return children;
		}
		public void setChildren(List<MeteorTreeMenu> children) {
			this.children = children;
		}
		public Date getSaCreateTime() {
			return saCreateTime;
		}
		public void setSaCreateTime(Date saCreateTime) {
			this.saCreateTime = saCreateTime;
		}
		public Date getSaEditTime() {
			return saEditTime;
		}
		public void setSaEditTime(Date saEditTime) {
			this.saEditTime = saEditTime;
		}
		public String getSaRemark() {
			return saRemark;
		}
		public void setSaRemark(String saRemark) {
			this.saRemark = saRemark;
		}
		public String getParentAreaName() {
			return parentAreaName;
		}
		public void setParentAreaName(String parentAreaName) {
			this.parentAreaName = parentAreaName;
		}
	    
	    
}
