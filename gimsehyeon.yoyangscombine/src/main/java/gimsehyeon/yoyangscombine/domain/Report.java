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
public class Report {
	private int reportNum;	//No.
	private int reporter;	//작성자
	private int reportCode;	//분류
	private LocalDate reportReceptionDate;	//작성일
	private String reportContent;	//제목(내용)
	
	public Report(int reportNum) {
		this.reportNum = reportNum;
	}
}
