package dto;

public class JoinConditionPrintDTO {
	private String gender;
	private int age;
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	
	public String toString() {
		return "JoinConditionPrintDTO [gender=" + gender + ", age=" + age + "]";
	}
	
	public JoinConditionPrintDTO(String gender, int age) {
		this.gender = gender;
		this.age = age;
	}
	
}
