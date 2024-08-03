package dto;

public class Week_RankDTO {

	private String name;
	private String poster_Url;
	private String startDate;
	private String endDate;

	public Week_RankDTO(String name, String poster_Url, String startDate, String endDate) {
		this.name = name;
		this.poster_Url = poster_Url;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPoster_Url() {
		return poster_Url;
	}

	public void setPoster_Url(String poster_Url) {
		this.poster_Url = poster_Url;
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

	@Override
	public String toString() {
		return "Week_RankDTO [name=" + name + ", poster_Url=" + poster_Url + ", startDate=" + startDate + ", endDate="
				+ endDate + "]";
	}

}
