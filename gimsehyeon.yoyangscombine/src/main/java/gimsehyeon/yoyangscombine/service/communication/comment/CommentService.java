package gimsehyeon.yoyangscombine.service.communication.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import gimsehyeon.yoyangscombine.domain.Comment;

public interface CommentService {
	List<Comment> getComments(Integer communicationNum, int start, int end, HttpSession session);
	int calcComment(int communicationNum);
	boolean writeComment(Comment comment);
	boolean modifyComment(Comment comment);
	boolean removeComment(Integer commentNum);
	Comment readComment(int commentNum);
}
