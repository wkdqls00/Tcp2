package dto;

public class Selectpayment_p1DTO {

	private String play_name;
	private String playhall_name;
	private String date;
	private String time;
	private String poster_url;

	public Selectpayment_p1DTO(String play_name, String playhall_name, String date, String time, String poster_url) {
		this.play_name = play_name;
		this.playhall_name = playhall_name;
		this.date = date;
		this.time = time;
		this.poster_url = poster_url;
	}

	public String getPlay_name() {
		return play_name;
	}

	public String getPlayhall_name() {
		return playhall_name;
	}

	public String getDate() {
		return date;
	}

	public String getTime() {
		return time;
	}

	public String getPoster_url() {
		return poster_url;
	}

	public void setPlay_name(String play_name) {
		this.play_name = play_name;
	}

	public void setPlayhall_name(String playhall_name) {
		this.playhall_name = playhall_name;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public void setPoster_url(String poster_url) {
		this.poster_url = poster_url;
	}

	@Override
	public String toString() {
		return "Selectpayment_p1DTO [play_name=" + play_name + ", playhall_name=" + playhall_name + ", date=" + date
				+ ", time=" + time + ", poster_url=" + poster_url + "]";
	}

}