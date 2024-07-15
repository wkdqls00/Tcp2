package dto;

public class MybandDTO {
	private int meet_idx;
	private String meet_name;
	private String url;
	private int meet_member_count;
	
	public MybandDTO(int meet_idx, String meet_name, String url, int meet_member_count) {
		this.meet_idx = meet_idx;
		this.meet_name = meet_name;
		this.url = url;
		this.meet_member_count = meet_member_count;
	}
	
	public int getMeet_idx() {
		return meet_idx;
	}

	public void setMeet_idx(int meet_idx) {
		this.meet_idx = meet_idx;
	}

	public String getMeet_name() {
		return meet_name;
	}
	public void setMeet_name(String meet_name) {
		this.meet_name = meet_name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getMeet_member_count() {
		return meet_member_count;
	}
	public void setMeet_member_count(int meet_member_count) {
		this.meet_member_count = meet_member_count;
	}
	
	@Override
	public String toString() {
		return meet_name + ", " + url + ", " + meet_member_count;
	}
	
}
