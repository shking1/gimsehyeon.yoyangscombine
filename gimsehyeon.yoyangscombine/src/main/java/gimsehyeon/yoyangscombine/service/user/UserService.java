package gimsehyeon.yoyangscombine.service.user;

import gimsehyeon.yoyangscombine.domain.Member;

public interface UserService {
	Member getLoginMember(String memberId, String password);
}