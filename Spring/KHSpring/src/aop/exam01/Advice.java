package aop.exam01;

public class Advice implements SignIn {
	Dao dao;
	
	public Advice(Dao dao) {
		this.dao = dao;
	}
	
	@Override
	public boolean signinCheck() {
		// 로그인되어있는 상태
		return false;
		
	}
	
	public void beforeAdvice() {
		String check = "";
		
		if (signinCheck() == true) {
			check = "로그인되었습니다.";
			System.out.println(check);
			dao.select();
			
		} else {
			check = "로그인이 필요합니다.";
			System.out.println(check);
		}
	}
	
}
