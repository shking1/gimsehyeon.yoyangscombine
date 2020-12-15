package gimsehyeon.yoyangscombine.dao.map.user;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.domain.User;

@Repository
public interface UserMap {
	User selectUser(@Param("userId") String userId);
	int selectDeletedUser(@Param("userId") String userId);
	int selectUserChk(@Param("userId") String userId);
	int insertUser(@Param("userId") String userId,
			@Param("userName") String userName, @Param("password") String password);
	int insertDeletedUser(@Param("userId") String userId);
	int updateUser(@Param("userId") String userId, @Param("userName") String userName);
	int updatePassword(@Param("userId") String userId, @Param("password") String password);
}