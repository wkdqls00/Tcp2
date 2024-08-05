package dto;

import java.util.Date;

public class Ticket_checkDto {

   private int payment_idx;
   private String name;
   private Date start_date;
   private String status;
   private String start_time;
   private String pay_date;
   private int play_idx;


public Ticket_checkDto(int payment_idx, String name, Date start_date, String status, String start_time, String pay_date, int play_idx) {
      this.payment_idx = payment_idx;
      this.name = name;
      this.start_date = start_date;
      this.status = status;
      this.start_time = start_time;
      this.pay_date = pay_date;
      this.play_idx = play_idx;
   }
	
	public void setPlay_idx(int play_idx) {
		this.play_idx = play_idx;
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

    public String getPay_date() {
			return pay_date;
	}

	public void setPay_date(String pay_date) {
			this.pay_date = pay_date;
	}
	
	public int getPayment_idx() {
		return payment_idx;
	}
	
	public int getPlay_idx() {
		return play_idx;
	}
	
	
   
}
