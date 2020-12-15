package gimsehyeon.yoyangscombine.dao.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.dao.map.user.UserMap;
import gimsehyeon.yoyangscombine.domain.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;
	
	@Override
	public User selectUser(String userId) {
		return userMap.selectUser(userId);
	}
	
	@Override
	public int selectDeletedUser(String userId) {
		return userMap.selectDeletedUser(userId);
	}
	
	@Override
	public int selectUserChk(String userId) {
		return userMap.selectUserChk(userId);
	}
	
	@Override
	public int insertUser(String userId, String userName, String password) {
		return userMap.insertUser(userId, userName, password);
	}
	
	@Override
	public int insertDeletedUser(String userId) {
		return userMap.insertDeletedUser(userId);
	}
	
	@Override
	public int updateUser(String userId, String userName) {
		return userMap.updateUser(userId, userName);
	}
	
	@Override
	public int updatePassword(String userId, String password) {
		return userMap.updatePassword(userId, password);
	}
}