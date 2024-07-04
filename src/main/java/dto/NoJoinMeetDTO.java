package dto;

public class NoJoinMeetDTO {
	private String name;
	private String url;
	private String title;
	private int age;
	
	
	public NoJoinMeetDTO(String name, String url, String title, int age) {
		this.name = name;
		this.url = url;
		this.title = title;
		this.age = age;
	}
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "NoJoinMeetDTO [name=" + name + ", url=" + url + ", title=" + title + ", age=" + age + "]";
	}
	
	
	
	
	
}
