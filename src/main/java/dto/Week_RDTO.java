package dto;

public class Week_RDTO {

	private int play_idx;
	private int booking_rate;

	public Week_RDTO(int play_idx, int booking_rate) {
		this.play_idx = play_idx;
		this.booking_rate = booking_rate;
	}

	public int getPlay_idx() {
		return play_idx;
	}

	public void setPlay_idx(int play_idx) {
		this.play_idx = play_idx;
	}

	public int getBooking_rate() {
		return booking_rate;
	}

	public void setBooking_rate(int booking_rate) {
		this.booking_rate = booking_rate;
	}

	@Override
	public String toString() {
		return "Week_RDTO [play_idx=" + play_idx + ", booking_rate=" + booking_rate + "]";
	}

}
