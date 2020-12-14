package gimsehyeon.yoyangscombine.web.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gimsehyeon.yoyangscombine.service.report.ReportService;

public class ReportController {
	@Autowired private ReportService reportService;
	
	@GetMapping("/report")
	public String reportBoard() {
		return "report/report";
	}
	
	@PostMapping("/report/report")
	public String reportBoardOut() {
		return "report/report";
	}
	
}
