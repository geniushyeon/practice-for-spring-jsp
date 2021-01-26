package mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Hello {
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public ModelAndView test(ModelAndView mv) {
		mv.setViewName("myname"); // prefix + myname + suffix
		mv.addObject("message", "hi");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/multiplication.do", method=RequestMethod.GET) 
	public ModelAndView multiplication() {
		ModelAndView mv = new ModelAndView();
		StringBuffer sb = new StringBuffer();
		
		int number = 9;
		for (int i=1; i<10; i++) {
			String multiplication = String.format("%d * %d = %d <br/>", number, i , number * i);
			sb.append(multiplication);
		}
		
		mv.setViewName("multiplication_result");
		mv.addObject("multiplication", sb.toString());
		
		return mv;
		
	}
	
	@RequestMapping(value = "/sum.do", method = RequestMethod.GET)
	public ModelAndView printSum() {
		ModelAndView mv = new ModelAndView();
		
		int a = (int)(Math.random() * 100);
		int b = (int)(Math.random() * 100);
		
		int sum = a + b;
		

		mv.setViewName("sum_result");
		mv.addObject("a", a);
		mv.addObject("b", b);
		mv.addObject("sum", sum);
		
		return mv;
	}
}
