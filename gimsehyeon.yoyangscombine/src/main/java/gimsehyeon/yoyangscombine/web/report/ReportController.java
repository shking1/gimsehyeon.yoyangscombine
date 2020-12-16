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

import gimsehyeon.yoyangscombine.domain.Report;
import gimsehyeon.yoyangscombine.service.communication.pager.Pager;
import gimsehyeon.yoyangscombine.service.report.ReportService;

@Controller
public class ReportController {
	@Autowired private ReportService reportService;	
	
	@RequestMapping("report")
	public String allReport(Model model, Integer reportNum, @RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyWord, @RequestParam(defaultValue="1") int curPage) throws Exception{
		int count = reportService.calcReport(searchOption, keyWord);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		//reportboard
		List<Report> boards = reportService.getReports(start, end);
		Map<String, Object> reports = new HashMap<>();
		reports.put("boards", boards);
		reports.put("count", count);
		reports.put("pager", pager);
		model.addAttribute("reports", reports);
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
