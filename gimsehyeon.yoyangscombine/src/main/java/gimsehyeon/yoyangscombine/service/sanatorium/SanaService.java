package gimsehyeon.yoyangscombine.service.sanatorium;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gimsehyeon.yoyangscombine.domain.Sanatorium;

public interface SanaService {
	Sanatorium getSana(String sanaName);
	Integer addSana(String sanaName);
}
