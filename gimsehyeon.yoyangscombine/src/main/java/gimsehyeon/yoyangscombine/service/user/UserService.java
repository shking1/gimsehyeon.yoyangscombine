package gimsehyeon.yoyangscombine.service.user;

import gimsehyeon.yoyangscombine.domain.User;

public interface UserService {
	User getUser(String userId);
	int getDeletedUser(String userId);
	int getUserChk(String userId);
	String loginCheck(String userId, String password);
	int addUser(String userId, String userName, String password);
	int addDeletedUser(String userId);
	int fixUser(String userId, String userName);
	int fixPassword(String userId, String password);
}