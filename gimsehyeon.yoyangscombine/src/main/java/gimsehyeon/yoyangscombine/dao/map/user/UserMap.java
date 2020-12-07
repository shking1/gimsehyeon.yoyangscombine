package gimsehyeon.yoyangscombine.dao.map.user;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.domain.Member;

@Repository
public interface UserMap {
	Member selectMember(@Param("memberId") String memberId);
}