package dto;

public class ScriptManagementDto {

	private String star_rating; // 별점
	private String play_name;
	private String title;
	private String content;
	private String reg_date;
	private int script_idx;
	
	public ScriptManagementDto(String star_rating, String play_name, String title, String content, String reg_date, int script_idx) {
		this.star_rating = star_rating;
		this.play_name = play_name;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.script_idx = script_idx;
	}
	public String getStar_rating() {
		return star_rating;
	}
	public String getPlay_name() {
		return play_name;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public int getScript_idx() {
		return script_idx;
	}
	public void setScript_idx(int script_idx) {
		this.script_idx = script_idx;
	}
	@Override
	public String toString() {
		return "ScriptManagementDto [star_rating=" + star_rating + ", play_name=" + play_name + ", title=" + title
				+ ", content=" + content + ", reg_date=" + reg_date + ", script_idx=" + script_idx + "]";
	}
}
