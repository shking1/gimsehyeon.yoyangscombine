package gimsehyeon.yoyangscombine.service.user;

import gimsehyeon.yoyangscombine.domain.User;

public interface UserService {
	User getUser(String userId);
	String loginCheck(String userId, String password);
}