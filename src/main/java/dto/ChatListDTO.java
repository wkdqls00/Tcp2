package dto;

public class ChatListDTO {
	String title;
	String content;
	String max_send_date;
	
	public ChatListDTO(String title, String content, String max_send_date) {
		this.title = title;
		this.content = content;
		this.max_send_date = max_send_date;
	}
	
	@Override
	public String toString() {
		return "ChatListDTO [title=" + title + ", content=" + content + ", max_send_date=" + max_send_date + "]";
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMax_send_date() {
		return max_send_date;
	}
	public void setMax_send_date(String max_send_date) {
		this.max_send_date = max_send_date;
	}
}
