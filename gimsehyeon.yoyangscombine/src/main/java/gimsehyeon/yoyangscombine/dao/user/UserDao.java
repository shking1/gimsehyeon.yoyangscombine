package gimsehyeon.yoyangscombine.dao.user;

import gimsehyeon.yoyangscombine.domain.Member;

public interface UserDao {
	Member selectMember(String memberId);
}