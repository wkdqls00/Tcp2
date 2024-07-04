package dto;

public class MeetMemberProfilePrintDTO {
	String profile;
	String nickname;
	
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
	
	public MeetMemberProfilePrintDTO(String profile, String nickname) {
		this.profile = profile;
		this.nickname = nickname;
	}
}
