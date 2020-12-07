package gimsehyeon.yoyangscombine.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gimsehyeon.yoyangscombine.dao.user.UserDao;
import gimsehyeon.yoyangscombine.domain.Member;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;
	
	@Override
	public Member getLoginMember(String memberId, String password) {
		return userDao.selectLoginMember(memberId, password);
	}
}