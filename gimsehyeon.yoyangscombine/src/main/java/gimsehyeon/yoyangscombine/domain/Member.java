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
public class Member {
	int memberNum;
	int memberStatus;
	String memberId;
	String patientName;
	String sanaName;
	String profileImgFilename;
	LocalDate joinDate;
	String memberName;
	String password;
	String numOfReport;
	
	public Member(String memberId, String password) {
		this.memberId = memberId;
		this.password = password;
	}
}