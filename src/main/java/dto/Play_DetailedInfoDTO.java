package dto;

public class Play_DetailedInfoDTO {
	
	private String playName;
	private String genreName;
	private String posterUrl;
	private String startDate;
	private String endDate;
	private String info;
	
	
	public Play_DetailedInfoDTO(String playName, String genreName, String posterUrl, String startDate, String endDate,
			String info) {
		this.playName = playName;
		this.genreName = genreName;
		this.posterUrl = posterUrl;
		this.startDate = startDate;
		this.endDate = endDate;
		this.info = info;
	}


	public String getPlayName() {
		return playName;
	}


	public String getGenreName() {
		return genreName;
	}


	public String getPosterUrl() {
		return posterUrl;
	}


	public String getStartDate() {
		return startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public String getInfo() {
		return info;
	}
	
	@Override
	public String toString() {
		return playName + "   " + genreName + "   " + posterUrl + "   " + startDate + "   " + endDate + "   " + info;
	}
	
	
	
	
	
	
	

}
