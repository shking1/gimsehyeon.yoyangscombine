package gimsehyeon.yoyangscombine.dao.communication.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.dao.map.communication.comment.CommentMap;
import gimsehyeon.yoyangscombine.domain.Comment;

@Repository
public class CommentDaoImpl implements CommentDao {
	@Autowired private CommentMap commentMap;
	
	@Override
	public List<Comment> selectComments(Integer communicationNum, int start, int end) {
		// TODO Auto-generated method stub
		return commentMap.selectComments(communicationNum, start, end);
	}

	@Override
	public int countComment(int communicationNum) {
		// TODO Auto-generated method stub
		return commentMap.countComment(communicationNum);
	}

	@Override
	public int insertComment(Comment comment) {
		// TODO Auto-generated method stub
		return commentMap.insertComment(comment);
	}

	@Override
	public int updateComment(Comment comment) {
		// TODO Auto-generated method stub
		return commentMap.updateComment(comment);
	}

	@Override
	public int deleteComment(Integer commentNum) {
		// TODO Auto-generated method stub
		return commentMap.deleteComment(commentNum);
	}

	@Override
	public Comment showComment(int commentNum) {
		// TODO Auto-generated method stub
		return commentMap.showComment(commentNum);
	}

}
