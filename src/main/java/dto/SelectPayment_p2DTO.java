package dto;

public class SelectPayment_p2DTO {
	private String play_date;
	private String start_time;
	private String name;
	private String poster_url;
	public SelectPayment_p2DTO(String play_date, String start_time, String name, String poster_url) {
		this.play_date = play_date;
		this.start_time = start_time;
		this.name = name;
		this.poster_url = poster_url;
	}
	public String getPlay_date() {
		return play_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public String getName() {
		return name;
	}
	public String getPoster_url() {
		return poster_url;
	}
	public void setPlay_date(String play_date) {
		this.play_date = play_date;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPoster_url(String poster_url) {
		this.poster_url = poster_url;
	}
	@Override
	public String toString() {
		return "SelectPayment_p2DTO [play_date=" + play_date + ", start_time=" + start_time + ", name=" + name
				+ ", poster_url=" + poster_url + "]";
	}
	
	
	
	
}
