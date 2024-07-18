package dto;

public class SeatStatusDTO {
	private String rank;
	private int count;
	
	public SeatStatusDTO(String rank, int count) {
		this.rank = rank;
		this.count = count;
	}

	public String getRank() {
		return rank;
	}

	public int getCount() {
		return count;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "SeatStatusDTO [rank=" + rank + ", count=" + count + "]";
	}
}
