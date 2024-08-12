package dto;

public class RecentNoticeDTO {

	private int notice_idx;
	private String title;

	public RecentNoticeDTO(int notice_idx, String title) {
		this.notice_idx = notice_idx;
		this.title = title;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public String getTitle() {
		return title;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "RecentNoticeDTO [notice_idx=" + notice_idx + ", title=" + title + "]";
	}

}
