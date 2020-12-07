package gimsehyeon.yoyangscombine.dao.map.user;

import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.domain.Member;

@Repository
public interface UserMap {
	Member selectLoginMember(String memberId, String password);
}