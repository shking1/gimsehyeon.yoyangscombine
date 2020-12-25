package gimsehyeon.yoyangscombine.dao.map.review;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.domain.Review;

@Repository
public interface ReviewMap {
		Integer insertReview( @Param("writer") String writer,@Param("reviewPost") String reviewPost,
						 @Param("sanaName") String sanaName);
		List<Review> selectReviews(@Param("sanaName") String sanaName);
		 Integer updateReview(@Param("reviewNum") int reviewNum, @Param("reviewPost") String reviewPost);
		 Integer deleteReview(@Param("reviewNum") int reviewNum);
		 Review selectReview(@Param("reviewNum") int reviewNum);
}
