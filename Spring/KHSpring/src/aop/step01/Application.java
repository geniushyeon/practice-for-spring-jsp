package aop.step01;

public class Application {
	
	public Application() {
		BoardDao boardDao = new BoardDao();
		MemberDao memberDao = new MemberDao();
		SalesDao salesDao = new SalesDao();
	}
	
	public static void main(String[] args) {
		new Application();
	}
}
