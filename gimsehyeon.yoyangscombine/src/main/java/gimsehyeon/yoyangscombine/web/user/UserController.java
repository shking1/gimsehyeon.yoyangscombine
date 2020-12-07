package gimsehyeon.yoyangscombine.web.user;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import gimsehyeon.yoyangscombine.domain.Member;
import gimsehyeon.yoyangscombine.service.user.UserService;

@Controller
public class UserController {
	@Autowired private UserService userService;
	
	@GetMapping("/user/login")
	public String loginIn() {
		return "user/login";	//view의 이름.
	}
	
	@PostMapping("/user/login")
	public String login(@Valid @ModelAttribute("member") Member member, Model model, Errors err, HttpSession session) {
		String view;
		if(err.hasErrors()) view = "user/login";
		
		Member result = userService.getLoginMember(member.getMemberId(), member.getPassword());
		
		if(result == null) {
			session.setAttribute("member", null);
			model.addAttribute("msg", "아이디 또는 비밀번호가 틀립니다.");
			view = "user/login";
		}
		else {
			session.setAttribute("member", result);
			model.addAttribute("msg", null);
			if(result.getMemberId().equals("admin")) view = "admin/main";
			else view = "main";
		}
		
		return view;
	}
	
	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
}