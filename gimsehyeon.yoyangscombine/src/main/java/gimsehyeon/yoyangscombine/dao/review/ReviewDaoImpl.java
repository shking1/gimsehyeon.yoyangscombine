package gimsehyeon.yoyangscombine.dao.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.dao.map.review.ReviewMap;
import gimsehyeon.yoyangscombine.domain.Review;



@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired private ReviewMap reviewMap;
	
	@Override
	public Integer insertReview(String writer, String reviewPost, String sanaName) {
		
		return reviewMap.insertReview( writer, reviewPost, sanaName);
	}
	

	@Override
	public List<Review> selectReviews(String sanaName) {
		
		
		return reviewMap.selectReviews(sanaName);
	}

	@Override
	public Integer updateReview(int reviewNum, String reviewPost) {
		
		return reviewMap.updateReview(reviewNum, reviewPost);
	}


	@Override
	public Integer deleteReview(int reviewNum) {
		
		return reviewMap.deleteReview(reviewNum);
	}

	

	

}
