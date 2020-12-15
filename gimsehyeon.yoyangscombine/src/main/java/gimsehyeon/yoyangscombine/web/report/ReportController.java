package gimsehyeon.yoyangscombine.web.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import gimsehyeon.yoyangscombine.domain.Report;
import gimsehyeon.yoyangscombine.service.communication.pager.Pager;
import gimsehyeon.yoyangscombine.service.report.ReportService;

@Controller
//@SessionAttributes("report")
public class ReportController {
	@Autowired private ReportService reportService;	
	
	@RequestMapping("report")
	public String allReport(Model model,
			@RequestParam(defaultValue="1") int curPage) throws Exception{
//		System.out.println(reportNum);
//		int count = reportService.calcReport(reportNum);
//		Pager pager = new Pager(count, curPage);
//		int start = pager.getPageBegin();
//		int end = pager.getPageEnd();
		//reportboard
		List<Report> boards = reportService.getReports(0, 0);
		Map<String, Object> reports = new HashMap<>();
		reports.put("boards", boards);
//		reports.put("count", count);
//		reports.put("pager", pager);
		model.addAttribute("reports", reports);
		System.out.println(boards);
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
