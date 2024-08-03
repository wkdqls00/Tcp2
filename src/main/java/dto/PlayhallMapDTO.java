package dto;

public class PlayhallMapDTO {

	private double longitude;
	private double latitude;
	private int playhall_idx;

	
	public PlayhallMapDTO(double longitude, double latitude, int playhall_idx) {
		this.longitude = longitude;
		this.latitude = latitude;
		this.playhall_idx = playhall_idx;
	}


	public double getLongitude() {
		return longitude;
	}


	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}


	public double getLatitude() {
		return latitude;
	}


	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}


	public int getPlayhall_idx() {
		return playhall_idx;
	}


	public void setPlayhall_idx(int playhall_idx) {
		this.playhall_idx = playhall_idx;
	}


	@Override
	public String toString() {
		return "PlayhallMapDTO [longitude=" + longitude + ", latitude=" + latitude + ", playhall_idx=" + playhall_idx
				+ "]";
	}
	
	
}
