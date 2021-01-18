package shop.jamielee;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import shop.jamielee.domain.User;
import shop.jamielee.repository.UserRepository;

@SpringBootApplication
public class Project1126SpringOnStsApplication {

	public static void main(String[] args) {
		SpringApplication.run(Project1126SpringOnStsApplication.class, args);
	}
	
	@Autowired
	private UserRepository userRepository;
	
	
//	1) create
//	@Bean
//	public void test() {
//		User user = new User();
//		user.setEmail("test123@test.com");
//		user.setPassword("1234abcd");
//		user.setJoinedDate(LocalDateTime.now());
//		userRepository.createUser(user);
//		
//	}
//
//  2) read
//	@Bean
//	public void findTest() {
//		User user = userRepository.findById(1);
//		System.out.println(user);
//	}
//	
//	@Bean
//	public void findAllTest() {
//		System.out.println(userRepository.findAll());
//	}
//	
//  3) update
//	@Bean
//	public void updateTest() {
//		final User user = userRepository.findById(1);
//		user.setEmail("abc@def.com");
//		userRepository.updateUser(user);
//	}
//	4) delete
	@Bean
	public void deleteTest() {
		int affectedRows = userRepository.deleteUser(1);
		System.out.println(affectedRows);
	}
}
