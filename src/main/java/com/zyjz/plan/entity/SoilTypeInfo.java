package com.zyjz.plan.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @ClassName: SoilTypeInfo
 * @Description: 土地种类管理实体
 * @Author: zhaojx
 * @Date: 2018年2月28日 上午11:36:11
 */
public class SoilTypeInfo implements Serializable {
    private String id;

    private Integer soilCode;

    private String soilName;

    private String description;

    private Date stiCreateTime;

    private Date stiEditTime;

    private String stiRemark;
    
    private String areaCode; //行政区域编码,唯一索引

    private BigDecimal coefficientSoil;//土质系数

    private BigDecimal storeWaterSoil;//土壤储存水量

    private String comm1;//备用字段1

    private String comm2;

    private String comm3;

    private String comm4;

    private String comm5;

    public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public BigDecimal getCoefficientSoil() {
		return coefficientSoil;
	}

	public void setCoefficientSoil(BigDecimal coefficientSoil) {
		this.coefficientSoil = coefficientSoil;
	}

	public BigDecimal getStoreWaterSoil() {
		return storeWaterSoil;
	}

	public void setStoreWaterSoil(BigDecimal storeWaterSoil) {
		this.storeWaterSoil = storeWaterSoil;
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

	private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getSoilCode() {
        return soilCode;
    }

    public void setSoilCode(Integer soilCode) {
        this.soilCode = soilCode;
    }

    public String getSoilName() {
        return soilName;
    }

    public void setSoilName(String soilName) {
        this.soilName = soilName == null ? null : soilName.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getStiCreateTime() {
        return stiCreateTime;
    }

    public void setStiCreateTime(Date stiCreateTime) {
        this.stiCreateTime = stiCreateTime;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getStiEditTime() {
        return stiEditTime;
    }

    public void setStiEditTime(Date stiEditTime) {
        this.stiEditTime = stiEditTime;
    }

    public String getStiRemark() {
        return stiRemark;
    }

    public void setStiRemark(String stiRemark) {
        this.stiRemark = stiRemark == null ? null : stiRemark.trim();
    }
}