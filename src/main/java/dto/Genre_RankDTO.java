package dto;

public class Genre_RankDTO {
	
	private String regDate;
	private String playName;
	private String playStartDate;
	private String playEndDate;
	private double playBookRate;
	private String poster_URL; 
	private String playHallName;
	

	public Genre_RankDTO(String regDate, String playName, String playStartDate, String playEndDate, double playBookRate, String poster_URL,
			String playHallName) {		
		this.regDate = regDate;
		this.playName = playName;
		this.playStartDate = playStartDate;
		this.playEndDate = playEndDate;
		this.playBookRate = playBookRate;
		this.poster_URL = poster_URL;
		this.playHallName = playHallName;
	}

	public String getRegDate() {
		return regDate;
	}




	public String getPlayName() {
		return playName;
	}




	public String getPlayStartDate() {
		return playStartDate;
	}




	public String getPlayEndDate() {
		return playEndDate;
	}




	public double getPlayBookRate() {
		return playBookRate;
	}




	public String getPoster_URL() {
		return poster_URL;
	}




	public String getPlayHallName() {
		return playHallName;
	}




	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}




	public void setPlayName(String playName) {
		this.playName = playName;
	}




	public void setPlayStartDate(String playStartDate) {
		this.playStartDate = playStartDate;
	}




	public void setPlayEndDate(String playEndDate) {
		this.playEndDate = playEndDate;
	}




	public void setPlayBookRate(double playBookRate) {
		this.playBookRate = playBookRate;
	}




	public void setPoster_URL(String poster_URL) {
		this.poster_URL = poster_URL;
	}




	public void setPlayHallName(String playHallName) {
		this.playHallName = playHallName;
	}




	@Override 
	public String toString() {
		return regDate + "   "+playName + "   "+ playStartDate + "   "+ playEndDate + "   "+  
	           playBookRate + "   "+ poster_URL + "   "+ playHallName;
	}
	

	
}
