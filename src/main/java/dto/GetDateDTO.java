package dto;

public class GetDateDTO {

	private int playinfo_idx;
	private String start_time;
	private String play_date;

	public GetDateDTO(int playinfo_idx, String start_time, String play_date) {
		this.playinfo_idx = playinfo_idx;
		this.start_time = start_time;
		this.play_date = play_date;
	}

	public int getPlayinfo_idx() {
		return playinfo_idx;
	}

	public void setPlayinfo_idx(int playinfo_idx) {
		this.playinfo_idx = playinfo_idx;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getPlay_date() {
		return play_date;
	}

	public void setPlay_date(String play_date) {
		this.play_date = play_date;
	}

	@Override
	public String toString() {
		return "GetDateDTO [playinfo_idx=" + playinfo_idx + ", start_time=" + start_time + ", play_date=" + play_date
				+ "]";
	}

}
