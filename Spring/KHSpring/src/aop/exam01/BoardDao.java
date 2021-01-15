package aop.exam01;

public class BoardDao implements Dao {

	@Override
	public void select() {
		System.out.println("BoardDao.select()");
	}

}
