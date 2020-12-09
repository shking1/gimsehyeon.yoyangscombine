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
public class User {
	private int userNum;
	private String userId;
	private byte[] profileImgFilename;
	private LocalDate joinDate;
	private String userName;
	private String password;
	private String numOfReport;
	
	public User(String userId, String password) {
		this.userId = userId;
		this.password = password;
	}
}