package dto;

public class ChatListDTO {
	String title;
	String content;
	String max_send_date;
	int chat_idx;
	
	public ChatListDTO(String title, String content, String max_send_date, int chat_idx) {
		this.title = title;
		this.content = content;
		this.chat_idx = chat_idx;
		this.max_send_date = max_send_date;
	}
	
	@Override
	public String toString() {
		return "ChatListDTO [title=" + title + ", content=" + content + ", max_send_date=" + max_send_date + "]";
	}
	public String getTitle() {
		return title;
	}
	
	public int getChat_idx() {
		return chat_idx;
	}

	public void setChat_idx(int chat_idx) {
		this.chat_idx = chat_idx;
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
