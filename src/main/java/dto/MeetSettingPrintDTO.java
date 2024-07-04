package dto;

public class MeetSettingPrintDTO {
	String name;
	String url;
	String color;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	@Override
	public String toString() {
		return "MeetSettingPrintDTO [name=" + name + ", url=" + url + ", color=" + color + "]";
	}
	
	public MeetSettingPrintDTO(String name, String url, String color) {
		this.name = name;
		this.url = url;
		this.color = color;
	}
	
	
}
