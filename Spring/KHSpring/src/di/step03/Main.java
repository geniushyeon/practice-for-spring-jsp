package di.step03;

// 외부로 노출되면 안 되는 코드
// 외부 환경의 변화에 덜 민감해짐.
// POJO (Plane Old Java Object)

public class Main {
	
	DB db;
	
	// 생성자를 통한 의존성 주입
	public Main(DB db) {
		
		this.db = db;
		System.out.println(db.select("hi"));
		
	}
	
	// 메소드를 통한 의존성 주입
	public void method(DB db) {
		
		this.db = db;
		System.out.println(db.select("lee"));
		
	}
	
 	public static void main(String[] args) {
 		
 		Assembler assembler = new Assembler();
 		DB db = assembler.getDb();
 		Main main = new Main(db);
 		
 		main.method(db);
 	}
	
	
	
}
