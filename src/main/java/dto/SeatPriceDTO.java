package dto;

public class SeatPriceDTO {
	private String rank;
	private String price;

	public SeatPriceDTO(String rank, String price) {
		this.rank = rank;
		this.price = price;
	}
	
	public String getRank() {
		return rank;
	}
	
	public String getPrice() {
		return price;
	}

	@Override
	public String toString() {
		return "SeatPriceDTO [rank=" + rank + ", price=" + price + "]";
	}
	
	
}
