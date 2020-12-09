package gimsehyeon.yoyangscombine.dao.user;

import gimsehyeon.yoyangscombine.domain.User;

public interface UserDao {
	User selectUser(String userId);
}