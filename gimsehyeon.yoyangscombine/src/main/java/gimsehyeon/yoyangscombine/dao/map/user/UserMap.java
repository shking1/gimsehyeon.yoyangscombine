package gimsehyeon.yoyangscombine.dao.map.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.domain.User;

@Repository
public interface UserMap {
	List<User> selectUsers(@Param("start")int start, @Param("end") int end, 
			@Param("searchOption") String searchOption, @Param("keyWord") String keyWord);
	int countUser(@Param("searchOption")String searchOption, @Param("keyWord")String keyWord);
	User selectUser(@Param("userId") String userId);
	int selectDeletedUser(@Param("userId") String userId);
	int selectUserChk(@Param("userId") String userId);
	int insertUser(@Param("userId") String userId,
			@Param("userName") String userName, @Param("password") String password);
	int insertDeletedUser(@Param("userId") String userId);
	int updateUser(@Param("userId") String userId, @Param("userName") String userName);
	int updatePassword(@Param("userId") String userId, @Param("password") String password);
}