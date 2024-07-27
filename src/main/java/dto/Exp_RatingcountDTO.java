package dto;

public class Exp_RatingcountDTO {

	private int expratingcount;
	
	public Exp_RatingcountDTO(int expratingcount) {
		this.expratingcount = expratingcount;
	}

	public int getExpratingcount() {
		return expratingcount;
	}

	public void setExpratingcount(int expratingcount) {
		this.expratingcount = expratingcount;
	}

	@Override
	public String toString() {
		return "ExpratingcountDTO [expratingcount=" + expratingcount + "]";
	}

}
