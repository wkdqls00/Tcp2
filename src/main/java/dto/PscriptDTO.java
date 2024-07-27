package dto;

public class PscriptDTO {

	private String email;
	private String payDate;
	private String pay;
	private String content;
	private String starRating;
	private String title;
	private String regDate;
	private String delOk;

	public PscriptDTO(String email, String payDate, String pay, String content, String starRating, String title,
			String regDate, String delOk) {
		this.email = email;
		this.payDate = payDate;
		this.pay = pay;
		this.content = content;
		this.starRating = starRating;
		this.title = title;
		this.regDate = regDate;
		this.delOk = delOk;
	}

	public String getEmail() {
		return email;
	}

	public String getPayDate() {
		return payDate;
	}

	public String getPay() {
		return pay;
	}

	public String getContent() {
		return content;
	}

	public String getStarRating() {
		return starRating;
	}

	public String getTitle() {
		return title;
	}

	public String getRegDate() {
		return regDate;
	}

	public String getDelOk() {
		return delOk;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setStarRating(String starRating) {
		this.starRating = starRating;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public void setDelOk(String delOk) {
		this.delOk = delOk;
	}

	@Override
	public String toString() {
		return "PscriptDTO [email= " + email + ", payDate= " + payDate + ", pay= " + pay + ", content= " + content
				+ ", starRating= " + starRating + ", title= " + title + ", regDate= " + regDate + ", delOk= " + delOk + "]";
	}


	
	
	
	
}
