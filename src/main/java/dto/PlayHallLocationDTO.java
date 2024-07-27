package dto;

public class PlayHallLocationDTO {

	private String playHallName;
	private String latitude;
	private String longitude;
	private String areaName;
	private String image_Url;
	private String address;
	private String phone_No;

	
	public PlayHallLocationDTO(String playHallName, String latitude, String longitude, String areaName,
			String image_Url, String address, String phone_No) {
		this.playHallName = playHallName;
		this.latitude = latitude;
		this.longitude = longitude;
		this.areaName = areaName;
		this.image_Url = image_Url;
		this.address = address;
		this.phone_No = phone_No;
	}


	public String getPlayHallName() {
		return playHallName;
	}


	public String getLatitude() {
		return latitude;
	}


	public String getLongitude() {
		return longitude;
	}


	public String getAreaName() {
		return areaName;
	}


	public String getImage_Url() {
		return image_Url;
	}


	public String getAddress() {
		return address;
	}


	public String getPhone_No() {
		return phone_No;
	}


	public void setPlayHallName(String playHallName) {
		this.playHallName = playHallName;
	}


	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}


	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}


	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}


	public void setImage_Url(String image_Url) {
		this.image_Url = image_Url;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public void setPhone_No(String phone_No) {
		this.phone_No = phone_No;
	}


	@Override
	public String toString() {
		return "PlayHallLocationDTO [playHallName= " + playHallName + ", latitude= " + latitude + ", longitude= "
				+ longitude + ", areaName= " + areaName + ", image_Url= " + image_Url + ", address= " + address
				+ ", phone_No= " + phone_No + "]";
	}
	
	
	
	
	
}
