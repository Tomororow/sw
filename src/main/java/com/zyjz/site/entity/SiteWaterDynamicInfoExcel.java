package com.zyjz.site.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class SiteWaterDynamicInfoExcel implements Serializable{
	private static final long serialVersionUID = 1L;

	private String id;

    private String devicewaterCode;

    private String deviceWaterName;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date swdiCollectTime;

    private Integer swdiNetState;

    private BigDecimal waterLevel;

    private BigDecimal instantSpeed;
    @Excel(name="瞬时流量",height = 11, width = 15,orderNum="1")
    private BigDecimal instantFlow;

    @Excel(name="采集时间",height = 11, databaseFormat = "yyyyMMddHHmmss", format = "yyyy-MM-dd HH:mm:ss", width = 30,orderNum="2")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date swdiCreateTime;

    private String intranetIp;

    private String outernetIp;

    private BigDecimal testHeight;

    private String swiType;

    private String type;

    private String siteWaterId;

    private BigDecimal totleFlow;

    private String canclName;

    private String canclCode;

    private BigDecimal avgFlow;

    private BigDecimal sumFlow;

    private String deviceState;
	 /*数据库别名*/

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private String createTime;

    private int swiDevicemodelCode;

    private String trenChier1;

    private String trenChier2;

    private String trenChier3;

    private String trenChier4;

    private String trenChier5;

    private String trenChier6;

    private String trenChier7;

    private String remark;

    private Integer tierNum;

	public Integer getTierNum() {
		return tierNum;
	}

	public void setTierNum(Integer tierNum) {
		this.tierNum = tierNum;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getTrenChier1() {
		return trenChier1;
	}

	public void setTrenChier1(String trenChier1) {
		this.trenChier1 = trenChier1;
	}

	public String getTrenChier2() {
		return trenChier2;
	}

	public void setTrenChier2(String trenChier2) {
		this.trenChier2 = trenChier2;
	}

	public String getTrenChier3() {
		return trenChier3;
	}

	public void setTrenChier3(String trenChier3) {
		this.trenChier3 = trenChier3;
	}

	public String getTrenChier4() {
		return trenChier4;
	}

	public void setTrenChier4(String trenChier4) {
		this.trenChier4 = trenChier4;
	}

	public String getTrenChier5() {
		return trenChier5;
	}

	public void setTrenChier5(String trenChier5) {
		this.trenChier5 = trenChier5;
	}

	public String getTrenChier6() {
		return trenChier6;
	}

	public void setTrenChier6(String trenChier6) {
		this.trenChier6 = trenChier6;
	}

	public String getTrenChier7() {
		return trenChier7;
	}

	public void setTrenChier7(String trenChier7) {
		this.trenChier7 = trenChier7;
	}

	public int getSwiDevicemodelCode() {
		return swiDevicemodelCode;
	}

	public void setSwiDevicemodelCode(int swiDevicemodelCode) {
		this.swiDevicemodelCode = swiDevicemodelCode;
	}

	public String getId() {
        return id;
    }

    public String getDeviceWaterName() {
		return deviceWaterName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setDeviceWaterName(String deviceWaterName) {
		this.deviceWaterName = deviceWaterName;
	}

	public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getDevicewaterCode() {
        return devicewaterCode;
    }

    public void setDevicewaterCode(String devicewaterCode) {
        this.devicewaterCode = devicewaterCode == null ? null : devicewaterCode.trim();
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSwdiCollectTime() {
        return swdiCollectTime;
    }

    public void setSwdiCollectTime(Date swdiCollectTime) {
        this.swdiCollectTime = swdiCollectTime;
    }

    public Integer getSwdiNetState() {
        return swdiNetState;
    }

    public void setSwdiNetState(Integer swdiNetState) {
        this.swdiNetState = swdiNetState;
    }

    public BigDecimal getWaterLevel() {
        return waterLevel;
    }

    public void setWaterLevel(BigDecimal waterLevel) {
        this.waterLevel = waterLevel;
    }

    public BigDecimal getInstantSpeed() {
        return instantSpeed;
    }

    public void setInstantSpeed(BigDecimal instantSpeed) {
        this.instantSpeed = instantSpeed;
    }

    public BigDecimal getInstantFlow() {
        return instantFlow;
    }

    public void setInstantFlow(BigDecimal instantFlow) {
        this.instantFlow = instantFlow;
    }
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    public Date getSwdiCreateTime() {
        return swdiCreateTime;
    }

    public void setSwdiCreateTime(Date swdiCreateTime) {
        this.swdiCreateTime = swdiCreateTime;
    }

	public String getIntranetIp() {
		return intranetIp;
	}

	public void setIntranetIp(String intranetIp) {
		this.intranetIp = intranetIp;
	}

	public String getOuternetIp() {
		return outernetIp;
	}

	public void setOuternetIp(String outernetIp) {
		this.outernetIp = outernetIp;
	}

	public BigDecimal getTestHeight() {
		return testHeight;
	}

	public void setTestHeight(BigDecimal testHeight) {
		this.testHeight = testHeight;
	}

	public String getSwiType() {
		return swiType;
	}

	public void setSwiType(String swiType) {
		this.swiType = swiType;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getSiteWaterId() {
		return siteWaterId;
	}

	public void setSiteWaterId(String siteWaterId) {
		this.siteWaterId = siteWaterId;
	}

	public BigDecimal getTotleFlow() {
		return totleFlow;
	}

	public void setTotleFlow(BigDecimal totleFlow) {
		this.totleFlow = totleFlow;
	}
	
	public BigDecimal getAvgFlow() {
		return avgFlow;
	}

	public void setAvgFlow(BigDecimal avgFlow) {
		this.avgFlow = avgFlow;
	}

	public BigDecimal getSumFlow() {
		return sumFlow;
	}

	public void setSumFlow(BigDecimal sumFlow) {
		this.sumFlow = sumFlow;
	}

	public String getCanclCode() {
		return canclCode;
	}

	public void setCanclCode(String canclCode) {
		this.canclCode = canclCode;
	}

	public String getCanclName() {
		return canclName;
	}

	public void setCanclName(String canclName) {
		this.canclName = canclName;
	}

	public String getDeviceState() {
		return deviceState;
	}

	public void setDeviceState(String deviceState) {
		this.deviceState = deviceState;
	}
	@JsonFormat(pattern="yyyy-MM-dd", timezone="GMT+8")
	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}