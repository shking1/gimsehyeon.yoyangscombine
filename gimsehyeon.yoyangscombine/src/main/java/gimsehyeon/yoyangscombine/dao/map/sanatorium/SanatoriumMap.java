package gimsehyeon.yoyangscombine.dao.map.sanatorium;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.domain.Sanatorium;

@Repository
public interface SanatoriumMap {
		Sanatorium selectSana(@Param("sanaName") String sanaName);
		Integer insertSana(@Param("sanaName") String sanaName);

}
