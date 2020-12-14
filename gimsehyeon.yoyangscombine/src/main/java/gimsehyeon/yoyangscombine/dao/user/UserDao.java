package gimsehyeon.yoyangscombine.dao.user;

import gimsehyeon.yoyangscombine.domain.User;

public interface UserDao {
	User selectUser(String userId);
	int insertUser(String userId, String userName, String password);
	int selectUserChk(String userId);
}