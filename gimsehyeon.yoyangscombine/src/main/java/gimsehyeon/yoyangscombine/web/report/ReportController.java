package gimsehyeon.yoyangscombine.web.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import gimsehyeon.yoyangscombine.service.communication.pager.Pager;
import gimsehyeon.yoyangscombine.service.report.ReportService;

@Controller
@SessionAttributes("report")
public class ReportController {
	@Autowired private ReportService reportService;	
	
	@RequestMapping("/report")
	public String allReport(Model model,Integer reportNum, @RequestParam(defaultValue="1") int curPage) throws Exception{
		int count = reportService.calcReport(reportNum);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
	
		return "report/report";
	}

	@GetMapping("/report/report")
	public String reportBoardin() {
		return "report/report";
	}
	
	@PostMapping("/report/report")
	public String reportBoardOut() {
		return "report/report";
	}
	
	
}
