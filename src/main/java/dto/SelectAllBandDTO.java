package dto;

public class SelectAllBandDTO {
	String area_detail;
	String url;
	String name;
	String sub_q;
	String title;
	int meet_idx;
	
	
	
	public SelectAllBandDTO(String area_detail, String url, String name, String sub_q, String title, int meet_idx) {
		super();
		this.area_detail = area_detail;
		this.url = url;
		this.name = name;
		this.sub_q = sub_q;
		this.title = title;
		this.meet_idx = meet_idx;
	}
	
	
	public int getMeet_idx() {
		return meet_idx;
	}


	public void setMeet_idx(int meet_idx) {
		this.meet_idx = meet_idx;
	}


	public String getArea_detail() {
		return area_detail;
	}
	public void setArea_detail(String area_detail) {
		this.area_detail = area_detail;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
}
