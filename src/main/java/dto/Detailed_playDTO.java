package dto;

public class Detailed_playDTO {

	private String start_time;

	public Detailed_playDTO(String start_time) {
		this.start_time = start_time;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	@Override
	public String toString() {
		return "Detailed_playDTO [start_time=" + start_time + "]";
	}

}
