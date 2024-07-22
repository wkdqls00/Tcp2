package dto;

public class ReservedSeatInfoDTO {
	private int seat_idx;
	private String rank;
	private String seat_chart;
	public ReservedSeatInfoDTO(int seat_idx, String rank, String seat_chart) {
		this.seat_idx = seat_idx;
		this.rank = rank;
		this.seat_chart = seat_chart;
	}
	public int getSeat_idx() {
		return seat_idx;
	}
	public String getRank() {
		return rank;
	}
	public String getSeat_chart() {
		return seat_chart;
	}
	public void setSeat_idx(int seat_idx) {
		this.seat_idx = seat_idx;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public void setSeat_chart(String seat_chart) {
		this.seat_chart = seat_chart;
	}
	@Override
	public String toString() {
		return "ReservedSeatInfo [seat_idx=" + seat_idx + ", rank=" + rank + ", seat_chart=" + seat_chart + "]";
	}
	
	
}
