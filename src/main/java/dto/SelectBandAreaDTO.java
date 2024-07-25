package dto;

public class SelectBandAreaDTO {
	String area_name;
	String area_detail;
	String url;
	String name;
	String title;
	int meet_idx;
	
	
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "SelectBandAreaDTO [area_name=" + area_name + ", area_detail=" + area_detail + ", url=" + url + ", name="
				+ name + ", title=" + title + "]";
	}
	public SelectBandAreaDTO(String area_name, String area_detail, String url, String name, String title, int meet_idx) {
		this.area_name = area_name;
		this.area_detail = area_detail;
		this.url = url;
		this.name = name;
		this.title = title;
		this.meet_idx = meet_idx;
		
	}
	public int getMeet_idx() {
		return meet_idx;
	}
	public void setMeet_idx(int meet_idx) {
		this.meet_idx = meet_idx;
	}
	public SelectBandAreaDTO(String area_detail, String name) {
		this.area_detail = area_detail;
		this.name = name;
	}
	public SelectBandAreaDTO(int meet_idx) {
		super();
		this.meet_idx = meet_idx;
	}
	
}
