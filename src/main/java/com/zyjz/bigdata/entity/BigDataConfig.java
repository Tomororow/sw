package com.zyjz.bigdata.entity;

import java.math.BigDecimal;
import java.util.Date;

public class BigDataConfig {
    /**  */
    private Integer id;

    /** 河道/水库的水源名称 */
    private String restName;

    /** 河道/水库的水量 */
    private BigDecimal restWater;

    /** 降雨量 */
    private BigDecimal drp;

    /** 降雨时间 */
    private String year;

    /** (0:水库水源;1:河道水源) */
    private Integer type;

    /** 创建时间 */
    private Date createTime;

    /**  */
    private String breakOne;

    /**  */
    private String breakTwo;

    /**  */
    private String breakThree;

    private BigDecimal sumWater;

    /**
     * 
     * @return id 
     */
    public Integer getId() {
        return id;
    }

    /**
     * 
     * @param id 
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 河道/水库的水源名称
     * @return rest_name 河道/水库的水源名称
     */
    public String getRestName() {
        return restName;
    }

    /**
     * 河道/水库的水源名称
     * @param restName 河道/水库的水源名称
     */
    public void setRestName(String restName) {
        this.restName = restName == null ? null : restName.trim();
    }

    /**
     * 河道/水库的水量
     * @return rest_water 河道/水库的水量
     */
    public BigDecimal getRestWater() {
        return restWater;
    }

    /**
     * 河道/水库的水量
     * @param restWater 河道/水库的水量
     */
    public void setRestWater(BigDecimal restWater) {
        this.restWater = restWater;
    }

    /**
     * 降雨量
     * @return drp 降雨量
     */
    public BigDecimal getDrp() {
        return drp;
    }

    /**
     * 降雨量
     * @param drp 降雨量
     */
    public void setDrp(BigDecimal drp) {
        this.drp = drp;
    }

    /**
     * 降雨时间
     * @return year 降雨时间
     */
    public String getYear() {
        return year;
    }

    /**
     * 降雨时间
     * @param year 降雨时间
     */
    public void setYear(String year) {
        this.year = year == null ? null : year.trim();
    }

    /**
     * (0:水库水源;1:河道水源)
     * @return type (0:水库水源;1:河道水源)
     */
    public Integer getType() {
        return type;
    }

    /**
     * (0:水库水源;1:河道水源)
     * @param type (0:水库水源;1:河道水源)
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 创建时间
     * @return create_time 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 创建时间
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 
     * @return break_one 
     */
    public String getBreakOne() {
        return breakOne;
    }

    /**
     * 
     * @param breakOne 
     */
    public void setBreakOne(String breakOne) {
        this.breakOne = breakOne == null ? null : breakOne.trim();
    }

    /**
     * 
     * @return break_two 
     */
    public String getBreakTwo() {
        return breakTwo;
    }

    /**
     * 
     * @param breakTwo 
     */
    public void setBreakTwo(String breakTwo) {
        this.breakTwo = breakTwo == null ? null : breakTwo.trim();
    }

    /**
     * 
     * @return break_three 
     */
    public String getBreakThree() {
        return breakThree;
    }

    /**
     * 
     * @param breakThree 
     */
    public void setBreakThree(String breakThree) {
        this.breakThree = breakThree == null ? null : breakThree.trim();
    }

    public BigDecimal getSumWater() {
        return sumWater;
    }

    public void setSumWater(BigDecimal sumWater) {
        this.sumWater = sumWater;
    }
}