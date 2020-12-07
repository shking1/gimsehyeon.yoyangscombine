package gimsehyeon.yoyangscombine.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gimsehyeon.yoyangscombine.service.user.UserService;

@Controller
public class UserController {
	@Autowired private UserService userService;
	
	@GetMapping("/user/login")
	public String loginIn() {
		return "user/login";	//view의 이름.
	}
	
	@PostMapping("/user/login")
	public String login(@RequestParam("memberId") String memberId,
						@RequestParam("password") String password, Model model, HttpSession session) {
		String view = "";
		String loginChecker = userService.loginCheck(memberId, password);
		
		if(loginChecker.equals("ID")) {
			model.addAttribute("msg", "일치하는 아이디가 없습니다.");
			view = "user/login";
		}
		if(loginChecker.equals("PW")) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			view = "user/login";
		}
		if(loginChecker.equals("SUCCESS")) {
			session.setAttribute("memberId", memberId);
			view = "redirect:../";
		}
		if(loginChecker.equals("ADMIN")) {
			session.setAttribute("memberId", memberId);
			view = "redirect:../admin";
		}
		
		return view;
	}
	
	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
}