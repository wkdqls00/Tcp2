package dto;

public class ChatHistoryDTO {
	int unread_member_idx;
	String nickname;
	String content;
	String send_date;
	
	public ChatHistoryDTO(int unread_member_idx, String nickname, String content, String send_date) {
		this.unread_member_idx = unread_member_idx;
		this.nickname = nickname;
		this.content = content;
		this.send_date = send_date;
	}
	
	@Override
	public String toString() {
		return "ChatHistoryDTO [unread_member_idx=" + unread_member_idx + ", nickname=" + nickname + ", content="
				+ content + ", send_date=" + send_date + "]";
	}
	
	public int getUnread_member_idx() {
		return unread_member_idx;
	}
	public void setUnread_member_idx(int unread_member_idx) {
		this.unread_member_idx = unread_member_idx;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSend_date() {
		return send_date;
	}
	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}
	
}
