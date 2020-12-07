package gimsehyeon.yoyangscombine.dao.user;

import gimsehyeon.yoyangscombine.domain.Member;

public interface UserDao {
	Member selectLoginMember(String memberId, String password);
}