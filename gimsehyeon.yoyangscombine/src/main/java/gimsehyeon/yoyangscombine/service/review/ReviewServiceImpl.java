package gimsehyeon.yoyangscombine.service.review;

import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import gimsehyeon.yoyangscombine.dao.map.review.ReviewMap;
import gimsehyeon.yoyangscombine.dao.review.ReviewDao;
import gimsehyeon.yoyangscombine.dao.review.ReviewDaoImpl;
import gimsehyeon.yoyangscombine.domain.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public Integer addReview( String writer, String reviewPost, String sanaName) {
		
		return reviewDao.insertReview( writer, reviewPost, sanaName);
	}
	
	@Override
	public List<Review> getReviews(String sanaName) {
		
		return reviewDao.selectReviews(sanaName);
	}

	@Override
	public Integer fixReview(int reviewNum, String reviewPost) {
		
		return reviewDao.updateReview(reviewNum, reviewPost);
	}

	@Override
	public Integer delReview(int reviewNum) {
		
		return reviewDao.deleteReview(reviewNum);
	}
	
	@Override
	public Review getReview(int reviewNum) {
		return reviewDao.selectReview(reviewNum);
	}

}
