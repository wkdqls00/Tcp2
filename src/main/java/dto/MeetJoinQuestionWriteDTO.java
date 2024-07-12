package dto;

public class MeetJoinQuestionWriteDTO {
	int join_wait_count;

	public int getJoin_wait_count() {
		return join_wait_count;
	}

	public void setJoin_wait_count(int join_wait_count) {
		this.join_wait_count = join_wait_count;
	}

	public MeetJoinQuestionWriteDTO(int join_wait_count) {
		super();
		this.join_wait_count = join_wait_count;
	}

	@Override
	public String toString() {
		return "MeetJoinQuestionWriteDTO [join_wait_count=" + join_wait_count + "]";
	}
	
	
	
}