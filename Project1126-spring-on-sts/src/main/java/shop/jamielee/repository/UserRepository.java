package shop.jamielee.repository;

import java.util.List;

import shop.jamielee.domain.User;

public interface UserRepository {
	
	// create
	int createUser(User user);
	
	// read
	User findById(long id);
	List<User> findAll();
	
	
	// update
	int updateUser(User user);
	
	// delete
	int deleteUser(long id);
}
