package gimsehyeon.yoyangscombine.web.common;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("user")
public class CommonController {
	@GetMapping("/common/mypage")
	public String myPage(Model model, HttpSession session) {
		return "common/mypage";	//view의 이름.
	}
}