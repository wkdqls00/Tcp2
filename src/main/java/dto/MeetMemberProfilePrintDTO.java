package dto;

public class MeetMemberProfilePrintDTO {
	int member_idx;
	String profile;
	String nickname;
	String mNickname;
	
	public String getmNickname() {
		return mNickname;
	}
	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}
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
	
	public MeetMemberProfilePrintDTO(int member_idx, String nickname, String profile, String mNickname) {
		this.member_idx = member_idx;
		this.profile = profile;
		this.nickname = nickname;
		this.mNickname = mNickname;
	}
}
