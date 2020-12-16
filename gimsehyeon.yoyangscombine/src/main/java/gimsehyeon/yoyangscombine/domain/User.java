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
	
	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public byte[] getProfileImgFilename() {
		return profileImgFilename;
	}

	public void setProfileImgFilename(byte[] profileImgFilename) {
		this.profileImgFilename = profileImgFilename;
	}

	public LocalDate getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(LocalDate joinDate) {
		this.joinDate = joinDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNumOfReport() {
		return numOfReport;
	}

	public void setNumOfReport(String numOfReport) {
		this.numOfReport = numOfReport;
	}

	public User(String userId, String password) {
		this.userId = userId;
		this.password = password;
	}
}