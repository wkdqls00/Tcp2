package dto;

public class MeetInfoWriteDTO {
	private String title;
	private String area_detail;
	private String name;
	int area_idx;
	int meet_area_idx;
	
	public int getArea_idx() {
		return area_idx;
	}
	public void setArea_idx(int area_idx) {
		this.area_idx = area_idx;
	}
	
	
	public MeetInfoWriteDTO(String area_detail, int area_idx, int meet_area_idx) {
		this.area_detail = area_detail;
		this.area_idx = area_idx;
		this.meet_area_idx = meet_area_idx;
	}
	public int getMeet_area_idx() {
		return meet_area_idx;
	}
	public void setMeet_area_idx(int meet_area_idx) {
		this.meet_area_idx = meet_area_idx;
	}
	public MeetInfoWriteDTO(String name, int area_idx) {
		this.name = name;
		this.area_idx = area_idx;
	}
	
	
	public MeetInfoWriteDTO(String title, String area_detail, String name, int area_idx, int meet_area_idx) {
		this.title = title;
		this.area_detail = area_detail;
		this.name = name;
		this.area_idx = area_idx;
		this.meet_area_idx = meet_area_idx;
	}

	public String getArea_detail() {
		return area_detail;
	}

	public void setArea_detail(String area_detail) {
		this.area_detail = area_detail;
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


	

	
	
	
	
}
