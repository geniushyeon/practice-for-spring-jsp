package mvc.member;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	Dao dao;
	FileUpload fileUpload;
	
	
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
	
	@RequestMapping(value = "view.mem", method = RequestMethod.POST)
	public ModelAndView view(MemberVo memberVo) {
		ModelAndView mv = new ModelAndView();
		
		memberVo = dao.view(memberVo.getMid());
		
		mv.addObject("memberVo", memberVo);
		mv.setViewName("view");
		
		return mv;
	}
	
	@RequestMapping(value = "insert.mem", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView insert() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("insert");
		
		return mv;
	}
	
	@RequestMapping(value = "insertResult.mem", method = RequestMethod.POST)
	public ModelAndView insertResult(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		fileUpload = new FileUpload(request);
		MemberVo memberVo = fileUpload.getMember();
		Page page = fileUpload.getPage();
		
		mv.setViewName("insert_result");
		mv.addObject("message", "회원정보가 정상적으로 저장되었습니다.");
		return mv;
	}
	
	@RequestMapping(value = "deleteResult.mem", method = RequestMethod.POST)
	public ModelAndView delete(MemberVo memberVo) {
		ModelAndView mv = new ModelAndView();
		
		return mv;
		
	}
	
	public ModelAndView modify(MemberVo memberVo) {
		ModelAndView mv = new ModelAndView();
		
		memberVo = dao.view(memberVo.getMid());
		
		mv.addObject("memberVo", memberVo);
		mv.setViewName("modify");
		
		return mv;
	}
}
