package gimsehyeon.yoyangscombine.dao.sanatorium;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gimsehyeon.yoyangscombine.domain.Sanatorium;

public interface SanaDao {
	Sanatorium selectSana( String sanaName);
	Integer insertSana( String sanaName);
}
