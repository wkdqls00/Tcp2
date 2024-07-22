package dto;

public class GetPlayIdxDTO {
	private int playhall_idx;
	private int play_idx;

	public GetPlayIdxDTO(int playhall_idx, int play_idx) {
		this.playhall_idx = playhall_idx;
		this.play_idx = play_idx;
	}

	public int getPlayhall_idx() {
		return playhall_idx;
	}

	public int getPlay_idx() {
		return play_idx;
	}

	public void setPlayhall_idx(int playhall_idx) {
		this.playhall_idx = playhall_idx;
	}

	public void setPlay_idx(int play_idx) {
		this.play_idx = play_idx;
	}

	@Override
	public String toString() {
		return "GetPlayIdxDTO [playhall_idx=" + playhall_idx + ", play_idx=" + play_idx + "]";
	}

}
