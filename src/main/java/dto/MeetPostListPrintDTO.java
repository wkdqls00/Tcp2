package dto;

public class MeetPostListPrintDTO {
	int member_idx;
	int post_idx;
	String nickname;
	String profile;
	String content;
	String reg_date;
	int views;
	String file_url;
	int meet_member_idx;
	

	public int getMeet_member_idx() {
		return meet_member_idx;
	}

	public void setMeet_member_idx(int meet_member_idx) {
		this.meet_member_idx = meet_member_idx;
	}

	public MeetPostListPrintDTO(int meet_member_idx) {
		this.meet_member_idx = meet_member_idx;
	}
	public MeetPostListPrintDTO(int member_idx, String nickname, String profile, String content, String reg_date, int views,
								String file_url, int post_idx) {
		this.member_idx = member_idx;
		this.nickname = nickname;
		this.profile = profile;
		this.content = content;
		this.reg_date = reg_date;
		this.views = views;
		this.file_url = file_url;
		this.post_idx = post_idx;
	}
	
	@Override
	public String toString() {
		return "MeetPostListPrintDTO [nickname=" + nickname + ", profile=" + profile + ", content=" + content
				+ ", reg_date=" + reg_date + ", views=" + views + ", file_url=" + file_url + "]";
	}
	public int getPost_idx() {
		return post_idx;
	}
	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getFile_url() {
		return file_url;
	}
	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}
}
