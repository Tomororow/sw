package com.zyjz.plan.entity;

import java.io.Serializable;
import java.util.Date;

public class ForecastWater implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String tableNo;
    
    private String canalCode;

    private String canalname;

    private Integer year;

    private Date createTime;

    private String createPeople;

    private String remark;

    public String getCanalname() {
        return canalname;
    }

    public void setCanalname(String canalname) {
        this.canalname = canalname;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTableNo() {
        return tableNo;
    }

    public void setTableNo(String tableNo) {
        this.tableNo = tableNo == null ? null : tableNo.trim();
    }

    
    
    public String getCanalCode() {
		return canalCode;
	}

	public void setCanalCode(String canalCode) {
		this.canalCode = canalCode;
	}

	public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreatePeople() {
        return createPeople;
    }

    public void setCreatePeople(String createPeople) {
        this.createPeople = createPeople == null ? null : createPeople.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}