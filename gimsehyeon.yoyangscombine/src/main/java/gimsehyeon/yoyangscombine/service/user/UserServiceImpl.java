package gimsehyeon.yoyangscombine.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gimsehyeon.yoyangscombine.dao.user.UserDao;
import gimsehyeon.yoyangscombine.domain.Member;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;
	
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

		if(hasMember != null) {
			hasPw = hasMember.getPassword();
			if(!hasPw.equals(password)) {
				loginChecker = "PW";
			}
			if(hasPw.equals(password)) {
				loginChecker = "SUCCESS";
			}
			if(hasMember.getMemberId().equals("admin") && hasMember.getPassword().equals(password))
				loginChecker = "ADMIN";
			
		}
		if(hasMember== null) {
			loginChecker = "ID";
		}
		return loginChecker;

		/*

		if(hasMember != null)
			hasPw = hasMember.getPassword();
		if(hasMember == null)
			loginChecker = "ID";
		if(hasMember != null && !hasPw.equals(password)) { //가져온 값이 널이 아니고 비밀번호가 틀렸을 경우
		//	hasMember = null;
			loginChecker = "PW";
		}
		if(hasMember != null && hasPw.equals(password)) { //가져온 값이 널이 아니고 비밀번호가 맞았을 경우
			loginChecker = "SUCCESS";
		}
		if(hasMember.getMemberId().equals(memberId) && hasMember.getPassword().equals(password))
			loginChecker = "ADMIN";
		
		return loginChecker;*/
	}
}