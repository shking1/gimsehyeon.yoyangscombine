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
	private String sanaName;
	private String writer;
	private String reviewPost;
	
	private LocalDate writingDate;

	

	

}
