
package com.zyjz.site.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class CurrentRainCapacity implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int timeFlag;
	
	private String timeName;
	
	private BigDecimal totalCapacity;

	public int getTimeFlag() {
		return timeFlag;
	}

	public void setTimeFlag(int timeFlag) {
		this.timeFlag = timeFlag;
	}

	public String getTimeName() {
		return timeName;
	}

	public void setTimeName(String timeName) {
		this.timeName = timeName;
	}

	public BigDecimal getTotalCapacity() {
		return totalCapacity;
	}

	public void setTotalCapacity(BigDecimal totalCapacity) {
		this.totalCapacity = totalCapacity;
	}

}
