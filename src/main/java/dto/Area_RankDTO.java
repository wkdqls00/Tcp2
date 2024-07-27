package dto;

public class Area_RankDTO {

	private String regDate;
	private String playName;
	private String startDate;
	private String endDate;
	private Double bookingRate;
	private String posterUrl;
	private String playHallName;
	private String areaName;

	public Area_RankDTO(String regDate, String playName, String startDate, String endDate, double bookingRate,
			String posterUrl, String playHallName, String areaName) {
		this.regDate = regDate;
		this.playName = playName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.bookingRate = bookingRate;
		this.posterUrl = posterUrl;
		this.playHallName = playHallName;
		this.areaName = areaName;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
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

	public Double getBookingRate() {
		return bookingRate;
	}

	public void setBookingRate(Double bookingRate) {
		this.bookingRate = bookingRate;
	}

	public String getPosterUrl() {
		return posterUrl;
	}

	public void setPosterUrl(String posterUrl) {
		this.posterUrl = posterUrl;
	}

	public String getPlayHallName() {
		return playHallName;
	}

	public void setPlayHallName(String playHallName) {
		this.playHallName = playHallName;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	@Override
	public String toString() {
		return "Area_RankDTO [regDate= " + regDate + ", playName= " + playName + ", startDate= " + startDate
				+ ", endDate= " + endDate + ", bookingRate= " + bookingRate + ", posterUrl= " + posterUrl
				+ ", playHallName= " + playHallName + ", areaName= " + areaName + "]";
	}

}
