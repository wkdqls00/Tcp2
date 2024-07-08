package dto;

public class Selectpayment_p1DTO {

		private String play_name;
		private String playhall_name;
		private String date;
		private String time;
		public Selectpayment_p1DTO(String play_name, String playhall_name, String date, String time) {
			this.play_name = play_name;
			this.playhall_name = playhall_name;
			this.date = date;
			this.time = time;
		}
		public String getPlay_name() {
			return play_name;
		}
		public String getPlayhall_name() {
			return playhall_name;
		}
		public String getDate() {
			return date;
		}
		public String getTime() {
			return time;
		}
		public void setPlay_name(String play_name) {
			this.play_name = play_name;
		}
		public void setPlayhall_name(String playhall_name) {
			this.playhall_name = playhall_name;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public void setTime(String time) {
			this.time = time;
		}
		@Override
		public String toString() {
			return "Selectpayment_p1DTO [play_name=" + play_name + ", playhall_name=" + playhall_name + ", date=" + date
					+ ", time=" + time + "]";
		}
		

}
