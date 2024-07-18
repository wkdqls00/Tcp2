package dto;

public class SeatDTO {
	private int playhall_idx;
	private String rank;
	private String seat_chart;
	private int x;
	private int y;
	private int seat_idx;

	public SeatDTO(int playhall_idx, String rank, String seat_chart, int x, int y, int seat_idx) {
		this.playhall_idx = playhall_idx;
		this.rank = rank;
		this.seat_chart = seat_chart;
		this.x = x;
		this.y = y;
		this.seat_idx = seat_idx;
	}

	public int getPlayhall_idx() {
		return playhall_idx;
	}

	public String getRank() {
		return rank;
	}

	public String getSeat_chart() {
		return seat_chart;
	}

	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}

	public int getSeat_idx() {
		return seat_idx;
	}

	public void setPlayhall_idx(int playhall_idx) {
		this.playhall_idx = playhall_idx;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public void setSeat_chart(String seat_chart) {
		this.seat_chart = seat_chart;
	}

	public void setX(int x) {
		this.x = x;
	}

	public void setY(int y) {
		this.y = y;
	}

	public void setSeat_idx(int seat_idx) {
		this.seat_idx = seat_idx;
	}

	@Override
	public String toString() {
		return "SeatDTO [playhall_idx=" + playhall_idx + ", rank=" + rank + ", seat_chart=" + seat_chart + ", x=" + x
				+ ", y=" + y + ", seat_idx=" + seat_idx + "]";
	}

}