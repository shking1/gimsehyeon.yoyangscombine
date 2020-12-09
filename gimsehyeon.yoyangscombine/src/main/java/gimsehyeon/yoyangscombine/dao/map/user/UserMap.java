package gimsehyeon.yoyangscombine.dao.map.user;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.domain.User;

@Repository
public interface UserMap {
	User selectUser(@Param("userId") String userId);
}