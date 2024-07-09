package dto;

public class BandPublicOkDTO {
	String public_ok;

	public String getPublic_ok() {
		return public_ok;
	}

	public void setPublic_ok(String public_ok) {
		this.public_ok = public_ok;
	}
	
	public BandPublicOkDTO(String public_ok) {
		this.public_ok = public_ok;
	}

	public String toString() {
		return "BandPublicOkDTO [public_ok=" + public_ok + "]";
	}
}
