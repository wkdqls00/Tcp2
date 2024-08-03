package dto;

public class Genre_RankDTO {
	
	private String regDate;
	private String playName;
	private String playStartDate;
	private String playEndDate;
	private double playBookRate;
	private String poster_URL; 
	private String playHallName;
	private int play_idx;
	
	
	public Genre_RankDTO(String regDate, String playName, String playStartDate, String playEndDate, double playBookRate,
			String poster_URL, String playHallName, int play_idx) {
		this.regDate = regDate;
		this.playName = playName;
		this.playStartDate = playStartDate;
		this.playEndDate = playEndDate;
		this.playBookRate = playBookRate;
		this.poster_URL = poster_URL;
		this.playHallName = playHallName;
		this.play_idx = play_idx;
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


	public String getPlayStartDate() {
		return playStartDate;
	}


	public void setPlayStartDate(String playStartDate) {
		this.playStartDate = playStartDate;
	}


	public String getPlayEndDate() {
		return playEndDate;
	}


	public void setPlayEndDate(String playEndDate) {
		this.playEndDate = playEndDate;
	}


	public double getPlayBookRate() {
		return playBookRate;
	}


	public void setPlayBookRate(double playBookRate) {
		this.playBookRate = playBookRate;
	}


	public String getPoster_URL() {
		return poster_URL;
	}


	public void setPoster_URL(String poster_URL) {
		this.poster_URL = poster_URL;
	}


	public String getPlayHallName() {
		return playHallName;
	}


	public void setPlayHallName(String playHallName) {
		this.playHallName = playHallName;
	}


	public int getPlay_idx() {
		return play_idx;
	}


	public void setPlay_idx(int play_idx) {
		this.play_idx = play_idx;
	}


	@Override
	public String toString() {
		return "Genre_RankDTO [regDate=" + regDate + ", playName=" + playName + ", playStartDate=" + playStartDate
				+ ", playEndDate=" + playEndDate + ", playBookRate=" + playBookRate + ", poster_URL=" + poster_URL
				+ ", playHallName=" + playHallName + ", play_idx=" + play_idx + "]";
	}


	
	

	
}
