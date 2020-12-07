package gimsehyeon.yoyangscombine.dao.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.dao.map.user.UserMap;
import gimsehyeon.yoyangscombine.domain.Member;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;
	
	@Override
	public Member selectMember(String memberId) {
		return userMap.selectMember(memberId);
	}
}