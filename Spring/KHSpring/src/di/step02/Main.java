package di.step02;

public class Main {
	
	public Main() {
		
		// new가 많음 (의존성이 높다)
		DB kim = new OracleDB(); // 다형성
		System.out.println(kim.select("kim"));
		
		DB lee = new DataBase();
		System.out.println(lee.select("lee"));
		
		DB yoon = new MyDB();
		System.out.println(yoon.select("yoon"));
		
	}
	
	public static void main(String[] args) {
		new Main();
	}
}
