package gimsehyeon.yoyangscombine.web.sanatorium;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import gimsehyeon.yoyangscombine.service.sanatorium.SanaService;



@Controller
public class SanaController {
	@Autowired private SanaService sanaService;
	

	@GetMapping("/sanatorium/01")
	public String sana01() {
		
		return "sanatorium/01";	//view의 이름.
	}
	
	
	
	@GetMapping("/sanatorium/02")
	public String sana02(HttpSession session) {
		
		return "sanatorium/02";	//view의 이름.
	}
	
	@PostMapping("/sanatorium/getReviewlist")
	public String getSanadata( @RequestParam("sanaName") String sanaName,HttpSession session) {
		session.setAttribute("sanaName", sanaName);
		
		
		return "redirect:../sanatorium/03";
	}
}
