package gimsehyeon.yoyangscombine.web.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gimsehyeon.yoyangscombine.domain.Review;
import gimsehyeon.yoyangscombine.domain.User;
import gimsehyeon.yoyangscombine.service.report.ReportService;
import gimsehyeon.yoyangscombine.service.review.ReviewService;
import gimsehyeon.yoyangscombine.service.sanatorium.SanaService;
import gimsehyeon.yoyangscombine.service.user.UserService;


@Controller
public class ReviewController {
	@Autowired private ReviewService reviewService;
	@Autowired private UserService userService;
	@Autowired private SanaService sanaService;
	@Autowired private ReportService reportService;
	// 후기조회
	@RequestMapping("/sanatorium/03") 
	public String getreview(Model model,HttpSession session) {
		
		String sanaName = (String)session.getAttribute("sanaName");
		String addr = (String)session.getAttribute("addr");
		
		if(sanaService.getSana(sanaName) == null) {
			sanaService.addSana(sanaName);
		}
		List<Review> rev = reviewService.getReviews(sanaName);
		
		Map<String, Object> reviewList = new HashMap<>();
		reviewList.put("list",rev);
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("sanaName", sanaName);
		model.addAttribute("addr", addr);
		
		return "sanatorium/03";
	}
	//후기 등록
	@PostMapping("/sanatorium/addReview")
	public String fixReview(@RequestParam("reviewPost") String reviewPost ,HttpSession session ) {
		
		String sanaName = (String)session.getAttribute("sanaName");
		String userName = (String)session.getAttribute("userName");

		reviewService.addReview(userName, reviewPost, sanaName);
		
		return "redirect:../sanatorium/03";
	}
	
	@PostMapping("/sanatorium/fixReview")
	public String fixReview(@RequestParam("reviewPost") String reviewPost, @RequestParam("reviewNum") int reviewNum,
											Model model ,HttpSession session ) {
		reviewService.fixReview(reviewNum, reviewPost);
		return "redirect:../sanatorium/03";
	}
	
	
	@PostMapping("/sanatorium/delReview")
	public String delReview( @RequestParam("reviewNum") int reviewNum) {
		
		reviewService.delReview(reviewNum);
		
		return "redirect:../sanatorium/03";
	}
	 
	   @GetMapping("/sanatorium/01.process")
	   public String sanaProc() {
	      return "sanatorium/01.process";   
	   }
	   
	@PostMapping("/sanatorium/addReport")
	public String addReport(@RequestParam("reporter") String reporter, @RequestParam("reportCode") String[] reportCode,
							@RequestParam("reportContent") String reportContent, @RequestParam("reviewNum") int reviewNum){
			
		String reportco ="";
			User user = userService.getUser(reporter);
			
				for(String reportcode: reportCode)
					reportco = reportcode;
					
				
				reportService.addReport(user.getUserNum(), Integer.parseInt(reportco), reportContent,reviewNum);	
			
			
			return "redirect:../sanatorium/03";
		}
	   
	   
}

	