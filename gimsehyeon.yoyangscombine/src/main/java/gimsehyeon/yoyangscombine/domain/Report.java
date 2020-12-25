package gimsehyeon.yoyangscombine.domain;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Report {
	@NotBlank @NotNull
	private Integer reportNum;	//No.
	private int reporter;	//작성자
	private int reportCode;	//분류
	private LocalDate reportReceptionDate;	//작성일
	private String reportContent;	//제목(내용)
	private int communicationNum;
	private int commentNum;
	private int reviewNum;
	
	public Report(int reportNum) {
		this.reportNum = reportNum;
	}
	
	


	@Override
	public String toString() {
		return String.format("reportNum : %d", reportNum);
	}
}
