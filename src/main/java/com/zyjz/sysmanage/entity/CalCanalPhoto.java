package com.zyjz.sysmanage.entity;

import java.io.Serializable;

public class CalCanalPhoto implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

    private String canalId;

    private String canalPhotoimg;

    private String ccpRemark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCanalId() {
        return canalId;
    }

    public void setCanalId(String canalId) {
        this.canalId = canalId == null ? null : canalId.trim();
    }

    public String getCanalPhotoimg() {
        return canalPhotoimg;
    }

    public void setCanalPhotoimg(String canalPhotoimg) {
        this.canalPhotoimg = canalPhotoimg == null ? null : canalPhotoimg.trim();
    }

    public String getCcpRemark() {
        return ccpRemark;
    }

    public void setCcpRemark(String ccpRemark) {
        this.ccpRemark = ccpRemark == null ? null : ccpRemark.trim();
    }
}