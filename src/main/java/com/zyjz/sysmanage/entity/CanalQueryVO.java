package com.zyjz.sysmanage.entity;

import java.io.Serializable;
import java.util.List;

public class CanalQueryVO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private List<CalCanalPhoto> calCanalPhotoList;
	
	private CalCanalLengthCalssify calCanalLengthCalssify;
	
	private CalCanalInfo calCanalInfo;

	public List<CalCanalPhoto> getCalCanalPhotoList() {
		return calCanalPhotoList;
	}

	public void setCalCanalPhotoList(List<CalCanalPhoto> calCanalPhotoList) {
		this.calCanalPhotoList = calCanalPhotoList;
	}


	public CalCanalLengthCalssify getCalCanalLengthCalssify() {
		return calCanalLengthCalssify;
	}

	public void setCalCanalLengthCalssify(
			CalCanalLengthCalssify calCanalLengthCalssify) {
		this.calCanalLengthCalssify = calCanalLengthCalssify;
	}

	public CalCanalInfo getCalCanalInfo() {
		return calCanalInfo;
	}

	public void setCalCanalInfo(CalCanalInfo calCanalInfo) {
		this.calCanalInfo = calCanalInfo;
	}
	
	

}
