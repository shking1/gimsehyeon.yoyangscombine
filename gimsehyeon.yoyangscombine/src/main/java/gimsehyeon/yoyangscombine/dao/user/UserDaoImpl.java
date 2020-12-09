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
}