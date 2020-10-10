package com.zyjz.sysmanage.entity;

import java.math.BigDecimal;

import cn.afterturn.easypoi.excel.annotation.Excel;

public class CanalFlowHightExcel {
	
		@Excel(name="上限",orderNum="1")
	    private BigDecimal upperLimit;
		
		@Excel(name="下限",orderNum="2")
	    private BigDecimal downerLimit;
		
		@Excel(name="水位",orderNum="3")
	    private BigDecimal flow;
	    
		public CanalFlowHightExcel() {
			super();
		}
		public CanalFlowHightExcel(BigDecimal upperLimit,
				BigDecimal downerLimit, BigDecimal flow) {
			super();
			this.upperLimit = upperLimit;
			this.downerLimit = downerLimit;
			this.flow = flow;
		}


		public BigDecimal getUpperLimit() {
			return upperLimit;
		}

		public void setUpperLimit(BigDecimal upperLimit) {
			this.upperLimit = upperLimit;
		}



		public BigDecimal getDownerLimit() {
			return downerLimit;
		}



		public void setDownerLimit(BigDecimal downerLimit) {
			this.downerLimit = downerLimit;
		}



		public BigDecimal getFlow() {
			return flow;
		}



		public void setFlow(BigDecimal flow) {
			this.flow = flow;
		}

		
		
		
	    
	    

}
