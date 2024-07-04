package dto;

public class MeetMemberListPrintDTO {
	String nickname;
	String admin_ok;
	String profile;
	
	public MeetMemberListPrintDTO(String nickname, String admin_ok, String profile) {
		this.nickname = nickname;
		this.admin_ok = admin_ok;
		this.profile = profile;
	}
	@Override
	public String toString() {
		return "MeetMemberListPrintDTO [nickname=" + nickname + ", admin_ok=" + admin_ok + ", profile=" + profile + "]";
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAdmin_ok() {
		return admin_ok;
	}
	public void setAdmin_ok(String admin_ok) {
		this.admin_ok = admin_ok;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
}
