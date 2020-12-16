package gimsehyeon.yoyangscombine.service.review;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gimsehyeon.yoyangscombine.domain.Review;

public interface ReviewService {
	Integer addReview(String writer,String reviewPost,
						   String sanaName );
	
	List<Review> getReviews(String sanaName);
	
	Integer fixReview(int reviewNum,String reviewPost);
	
	Integer delReview( int reviewNum);
}
