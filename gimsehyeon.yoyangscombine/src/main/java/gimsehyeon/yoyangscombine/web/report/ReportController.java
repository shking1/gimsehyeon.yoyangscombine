package gimsehyeon.yoyangscombine.web.report;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("report")
public class ReportController {
	
	@GetMapping("/report/report")
	public String reportBoard() {
		return "report/report";
	}
	
	@PostMapping("/report/report")
	public String reportBoardOut() {
		return "report/report";
	}
	
}
