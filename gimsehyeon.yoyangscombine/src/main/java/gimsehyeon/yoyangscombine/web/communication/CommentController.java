package gimsehyeon.yoyangscombine.web.communication;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import gimsehyeon.yoyangscombine.domain.Comment;
import gimsehyeon.yoyangscombine.service.communication.comment.CommentService;
import gimsehyeon.yoyangscombine.service.communication.pager.Pager;

@RestController
@RequestMapping("/comment/*")
public class CommentController {
	@Autowired
	private CommentService commentService;

	@RequestMapping("insert")
	public void commentInsert(@ModelAttribute Comment comment, HttpSession session) {
		String writer = (String) session.getAttribute("userName");
		comment.setWriter(writer);
		commentService.writeComment(comment);
	}

	@RequestMapping("list")
	public ModelAndView commentList(@RequestParam int communicationNum, @RequestParam(defaultValue = "1") int curPage,
			ModelAndView mav, HttpSession session) {
		int count = commentService.calcComment(communicationNum);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<Comment> comments = commentService.getComments(communicationNum, start, end, session);
		mav.setViewName("communication/commentList");
		mav.addObject("comments", comments);
		mav.addObject("pager", pager);
		return mav;
	}

	@RequestMapping("delete")
	public void deleteComment(@RequestParam int commentNum) throws Exception {
		commentService.removeComment(commentNum);
	}
	
	@RequestMapping("update")
	public void commentUpdate(@ModelAttribute Comment comment, @RequestParam int commentNum,
			@RequestParam String commentPost) {
		comment.setCommentNum(commentNum);
		comment.setCommentPost(commentPost);
		commentService.modifyComment(comment);
	}
}