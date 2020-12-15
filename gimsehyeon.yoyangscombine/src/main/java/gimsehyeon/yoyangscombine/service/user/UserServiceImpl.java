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
	public int getDeletedUser(String userId) {
		return userDao.selectDeletedUser(userId);
	}

	@Override
	public int getUserChk(String userId) {
		return userDao.selectUserChk(userId);
	}
	
	@Override
	public String loginCheck(String userId, String password) {
		String loginChecker = "";
		User hasUser = null;
		String hasPw = "";

		hasUser = getUser(userId);

		if (hasUser != null) {
			hasPw = hasUser.getPassword();
			
			if(getDeletedUser(userId) != 0)	//탈퇴 회원일 시
				loginChecker = "DELETED_USER";
			else {
				if (!hasPw.equals(password))
					loginChecker = "PW";			//비밀번호 오류
				if (hasPw.equals(password))
					loginChecker = "SUCCESS";		//성공
				if (hasUser.getUserId().equals("admin") && hasUser.getPassword().equals(password))
					loginChecker = "ADMIN";
			}
		}
		else if (hasUser == null) {
			loginChecker = "ID";				//부존재 ID
		}
		return loginChecker;
	}
	
	@Override
	public int addUser(String userId, String userName, String password) {
		return userDao.insertUser(userId, userName, password);
	}
	
	@Override
	public int addDeletedUser(String userId) {
		return userDao.insertDeletedUser(userId);
	}
	
	@Override
	public int fixUser(String userId, String userName) {
		return userDao.updateUser(userId, userName);
	}
	
	@Override
	public int fixPassword(String userId, String password) {
		return userDao.updatePassword(userId, password);
	}
}