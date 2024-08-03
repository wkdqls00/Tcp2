package dto;

public class SearchResultDTO {
	private int play_idx;
	private String poster_url;
	private String playName;
	private String playhallName;
	private String period;

	public SearchResultDTO(int play_idx, String poster_url, String playName, String playhallName, String period) {
		this.play_idx = play_idx;
		this.poster_url = poster_url;
		this.playName = playName;
		this.playhallName = playhallName;
		this.period = period;
	}

	public int getPlay_idx() {
		return play_idx;
	}

	public String getPoster_url() {
		return poster_url;
	}

	public String getPlayName() {
		return playName;
	}

	public String getPlayhallName() {
		return playhallName;
	}

	public String getPeriod() {
		return period;
	}

	public void setPlay_idx(int play_idx) {
		this.play_idx = play_idx;
	}

	public void setPoster_url(String poster_url) {
		this.poster_url = poster_url;
	}

	public void setPlayName(String playName) {
		this.playName = playName;
	}

	public void setPlayhallName(String playhallName) {
		this.playhallName = playhallName;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	@Override
	public String toString() {
		return "DSearchResultDTO [play_idx=" + play_idx + ", poster_url=" + poster_url + ", playName=" + playName
				+ ", playhallName=" + playhallName + ", period=" + period + "]";
	}

}
