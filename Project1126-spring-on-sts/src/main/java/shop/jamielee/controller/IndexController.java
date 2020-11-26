package shop.jamielee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Controller
@RequestMapping("/")
public class IndexController {

	private HttpSession session;

	public IndexController(HttpSession session) {
		this.session = session;
	}

	@GetMapping
	public String index() {
		HttpServletRequest req = 
				((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = req.getSession();
		session.setAttribute("test", "세션가능?");
		return "index";
	}


	@GetMapping("/page")
	public String page() {
		String value = (String) session.getAttribute("test");
		System.out.println(value);
		return "page";
	}


}
