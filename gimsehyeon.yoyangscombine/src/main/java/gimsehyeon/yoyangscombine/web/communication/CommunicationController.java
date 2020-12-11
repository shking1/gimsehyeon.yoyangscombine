package gimsehyeon.yoyangscombine.web.communication;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gimsehyeon.yoyangscombine.domain.Communication;
import gimsehyeon.yoyangscombine.service.communication.CommunicationService;
import gimsehyeon.yoyangscombine.service.communication.pager.Pager;

@Controller
public class CommunicationController {
	 @Autowired private CommunicationService commService;
	 
	 @RequestMapping("/communication")
	 public String allCommunications(Model model,
			 @RequestParam(defaultValue="all") String searchOption,
			 @RequestParam(defaultValue="") String keyWord,
			 @RequestParam(defaultValue="1") int curPage) throws Exception {
		 int count = commService.calcComm(searchOption, keyWord); //레코드 갯수
		 Pager pager = new Pager(count, curPage);
		 int start = pager.getPageBegin();
		 int end = pager.getPageEnd();
		 //게시글 목록
		 List<Communication> lists = commService.getComms(start, end, searchOption, keyWord);	
		 //맵에 자료 저장
		 Map<String, Object> comms = new HashMap<>();	
		 comms.put("lists", lists);
		 comms.put("count", count);
		 comms.put("searchOption", searchOption);
		 comms.put("keyWord", keyWord);
		 comms.put("pager", pager);
		 //데이터 저장
		 model.addAttribute("comms", comms);
		 //이동할 페이지 지정
		 return "communication/list";	
	 }
	 
	 @GetMapping("/communication/write")
	 public String writeCommunication() {
		 return "communication/write";
	 }
	 
	 @PostMapping("/communication/insert")
	 public String insertCommunication(@ModelAttribute Communication comm, HttpSession session) throws Exception {
		 //로그인한 사용자의 아이디
		 String writer = (String)session.getAttribute("userName");
		 System.out.println(writer);
		 comm.setWriter(writer);
		 //레코드가 저장됨
		 commService.writeComm(comm);
		 //목록 갱신
		 return "redirect:./";
	 }
	 
	 @RequestMapping(value = "/communication/post", method = RequestMethod.GET)
	 public ModelAndView commPost(@RequestParam int communicationNum, 
			 @RequestParam int curPage, @RequestParam String searchOption,
			 @RequestParam String keyWord) throws Exception{
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("communication/post");
		 mav.addObject("commPost", commService.readComm(communicationNum));
		 mav.addObject("curPage", curPage);
		 mav.addObject("searchOption", searchOption);
		 mav.addObject("keyWord", keyWord);
		 return mav;
	 }
	 
	 @RequestMapping("communication/editPost")
	 public String editPost(@RequestParam int communicationNum, Model model) throws Exception {
		 model.addAttribute("comm", commService.readComm(communicationNum));
		 return "communication/editPost";
	 }
}
