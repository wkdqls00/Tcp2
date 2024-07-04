package dto;

public class MeetMemberSettingPrintDTO {
	String sub_q;
	String join_ok;
	String sub_qok;
	
	public String getSub_q() {
		return sub_q;
	}
	public void setSub_q(String sub_q) {
		this.sub_q = sub_q;
	}
	public String getJoin_ok() {
		return join_ok;
	}
	public void setJoin_ok(String join_ok) {
		this.join_ok = join_ok;
	}
	public String getSub_qok() {
		return sub_qok;
	}
	public void setSub_qok(String sub_qok) {
		this.sub_qok = sub_qok;
	}
	@Override
	public String toString() {
		return "MeetMemberSettingPrintDTO [sub_q=" + sub_q + ", join_ok=" + join_ok + ", sub_qok=" + sub_qok + "]";
	}
	public MeetMemberSettingPrintDTO(String sub_q, String join_ok, String sub_qok) {
		this.sub_q = sub_q;
		this.join_ok = join_ok;
		this.sub_qok = sub_qok;
	}
	
}
