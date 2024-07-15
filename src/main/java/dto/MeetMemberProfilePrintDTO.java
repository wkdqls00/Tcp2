package dto;

public class MeetMemberProfilePrintDTO {
	int member_idx;
	String profile;
	String nickname;
	
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "MeetMemberProfilePrintDTO [profile=" + profile + ", nickname=" + nickname + "]";
	}
	
	public MeetMemberProfilePrintDTO(int member_idx, String nickname, String profile) {
		this.member_idx = member_idx;
		this.profile = profile;
		this.nickname = nickname;
	}
}
