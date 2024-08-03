package dto;

public class Customer_ServiceDTO {
	
	private String content; 
	private String title;
	private String reg_date;
	private int views;
	private int notice_idx;
	
	public Customer_ServiceDTO(String content, String title, String reg_date, int views, int notice_idx) {
		this.content = content;
		this.title = title;
		this.reg_date = reg_date;
		this.views = views;
		this.notice_idx = notice_idx;
	}

	
	
	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
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



	public int getNotice_idx() {
		return notice_idx;
	}



	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}



	@Override
	public String toString() {
		return "Customer_ServiceDTO [content=" + content + ", title=" + title + ", reg_date=" + reg_date + ", views="
				+ views + ", notice_idx=" + notice_idx + "]";
	}



	public String getShortTitle(int length) {
        if (title.length() > length) {
            return title.substring(0, length) + "...";
        } else {
            return title;
        }
    }

    public String getShortContent(int length) {
        if (content.length() > length) {
            return content.substring(0, length) + "...";
        } else {
            return content;
        }
    }
}
