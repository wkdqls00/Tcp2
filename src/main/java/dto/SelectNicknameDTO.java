package dto;

public class SelectNicknameDTO {
	String nickname;

	public SelectNicknameDTO(String nickname) {
		super();
		this.nickname = nickname;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
