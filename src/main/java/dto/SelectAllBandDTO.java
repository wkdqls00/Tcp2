package dto;

public class SelectAllBandDTO {
	String areaName;
	String areaDetail;
	String url;
	String meetName;
	String sub_q;
	String title;
	int meet_idx;
	
	public SelectAllBandDTO(String areaName, String areaDetail, String url, String meetName, String sub_q, String title, int meet_idx) {
		this.areaName = areaName;
		this.areaDetail = areaDetail;
		this.url = url;
		this.meetName = meetName;
		this.sub_q = sub_q;
		this.title = title;
		this.meet_idx = meet_idx;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getAreaDetail() {
		return areaDetail;
	}

	public void setAreaDetail(String areaDetail) {
		this.areaDetail = areaDetail;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getMeetName() {
		return meetName;
	}

	public void setMeetName(String meetName) {
		this.meetName = meetName;
	}

	public String getSub_q() {
		return sub_q;
	}

	public void setSub_q(String sub_q) {
		this.sub_q = sub_q;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getMeet_idx() {
		return meet_idx;
	}

	public void setMeet_idx(int meet_idx) {
		this.meet_idx = meet_idx;
	}
	
	
	
}
