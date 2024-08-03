package dto;

public class Customer_ServiceCDTO {
	
	private String content; 
	private String title;
	private String reg_date;
	private int views;

	public Customer_ServiceCDTO(String content, String title, String reg_date, int views) {
		this.content = content;
		this.title = title;
		this.reg_date = reg_date;
		this.views = views;
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

	@Override
	public String toString() {
		return "Customer_ServiceCDTO [content=" + content + ", title=" + title + ", reg_date=" + reg_date + ", views="
				+ views + "]";
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
