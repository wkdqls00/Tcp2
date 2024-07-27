package dto;

public class DetailedInfo_playDTO {

	private String playName;
	private String playhallName;
	private String time;
	private String startDate;
	private String endDate;
	private String viewage;
	private String poster_url;
	private String img_detail1;
	private String cast;
	private String crew;
	
	public DetailedInfo_playDTO(String playName, String playhallName, String time, String startDate, String endDate,
			String viewage, String poster_url, String img_detail1, String cast, String crew) {
		this.playName = playName;
		this.playhallName = playhallName;
		this.time = time;
		this.startDate = startDate;
		this.endDate = endDate;
		this.viewage = viewage;
		this.poster_url = poster_url;
		this.img_detail1 = img_detail1;
		this.cast = cast;
		this.crew = crew;
	}

	public String getPlayName() {
		return playName;
	}

	public void setPlayName(String playName) {
		this.playName = playName;
	}

	public String getPlayhallName() {
		return playhallName;
	}

	public void setPlayhallName(String playhallName) {
		this.playhallName = playhallName;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getViewage() {
		return viewage;
	}

	public void setViewage(String viewage) {
		this.viewage = viewage;
	}

	public String getPoster_url() {
		return poster_url;
	}

	public void setPoster_url(String poster_url) {
		this.poster_url = poster_url;
	}

	public String getImg_detail1() {
		return img_detail1;
	}

	public void setImg_detail1(String img_detail1) {
		this.img_detail1 = img_detail1;
	}

	public String getCast() {
		return cast;
	}

	public void setCast(String cast) {
		this.cast = cast;
	}

	public String getCrew() {
		return crew;
	}

	public void setCrew(String crew) {
		this.crew = crew;
	}

	@Override
	public String toString() {
		return "DetailedInfo_playDTO [playName=" + playName + ", playhallName=" + playhallName + ", time=" + time
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", viewage=" + viewage + ", poster_url="
				+ poster_url + ", img_detail1=" + img_detail1 + ", cast=" + cast + ", crew=" + crew + "]";
	}

	

}
