package dto;

public class RecommendPDTO {

	private String poster_url;
	private String areaName;
	private String playName;
	private String startDate;
	private String endDate;
	private int play_idx;

	public RecommendPDTO(String poster_url, String areaName, String playName, String startDate, String endDate,
			int play_idx) {
		this.poster_url = poster_url;
		this.areaName = areaName;
		this.playName = playName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.play_idx = play_idx;
	}

	public String getPoster_url() {
		return poster_url;
	}

	public void setPoster_url(String poster_url) {
		this.poster_url = poster_url;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getPlayName() {
		return playName;
	}

	public void setPlayName(String playName) {
		this.playName = playName;
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

	public int getPlay_idx() {
		return play_idx;
	}

	public void setPlay_idx(int play_idx) {
		this.play_idx = play_idx;
	}

	@Override
	public String toString() {
		return "RecommendPDTO [poster_url=" + poster_url + ", areaName=" + areaName + ", playName=" + playName
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", play_idx=" + play_idx + "]";
	}

}
