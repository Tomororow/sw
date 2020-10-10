package com.zyjz.plan.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CollectBaseParams {
    private String id;

    private String baseName;

    private String baseCode;

    private BigDecimal levelMin;

    private BigDecimal levelMax;

    private BigDecimal flow;
    
    private BigDecimal waterNum;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createtime;

    private String remark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getBaseName() {
        return baseName;
    }

    public void setBaseName(String baseName) {
        this.baseName = baseName == null ? null : baseName.trim();
    }

    public String getBaseCode() {
        return baseCode;
    }

    public void setBaseCode(String baseCode) {
        this.baseCode = baseCode == null ? null : baseCode.trim();
    }

    public BigDecimal getLevelMin() {
        return levelMin;
    }

    public void setLevelMin(BigDecimal levelMin) {
        this.levelMin = levelMin;
    }

    public BigDecimal getLevelMax() {
        return levelMax;
    }

    public void setLevelMax(BigDecimal levelMax) {
        this.levelMax = levelMax;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public BigDecimal getFlow() {
		return flow;
	}

	public void setFlow(BigDecimal flow) {
		this.flow = flow;
	}

	public BigDecimal getWaterNum() {
		return waterNum;
	}

	public void setWaterNum(BigDecimal waterNum) {
		this.waterNum = waterNum;
	}
    
    
}