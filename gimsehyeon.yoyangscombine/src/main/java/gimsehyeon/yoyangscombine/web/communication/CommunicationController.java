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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gimsehyeon.yoyangscombine.domain.Communication;
import gimsehyeon.yoyangscombine.service.communication.CommunicationService;
import gimsehyeon.yoyangscombine.service.communication.pager.Pager;

@Controller
public class CommunicationController {
	 @Autowired private CommunicationService commService;
	 
	 //게시판 화면 Controller
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
	 
	 //게시글 작성 화면 이동 Controller
	 @GetMapping("/communication/write")
	 public String writeCommunicationIn() {
		 return "communication/write";
	 }
	 
	 @PostMapping("/communication/write")
	 public String writeCommunicationOut() {
		 return "communication/write";
	 }
	 
	 //게시글 수정 Controller
	 @PostMapping("/communication/update")
	 public String updateComm(@ModelAttribute Communication comm, @RequestParam int communicationNum,
			 @RequestParam String communicationTitle, @RequestParam String communicationPost) throws Exception {
		 System.out.println("communicationNum : " + communicationNum);
		 System.out.println("communicationTitle : " + communicationTitle);
		 System.out.println("communicationPost : " + communicationPost);
		 comm.setCommunicationNum(communicationNum);
		 comm.setCommunicationTitle(communicationTitle);
		 comm.setCommunicationPost(communicationPost);
		 commService.modifyComm(comm);
		 return "redirect:../communication";
	 }
	 
	 //게시글 작성 Controller
	 @PostMapping("/communication/insert")
	 public String insertCommunication(@ModelAttribute Communication comm, HttpSession session) throws Exception {
		 //로그인한 사용자의 아이디
		 String writer = (String)session.getAttribute("userName");
		 comm.setWriter(writer);
		 //레코드가 저장됨
		 commService.writeComm(comm);
		 //목록 갱신
		 return "redirect:../communication";
	 }
	 
	 //게시글 삭제 Controller
	 @PostMapping("/communication/delete")
	 public String deleteCommunication(@RequestParam int communicationNum) throws Exception {
		 commService.removeComm(communicationNum);
		 return "redirect:../communication";
	 }
	 
	 //해당 게시물 상세보기 화면으로 이동 Controller
	 @GetMapping("/communication/post")
	 public ModelAndView commPostIn(@RequestParam int communicationNum, 
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
	 
	 @PostMapping("/communication/post")
	 public ModelAndView commPostOut(@RequestParam int communicationNum, 
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
	 
	//게시글 수정 화면으로 이동 Controller
	 @RequestMapping("communication/editPost")
	 public String editPost(@RequestParam int communicationNum, Model model) throws Exception {
		 model.addAttribute("comm", commService.readComm(communicationNum));
		 return "communication/editPost";
	 }
}
