package di.annotation;

import org.springframework.beans.factory.annotation.Autowired;

public class MemberDao {
	DB db;
	
	public MemberDao() {
		
	}
	
	@Autowired
	public MemberDao(DB db) {
		this.db = db;
		
		System.out.println("AutoWired");
	}

	public DB getDb() {
		return db;
	}

	public void setDb(DB db) {
		this.db = db;
	}
	
	
}
