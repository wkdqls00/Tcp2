package dto;

public class MeetJoinQnAPrintDTO {
	private String name;
	private String sub_q;
	private String sub_a;
	
	public MeetJoinQnAPrintDTO(String name, String sub_q) {
		this.name = name;
		this.sub_q = sub_q;
	}
	public MeetJoinQnAPrintDTO(String sub_a) {
		this.sub_a = sub_a;
	}
	public String getName() {
		return name;
	}

	public String getSub_a() {
		return sub_a;
	}
	public void setSub_a(String sub_a) {
		this.sub_a = sub_a;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getSub_q() {
		return sub_q;
	}

	public void setSub_q(String sub_q) {
		this.sub_q = sub_q;
	}

	@Override
	public String toString() {
		return name + ", " + sub_q;
	}
	
}
