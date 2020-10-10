package com.zyjz.plan.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @ClassName: CropsGrowthCycle
 * @Description: 农作物生长周期实体
 * @Author: zhaojx
 * @Date: 2018年2月28日 下午4:44:49
 */
public class CropsGrowthCycle implements Serializable {
    private String id;

    private Integer cycleCode;

    private String cycleName;
    
    private String description;

    private Date cgcCreateTime;

    private Date cgcEditTime;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date stateDate;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date endDate;
    private String sysareaCode;
    private String cgcRemark;
    
    private BigDecimal consumedWater;

    private String comm1;//生长周期时长

    private String comm2;//农作物类型id
    

    private BigDecimal netIrrigation; //作物净灌溉定额

    private BigDecimal evapotranspiration;//蒸发蒸腾

    private BigDecimal growthPeriodRainfall;//生育期内有效降水量

    private BigDecimal groundwater;//生育期内地下水利用量

    private BigDecimal growthPeriodSoilStart;//生育期开始土壤含水率

    private BigDecimal growthPeriodSoilEnd;//生育期结束土壤含水率

    private String comm3;

    private String comm4;

    private String comm5;
    
    private BigDecimal netIrrigationScientific;//科学——作物净灌溉定额

    private String comm6;

    private String comm7;

    private String comm8;

    private String comm9;

    private String comm10;
    
    
    public BigDecimal getNetIrrigationScientific() {
		return netIrrigationScientific;
	}

	public void setNetIrrigationScientific(BigDecimal netIrrigationScientific) {
		this.netIrrigationScientific = netIrrigationScientific;
	}

	public String getComm6() {
		return comm6;
	}

	public void setComm6(String comm6) {
		this.comm6 = comm6;
	}

	public String getComm7() {
		return comm7;
	}

	public void setComm7(String comm7) {
		this.comm7 = comm7;
	}

	public String getComm8() {
		return comm8;
	}

	public void setComm8(String comm8) {
		this.comm8 = comm8;
	}

	public String getComm9() {
		return comm9;
	}

	public void setComm9(String comm9) {
		this.comm9 = comm9;
	}

	public String getComm10() {
		return comm10;
	}

	public void setComm10(String comm10) {
		this.comm10 = comm10;
	}

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

	public Date getStateDate() {
		return stateDate;
	}

	public void setStateDate(Date stateDate) {
		this.stateDate = stateDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getSysareaCode() {
		return sysareaCode;
	}

	public void setSysareaCode(String sysareaCode) {
		this.sysareaCode = sysareaCode;
	}

	public BigDecimal getConsumedWater() {
		return consumedWater;
	}

	public void setConsumedWater(BigDecimal consumedWater) {
		this.consumedWater = consumedWater;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getCycleCode() {
        return cycleCode;
    }

    public void setCycleCode(Integer cycleCode) {
        this.cycleCode = cycleCode;
    }

    public String getCycleName() {
        return cycleName;
    }

    public void setCycleName(String cycleName) {
        this.cycleName = cycleName == null ? null : cycleName.trim();
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getCgcCreateTime() {
        return cgcCreateTime;
    }

    public void setCgcCreateTime(Date cgcCreateTime) {
        this.cgcCreateTime = cgcCreateTime;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getCgcEditTime() {
        return cgcEditTime;
    }

    public void setCgcEditTime(Date cgcEditTime) {
        this.cgcEditTime = cgcEditTime;
    }

    public String getCgcRemark() {
        return cgcRemark;
    }

    public void setCgcRemark(String cgcRemark) {
        this.cgcRemark = cgcRemark == null ? null : cgcRemark.trim();
    }
}