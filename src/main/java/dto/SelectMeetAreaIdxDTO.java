package dto;

public class SelectMeetAreaIdxDTO {
	int meet_area_idx;

	public int getMeet_area_idx() {
		return meet_area_idx;
	}

	public void setMeet_area_idx(int meet_area_idx) {
		this.meet_area_idx = meet_area_idx;
	}

	@Override
	public String toString() {
		return "SelectMeetAreaIdxDTO [meet_area_idx=" + meet_area_idx + "]";
	}

	public SelectMeetAreaIdxDTO(int meet_area_idx) {
		super();
		this.meet_area_idx = meet_area_idx;
	}
	
}
