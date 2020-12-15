package gimsehyeon.yoyangscombine.dao.map.communication.comment;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gimsehyeon.yoyangscombine.domain.Comment;

public interface CommentMap {
	List<Comment> selectComments(@Param("communicationNum") Integer communicationNum,
			@Param("start") int start, @Param("end") int end);
	int countComment(@Param("communicationNum") int communicationNum);
	int insertComment(Comment comment);
	int updateComment(Comment comment);
	int deleteComment(@Param("commentNum") Integer commentNum);
	Comment showComment(@Param("commentNum") int commentNum);
}
