package servlet;

import java.util.Date;

public class Ticket_checkDto {

   private int payment_idx;
   private String name;
   private Date start_date;
   private String status;
   private String start_time;
   
   public Ticket_checkDto(int payment_idx, String name, Date start_date, String status, String start_time) {
      this.payment_idx = payment_idx;
      this.name = name;
      this.start_date = start_date;
      this.status = status;
      this.start_time = start_time;
   }

	public int getPayment_idx() {
		return payment_idx;
	}
	
	public void setPayment_idx(int payment_idx) {
		this.payment_idx = payment_idx;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Date getStart_date() {
		return start_date;
	}
	
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getStart_time() {
		return start_time;
	}
	
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	@Override
	public String toString() {
		return "CheckReservationDTO [payment_idx=" + payment_idx + ", name=" + name + ", start_date=" + start_date
				+ ", status=" + status + ", start_time=" + start_time + "]";
	}
   
}
