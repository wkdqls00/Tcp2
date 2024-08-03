package dto;

public class LeftSeatDTO {

	private String rank;
	private String leftseat;

	public LeftSeatDTO(String rank, String leftseat) {
		this.rank = rank;
		this.leftseat = leftseat;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getLeftseat() {
		return leftseat;
	}

	public void setLeftseat(String leftseat) {
		this.leftseat = leftseat;
	}

	@Override
	public String toString() {
		return "LeftSeatDTO [rank=" + rank + ", leftseat=" + leftseat + "]";
	}

}
