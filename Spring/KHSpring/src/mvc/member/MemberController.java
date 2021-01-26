package mvc.member;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	Dao dao;
	
	public MemberController() {
		
	}
	
	public MemberController(Dao dao) {
		this.dao = dao;
	}
	

	@RequestMapping(value = "signup.mem", method = RequestMethod.GET)
	public ModelAndView signup() {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping(value = "signup_complete.mem", method = RequestMethod.POST)
	public ModelAndView signupComplete(MemberVo memberVo) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println(memberVo.getMid());
		System.out.println(memberVo.getPassword());
		System.out.println(memberVo.getPhonenumber());
		
		mv.setViewName("signup_complete");
		mv.addObject("message", "회원가입 완료.");
		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "member_info.mem", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView select(Page page) {
		ModelAndView mv = new ModelAndView();
		List<MemberVo> list = null;
		
		Map<String, Object> map = dao.select(page);
		page = (Page) map.get("page");
		list = (List<MemberVo>) map.get("list");
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("member_info");
		
		return mv;
	}
	
}
