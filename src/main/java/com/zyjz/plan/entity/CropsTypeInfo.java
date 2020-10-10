package com.zyjz.plan.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @ClassName: CropsTypeInfo
 * @Description: 农作物管理实体
 * @Author: zhaojx
 * @Date: 2018年2月28日 上午11:35:55
 */
public class CropsTypeInfo implements Serializable {
	
    private String id;

    private Integer cropsCode;

    private String cropsName;

    private String description;

    private Date ctiCreateTime;

    private Date ctiEditTime;

    private String ctiRemark;

    private static final long serialVersionUID = 1L;
    
    private String sysareaCode; //所属行政区域id,外键,关联行政区域表,权限划分
    private String comm1; //备用字段1
    private String comm2; //备用字段2

    private BigDecimal netIrrigation; //作物净灌溉定额

    private BigDecimal evapotranspiration;//蒸发蒸腾

    private BigDecimal growthPeriodRainfall;//生育期内有效降水量

    private BigDecimal groundwater;//地下水利用量

    private BigDecimal growthPeriodSoilStart;//生育期开始土壤含水率

    private BigDecimal growthPeriodSoilEnd;//生育期结束土壤含水率

    private String comm3;

    private String comm4;

    private String comm5;
    
    
    
    public BigDecimal getNetIrrigation() {
		return netIrrigation;
	}

	public void setNetIrrigation(BigDecimal netIrrigation) {
		this.netIrrigation = netIrrigation;
	}

	public BigDecimal getEvapotranspiration() {
		return evapotranspiration;
	}

	public void setEvapotranspiration(BigDecimal evapotranspiration) {
		this.evapotranspiration = evapotranspiration;
	}

	public BigDecimal getGrowthPeriodRainfall() {
		return growthPeriodRainfall;
	}

	public void setGrowthPeriodRainfall(BigDecimal growthPeriodRainfall) {
		this.growthPeriodRainfall = growthPeriodRainfall;
	}

	public BigDecimal getGroundwater() {
		return groundwater;
	}

	public void setGroundwater(BigDecimal groundwater) {
		this.groundwater = groundwater;
	}

	public BigDecimal getGrowthPeriodSoilStart() {
		return growthPeriodSoilStart;
	}

	public void setGrowthPeriodSoilStart(BigDecimal growthPeriodSoilStart) {
		this.growthPeriodSoilStart = growthPeriodSoilStart;
	}

	public BigDecimal getGrowthPeriodSoilEnd() {
		return growthPeriodSoilEnd;
	}

	public void setGrowthPeriodSoilEnd(BigDecimal growthPeriodSoilEnd) {
		this.growthPeriodSoilEnd = growthPeriodSoilEnd;
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

	public String getSysareaCode() {
		return sysareaCode;
	}

	public void setSysareaCode(String sysareaCode) {
		this.sysareaCode = sysareaCode;
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

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getCropsCode() {
        return cropsCode;
    }

    public void setCropsCode(Integer cropsCode) {
        this.cropsCode = cropsCode;
    }

    public String getCropsName() {
        return cropsName;
    }

    public void setCropsName(String cropsName) {
        this.cropsName = cropsName == null ? null : cropsName.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getCtiCreateTime() {
        return ctiCreateTime;
    }

    public void setCtiCreateTime(Date ctiCreateTime) {
        this.ctiCreateTime = ctiCreateTime;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getCtiEditTime() {
        return ctiEditTime;
    }

    public void setCtiEditTime(Date ctiEditTime) {
        this.ctiEditTime = ctiEditTime;
    }

    public String getCtiRemark() {
        return ctiRemark;
    }

    public void setCtiRemark(String ctiRemark) {
        this.ctiRemark = ctiRemark == null ? null : ctiRemark.trim();
    }
    
}