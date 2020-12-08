package gimsehyeon.yoyangscombine.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gimsehyeon.yoyangscombine.dao.user.UserDao;
import gimsehyeon.yoyangscombine.domain.Member;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public Member getMember(String memberId) {
		return userDao.selectMember(memberId);
	}

	@Override
	public String loginCheck(String memberId, String password) {
		String loginChecker = "";
		Member hasMember = null;
		String hasPw = "";

		hasMember = getMember(memberId);

		if (hasMember != null) {
			hasPw = hasMember.getPassword();
			if (!hasPw.equals(password)) {
				loginChecker = "PW";
			}
			if (hasPw.equals(password)) {
				loginChecker = "SUCCESS";
			}
			if (hasMember.getMemberId().equals("admin") && hasMember.getPassword().equals(password))
				loginChecker = "ADMIN";
		}
		if (hasMember == null) {
			loginChecker = "ID";
		}
		return loginChecker;
	}
}