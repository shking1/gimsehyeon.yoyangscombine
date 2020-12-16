package gimsehyeon.yoyangscombine.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int reviewNum;
	private int userNum;	
	private int sanaNum;
	private String writer;
	private String reviewPost;
	
	private LocalDate writingDate; 
	
	public int getReviewNum() {
		return reviewNum;
	}
	
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getSanaNum() {
		return sanaNum;
	}
	public void setSanaNum(int sanaNum) {
		this.sanaNum = sanaNum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReviewPost() {
		return reviewPost;
	}
	public void setReviewPost(String reviewPost) {
		this.reviewPost = reviewPost;
	}
	public LocalDate getWritingDate() {
		return writingDate;
	}
	public void setWritingDate(LocalDate writingDate) {
		this.writingDate = writingDate;
	}

}
