package gimsehyeon.yoyangscombine.dao.communication.comment;

import java.util.List;

import gimsehyeon.yoyangscombine.domain.Comment;

public interface CommentDao {
	List<Comment> selectComments(Integer communicationNum, int start, int end);
	int countComment(int communicationNum);
	int insertComment(Comment comment);
	int updateComment(Comment comment);
	int deleteComment(Integer commentNum);
	Comment showComment(int commentNum);
}
