package aop.exam01;

public class SalesDao implements Dao {

	@Override
	public void select() {
		System.out.println("BoardDao.select()");
		
	}
	
}
