package gimsehyeon.yoyangscombine.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gimsehyeon.yoyangscombine.dao.user.UserDao;
import gimsehyeon.yoyangscombine.domain.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public User getUser(String userId) {
		return userDao.selectUser(userId);
	}

	@Override
	public String loginCheck(String userId, String password) {
		String loginChecker = "";
		User hasUser = null;
		String hasPw = "";

		hasUser = getUser(userId);

		if (hasUser != null) {
			hasPw = hasUser.getPassword();
			if (!hasPw.equals(password)) {
				loginChecker = "PW";
			}
			if (hasPw.equals(password)) {
				loginChecker = "SUCCESS";
			}
			if (hasUser.getUserId().equals("admin") && hasUser.getPassword().equals(password))
				loginChecker = "ADMIN";
		}
		if (hasUser == null) {
			loginChecker = "ID";
		}
		return loginChecker;
	}
	
	@Override
	public int addUser(String userId, String userName, String password) {
		return userDao.insertUser(userId, userName, password);
	}
}