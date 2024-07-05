package dto;

public class CommentListViewDTO {
	int member_idx;
	String nickname;
	String profile;
	String content;
	
	public CommentListViewDTO(int member_idx, String nickname, String profile, String content) {
		this.member_idx = member_idx;
		this.nickname = nickname;
		this.profile = profile;
		this.content = content;
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

	@Override
	public String toString() {
		return "CommentListViewDTO [nickname=" + nickname + ", profile=" + profile + ", content=" + content + "]";
	}
	
	
}
