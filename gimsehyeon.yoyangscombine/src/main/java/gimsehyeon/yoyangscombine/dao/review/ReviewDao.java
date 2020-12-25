package gimsehyeon.yoyangscombine.dao.review;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gimsehyeon.yoyangscombine.domain.Review;

public interface ReviewDao {
	
	Integer insertReview(String writer,String reviewPost,
						   String sanaName );
	List<Review> selectReviews(String sanaName);
	Integer updateReview(int reviewNum,String reviewPost);
	Integer deleteReview( int reviewNum);
	Review selectReview( int reviewNum);
	
}
