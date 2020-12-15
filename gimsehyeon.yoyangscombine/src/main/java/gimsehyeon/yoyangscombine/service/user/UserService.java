package gimsehyeon.yoyangscombine.service.user;

import java.util.List;

import gimsehyeon.yoyangscombine.domain.User;

public interface UserService {
	List<User> getUsers(int start, int end, 
			String searchOption, String keyWord);
	User getUser(String userId);
	int getDeletedUser(String userId);
	int getUserChk(String userId);
	String loginCheck(String userId, String password);
	int addUser(String userId, String userName, String password);
	int addDeletedUser(String userId);
	int fixUser(String userId, String userName);
	int fixPassword(String userId, String password);
	int calcUser(String searchOption, String keyWord) throws Exception;
}