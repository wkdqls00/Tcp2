package dto;

public class MeetInfoWriteDTO {
	private String title;
	private String area_detail;
	private String name;
	
	public MeetInfoWriteDTO(String title, String area_detail, String name) {
		this.title = title;
		this.area_detail = area_detail;
		this.name = name;
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
