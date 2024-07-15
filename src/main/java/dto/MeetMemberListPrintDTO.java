package dto;

public class MeetMemberListPrintDTO {
	String nickname;
	String admin_ok;
	String profile;
	int meet_member_idx;
	int member_idx;
	String sub_a;
	String sub_q;
	String join_wait;
	
	public MeetMemberListPrintDTO(int meet_member_idx) {
		this.meet_member_idx = meet_member_idx;
	}
	public MeetMemberListPrintDTO(String nickname, String sub_q, String sub_a, int member_idx) {
		this.nickname = nickname;
		this.sub_a = sub_a;
		this.sub_q = sub_q;
		this.member_idx = member_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getSub_a() {
		return sub_a;
	}
	public void setSub_a(String sub_a) {
		this.sub_a = sub_a;
	}
	public String getSub_q() {
		return sub_q;
	}
	public void setSub_q(String sub_q) {
		this.sub_q = sub_q;
	}
	public String getJoin_wait() {
		return join_wait;
	}
	public void setJoin_wait(String join_wait) {
		this.join_wait = join_wait;
	}
	public MeetMemberListPrintDTO(String nickname, String admin_ok, String profile) {
		this.nickname = nickname;
		this.admin_ok = admin_ok;
		this.profile = profile;
	}
	public void setMeet_member_idx(int meet_member_idx) {
		this.meet_member_idx = meet_member_idx;
	}
	@Override
	public String toString() {
		return "MeetMemberListPrintDTO [nickname=" + nickname + ", admin_ok=" + admin_ok + ", profile=" + profile + "]";
	}
	public int getMeet_member_idx() {
		return meet_member_idx;
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
