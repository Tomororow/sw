package com.zyjz.plan.entity;

import java.math.BigDecimal;

import cn.afterturn.easypoi.excel.annotation.Excel;
/**
 * 
 * @ClassName: DistWaterPlanExcel
 * @Description: 
 * @Author: liuhainian
 * @Date: 2018年5月24日 下午3:05:37
 */
public class DistWaterPlanExcel {
	
		@Excel(name="姓名",orderNum="1")
		private String name;
		
		@Excel(name="电话",orderNum="2")
		private String phonenumber;
		
		@Excel(name="帐号",orderNum="3")
	    private String account;
	    
		@Excel(name="密码",orderNum="4")
	    private String password;
	    
		@Excel(name="水权面积",orderNum="5")
	    private BigDecimal waterRightArea;
	    
		@Excel(name="实有面积",orderNum="6")
	    private BigDecimal realArea;
	    
		@Excel(name="详细地址",orderNum="7")
	    private String address;
	    
		@Excel(name="备注",orderNum="8")
	    private String dwpcRemark;
		
		@Excel(name="所属区域",orderNum="9")
	    private String  comArea;

		public DistWaterPlanExcel(String name, String phonenumber,
				String account, String password, BigDecimal waterRightArea,
				BigDecimal realArea, String address, String dwpcRemark,
				String comArea) {
			super();
			this.name = name;
			this.phonenumber = phonenumber;
			this.account = account;
			this.password = password;
			this.waterRightArea = waterRightArea;
			this.realArea = realArea;
			this.address = address;
			this.dwpcRemark = dwpcRemark;
			this.comArea = comArea;
		}
		
		

		public DistWaterPlanExcel() {
			super();
		}



		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getPhonenumber() {
			return phonenumber;
		}

		public void setPhonenumber(String phonenumber) {
			this.phonenumber = phonenumber;
		}

		public String getAccount() {
			return account;
		}

		public void setAccount(String account) {
			this.account = account;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public BigDecimal getWaterRightArea() {
			return waterRightArea;
		}

		public void setWaterRightArea(BigDecimal waterRightArea) {
			this.waterRightArea = waterRightArea;
		}

		public BigDecimal getRealArea() {
			return realArea;
		}

		public void setRealArea(BigDecimal realArea) {
			this.realArea = realArea;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getDwpcRemark() {
			return dwpcRemark;
		}

		public void setDwpcRemark(String dwpcRemark) {
			this.dwpcRemark = dwpcRemark;
		}

		public String getComArea() {
			return comArea;
		}

		public void setComArea(String comArea) {
			this.comArea = comArea;
		}
		

		
}
