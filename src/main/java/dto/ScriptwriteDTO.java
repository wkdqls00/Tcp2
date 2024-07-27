package dto;

public class ScriptwriteDTO {

	private String email;
	private String content;
	private String starRating;
	private String title;
	private String regDate;
	private String delOk;
	private int script_idx;

	
	public ScriptwriteDTO(String email, String content, String starRating, 
			String title, String regDate, String delOk, int script_idx) {
		this.email = email;
		this.content = content;
		this.starRating = starRating;
		this.title = title;
		this.regDate = regDate;
		this.delOk = delOk;
		this.script_idx = script_idx;
	}


	public int getScript_idx() {
		return script_idx;
	}


	public void setScript_idx(int script_idx) {
		this.script_idx = script_idx;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getStarRating() {
		return starRating;
	}


	public void setStarRating(String starRating) {
		this.starRating = starRating;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getDelOk() {
		return delOk;
	}


	public void setDelOk(String delOk) {
		this.delOk = delOk;
	}


	@Override
	public String toString() {
		return "ScriptwriteDTO [email=" + email + ", content=" + content + ", starRating=" + starRating + ", title="
				+ title + ", regDate=" + regDate + ", delOk=" + delOk + "]";
	}

}
