package dto;

public class Exp_RatingDTO {

	private String email;
	private String regDate;
	private String content;
	private String del_ok;
	private int exp_rating_idx;

	public Exp_RatingDTO(String email, String regDate, String content, String del_ok, int exp_rating_idx) {
		this.email = email;
		this.regDate = regDate;
		this.content = content;
		this.del_ok = del_ok;
		this.exp_rating_idx = exp_rating_idx;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getRegDate() {
		return regDate;
	}



	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getDel_ok() {
		return del_ok;
	}



	public void setDel_ok(String del_ok) {
		this.del_ok = del_ok;
	}



	public int getExp_rating_idx() {
		return exp_rating_idx;
	}



	public void setExp_rating_idx(int exp_rating_idx) {
		this.exp_rating_idx = exp_rating_idx;
	}



	@Override
	public String toString() {
		return "Exp_RatingDTO [email=" + email + ", regDate=" + regDate + ", content=" + content + ", del_ok=" + del_ok
				+ ", exp_rating_idx=" + exp_rating_idx + "]";
	}



	
	
	
	
	
	
}
