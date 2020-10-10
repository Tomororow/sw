package com.zyjz.plan.entity;

import java.math.BigDecimal;
import java.util.Date;

public class BpTenFlowFrequency {
    private String id;

    private String forecastId;

    private String canalcode;

    private BigDecimal precipitation;

    private BigDecimal evaporation;

    private BigDecimal temperatur;

    private BigDecimal windspeed;

    private BigDecimal humidity;

    private BigDecimal sunshine;

    private BigDecimal atmosphere;

    private BigDecimal inflow;

    private Integer year;

    private Integer month;

    private Date predictiontime;

    private Date createtime;

    private Date updatetime;

    private String operator;

    private String comm1;

    private String comm2;

    private String comm3;

    private String comm4;

    private String comm5;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getForecastId() {
        return forecastId;
    }

    public void setForecastId(String forecastId) {
        this.forecastId = forecastId == null ? null : forecastId.trim();
    }

    public String getCanalcode() {
        return canalcode;
    }

    public void setCanalcode(String canalcode) {
        this.canalcode = canalcode == null ? null : canalcode.trim();
    }

    public BigDecimal getPrecipitation() {
        return precipitation;
    }

    public void setPrecipitation(BigDecimal precipitation) {
        this.precipitation = precipitation;
    }

    public BigDecimal getEvaporation() {
        return evaporation;
    }

    public void setEvaporation(BigDecimal evaporation) {
        this.evaporation = evaporation;
    }

    public BigDecimal getTemperatur() {
        return temperatur;
    }

    public void setTemperatur(BigDecimal temperatur) {
        this.temperatur = temperatur;
    }

    public BigDecimal getWindspeed() {
        return windspeed;
    }

    public void setWindspeed(BigDecimal windspeed) {
        this.windspeed = windspeed;
    }

    public BigDecimal getHumidity() {
        return humidity;
    }

    public void setHumidity(BigDecimal humidity) {
        this.humidity = humidity;
    }

    public BigDecimal getSunshine() {
        return sunshine;
    }

    public void setSunshine(BigDecimal sunshine) {
        this.sunshine = sunshine;
    }

    public BigDecimal getAtmosphere() {
        return atmosphere;
    }

    public void setAtmosphere(BigDecimal atmosphere) {
        this.atmosphere = atmosphere;
    }

    public BigDecimal getInflow() {
        return inflow;
    }

    public void setInflow(BigDecimal inflow) {
        this.inflow = inflow;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Date getPredictiontime() {
        return predictiontime;
    }

    public void setPredictiontime(Date predictiontime) {
        this.predictiontime = predictiontime;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }

    public String getComm1() {
        return comm1;
    }

    public void setComm1(String comm1) {
        this.comm1 = comm1 == null ? null : comm1.trim();
    }

    public String getComm2() {
        return comm2;
    }

    public void setComm2(String comm2) {
        this.comm2 = comm2 == null ? null : comm2.trim();
    }

    public String getComm3() {
        return comm3;
    }

    public void setComm3(String comm3) {
        this.comm3 = comm3 == null ? null : comm3.trim();
    }

    public String getComm4() {
        return comm4;
    }

    public void setComm4(String comm4) {
        this.comm4 = comm4 == null ? null : comm4.trim();
    }

    public String getComm5() {
        return comm5;
    }

    public void setComm5(String comm5) {
        this.comm5 = comm5 == null ? null : comm5.trim();
    }
}