package di.step03;


// 외부에 노출되는 코드 
// 외부 조립기 
public class Assembler {
	DB db;
	
	public DB getDb() {
		db = new OracleDB();
		// 원하는 코드로 변경 가능 
		// db = new MyDB();
		// db = new DataBase();
		
		return db;
		
	}
	
	
}
