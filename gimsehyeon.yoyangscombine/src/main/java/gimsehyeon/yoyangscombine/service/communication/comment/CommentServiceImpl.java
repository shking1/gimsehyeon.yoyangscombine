package gimsehyeon.yoyangscombine.service.communication.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gimsehyeon.yoyangscombine.dao.communication.comment.CommentDao;
import gimsehyeon.yoyangscombine.domain.Comment;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired private CommentDao commentDao;
	
	@Override
	public List<Comment> getComments(Integer communicationNum, int start, int end, HttpSession session) {
		// TODO Auto-generated method stub
		return commentDao.selectComments(communicationNum, start, end);
	}

	@Override
	public int calcComment(int communicationNum) {
		// TODO Auto-generated method stub
		return commentDao.countComment(communicationNum);
	}

	@Override
	public boolean writeComment(Comment comment) {
		// TODO Auto-generated method stub
		return commentDao.insertComment(comment) > 0;
	}

	@Override
	public boolean modifyComment(Comment comment) {
		// TODO Auto-generated method stub
		return commentDao.updateComment(comment) > 0;
	}

	@Override
	public boolean removeComment(Integer commentNum) {
		// TODO Auto-generated method stub
		return commentDao.deleteComment(commentNum) > 0;
	}

	@Override
	public Comment readComment(int commentNum) {
		// TODO Auto-generated method stub
		return commentDao.showComment(commentNum);
	}

}
