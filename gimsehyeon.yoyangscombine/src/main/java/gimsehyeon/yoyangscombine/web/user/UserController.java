package gimsehyeon.yoyangscombine.web.user;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import gimsehyeon.yoyangscombine.service.mail.MailService;
import gimsehyeon.yoyangscombine.service.user.UserService;

@Controller
public class UserController {
	@Autowired private UserService userService;
	@Autowired private MailService mailService;
	
	@GetMapping("/user/login")
	public String loginIn() {
		return "user/login";	//view의 이름.
	}
	
	@PostMapping("/user/login")
	public String login(@RequestParam("userId") String userId,
						@RequestParam("password") String password, Model model, HttpSession session) {
		String view = "";
		String loginChecker = userService.loginCheck(userId, password);
		
		if(loginChecker.equals("ID")) {
			model.addAttribute("msg", "일치하는 아이디가 없습니다.");
			view = "user/login";
		}
		if(loginChecker.equals("PW")) {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			view = "user/login";
		}
		if(loginChecker.equals("SUCCESS")) {
			session.setAttribute("userId", userId);
			session.setAttribute("userName", userService.getUser(userId).getUserName());
			view = "redirect:../";
		}
		if(loginChecker.equals("ADMIN")) {
			session.setAttribute("userId", userId);
			view = "redirect:../admin";
		}
		
		return view;
	}
	
	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("/user/join")
	public String joinIn(Model model) {
		return "user/join";
	}
	
	@PostMapping("/user/join")
	public String join(@RequestParam("userId") String userId, @RequestParam("userName") String userName,
						@RequestParam("password") String password, Model model) {
		int result = userService.addUser(userId, userName, password);
		
		if(result != 0) model.addAttribute("msg", "회원가입이 성공적으로 완료되었습니다. 로그인하여 모든 기능을 이용하세요.");
		else model.addAttribute("msg", "회원가입 중 오류가 발생하였습니다. 다시 시도하세요.");
		
		return "main";
	}
	
	@GetMapping("/user/createEmailCheck")
	@ResponseBody
	public String createEmailCheck(@RequestParam String userId) throws Exception{
		Random random = new Random();
		int authCode = random.nextInt(888888) + 111111;
		
		String from = "shking28@gmail.com";
        String to = userId;
        String subject = "회원가입 인증 이메일 입니다.";
        String mailContent = mailService.createMailContent(Integer.toString(authCode));
        
        mailService.sendMail(subject, mailContent, from, to, null);
        
        String code = Integer.toString(authCode);
        
		return code;
	}
}