package dto;

public class ShowInquiryInfoDTO {
	private int inquiry_idx;
	private String title;
	private String content;
	private String date;
	private String process_st;// 처리상태
	private String type;

	public ShowInquiryInfoDTO(int inquiry_idx, String title, String content, String date, String process_st,
			String type) {
		this.inquiry_idx = inquiry_idx;
		this.title = title;
		this.content = content;
		this.date = date;
		this.process_st = process_st;
		this.type = type;
	}

	public int getInquiry_idx() {
		return inquiry_idx;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getDate() {
		return date;
	}

	public String getProcess_st() {
		return process_st;
	}

	public String getType() {
		return type;
	}

	public void setInquiry_idx(int inquiry_idx) {
		this.inquiry_idx = inquiry_idx;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setProcess_st(String process_st) {
		this.process_st = process_st;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "ShowInquiryInfoDTO [inquiry_idx=" + inquiry_idx + ", title=" + title + ", content=" + content
				+ ", date=" + date + ", process_st=" + process_st + ", type=" + type + "]";
	}

}
