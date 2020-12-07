package gimsehyeon.yoyangscombine.service.user;

import gimsehyeon.yoyangscombine.domain.Member;

public interface UserService {
	Member getMember(String memberId);
	String loginCheck(String memberId, String password);
}