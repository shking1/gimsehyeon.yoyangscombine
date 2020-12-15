package gimsehyeon.yoyangscombine.dao.user;

import java.util.List;

import gimsehyeon.yoyangscombine.domain.User;

public interface UserDao {
	List<User> selectUsers(int start, int end, 
			String searchOption, String keyWord);
	User selectUser(String userId);
	int selectDeletedUser(String userId);
	int selectUserChk(String userId);
	int insertUser(String userId, String userName, String password);
	int insertDeletedUser(String userId);
	int updateUser(String userId, String userName);
	int updatePassword(String userId, String password);
	int countUser(String searchOption, String keyWord);
}