package aop.exam01;

public class MemberDao implements Dao {

	@Override
	public void select() {
		System.out.println("MemberDao.select()");
		
	} 
	
	
}
