package di.step01;

public class Main {
	
	public Main() {
		OracleDB kim = new OracleDB();
		String r = kim.find();
		System.out.println(r);
		
		DataBase lee = new DataBase();
		String s = lee.select();
		System.out.println(s);
		
		MyDB yoon = new MyDB();
		yoon.search();
	}
	
	public static void main(String[] args) {
		new Main();
		
	}
}
