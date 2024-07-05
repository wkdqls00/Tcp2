package dto;

public class CommentListViewDTO {
	int member_idx;
	int comment_idx;
	String nickname;
	String profile;
	String content;
	String reg_date;
	
	public CommentListViewDTO(int member_idx, int comment_idx, String nickname, String profile, String content, String reg_date) {
		this.member_idx = member_idx;
		this.comment_idx = comment_idx;
		this.nickname = nickname;
		this.profile = profile;
		this.content = content;
		this.reg_date = reg_date;
	}
	
	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	
	public int getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
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

	@Override
	public String toString() {
		return "CommentListViewDTO [nickname=" + nickname + ", profile=" + profile + ", content=" + content + "]";
	}
	
	
}
