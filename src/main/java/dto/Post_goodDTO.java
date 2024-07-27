package dto;

public class Post_goodDTO {
	
	private int postGood;
	
	public Post_goodDTO(int postGood) {
		this.postGood = postGood;
	}
	
	public int getpostGood(int postGood) {
		return postGood;
	}
	
	public void setpostGood(int postGood) {
		this.postGood = postGood;
	}

	@Override
	public String toString() {
		return "Post_goodDTO [postGood= " + postGood + "]";
	}

	
	
	
}
