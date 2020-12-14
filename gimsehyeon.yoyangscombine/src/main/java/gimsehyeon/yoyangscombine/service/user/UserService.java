package gimsehyeon.yoyangscombine.service.user;

import gimsehyeon.yoyangscombine.domain.User;

public interface UserService {
	User getUser(String userId);
	String loginCheck(String userId, String password);
	int addUser(String userId, String userName, String password);
	int getUserChk(String userId);
}