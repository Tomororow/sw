package com.zyjz.plan.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class WaterAuota implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private String id;

    private Integer year;

    private String soilTypeCode;

    private String cropsTypeCode;

    private String cropsGrowthCycle;

    private BigDecimal waterQuota;

    private Date createTime;

    private String remark;
    
    private String areaCode;

    private String comm1;

    private String comm2;

    private String comm3;

    private String comm4;

    private String comm5;

    private String comm6;
    
    
    public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getComm1() {
		return comm1;
	}

	public void setComm1(String comm1) {
		this.comm1 = comm1;
	}

	public String getComm2() {
		return comm2;
	}

	public void setComm2(String comm2) {
		this.comm2 = comm2;
	}

	public String getComm3() {
		return comm3;
	}

	public void setComm3(String comm3) {
		this.comm3 = comm3;
	}

	public String getComm4() {
		return comm4;
	}

	public void setComm4(String comm4) {
		this.comm4 = comm4;
	}

	public String getComm5() {
		return comm5;
	}

	public void setComm5(String comm5) {
		this.comm5 = comm5;
	}

	public String getComm6() {
		return comm6;
	}

	public void setComm6(String comm6) {
		this.comm6 = comm6;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public String getSoilTypeCode() {
        return soilTypeCode;
    }

    public void setSoilTypeCode(String soilTypeCode) {
        this.soilTypeCode = soilTypeCode == null ? null : soilTypeCode.trim();
    }

    public String getCropsTypeCode() {
        return cropsTypeCode;
    }

    public void setCropsTypeCode(String cropsTypeCode) {
        this.cropsTypeCode = cropsTypeCode == null ? null : cropsTypeCode.trim();
    }

    public String getCropsGrowthCycle() {
        return cropsGrowthCycle;
    }

    public void setCropsGrowthCycle(String cropsGrowthCycle) {
        this.cropsGrowthCycle = cropsGrowthCycle == null ? null : cropsGrowthCycle.trim();
    }

    public BigDecimal getWaterQuota() {
        return waterQuota;
    }

    public void setWaterQuota(BigDecimal waterQuota) {
        this.waterQuota = waterQuota;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}