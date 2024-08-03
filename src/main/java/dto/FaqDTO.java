package dto;

public class FaqDTO {
	
	private String category;
	private String faq;
	private String reply;
	private String faq_date;
	private int faq_idx;

	
	public FaqDTO(String category, String faq, String reply, String faq_date, int faq_idx) {
		this.category = category;
		this.faq = faq;
		this.reply = reply;
		this.faq_date = faq_date;
		this.faq_idx = faq_idx;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getFaq() {
		return faq;
	}


	public void setFaq(String faq) {
		this.faq = faq;
	}


	public String getReply() {
		return reply;
	}


	public void setReply(String reply) {
		this.reply = reply;
	}


	public String getFaq_date() {
		return faq_date;
	}


	public void setFaq_date(String faq_date) {
		this.faq_date = faq_date;
	}


	public int getFaq_idx() {
		return faq_idx;
	}


	public void setFaq_idx(int faq_idx) {
		this.faq_idx = faq_idx;
	}


	@Override
	public String toString() {
		return "FaqDTO [category=" + category + ", faq=" + faq + ", reply=" + reply + ", faq_date=" + faq_date
				+ ", faq_idx=" + faq_idx + "]";
	}
	
	
	
	
	
	
}
