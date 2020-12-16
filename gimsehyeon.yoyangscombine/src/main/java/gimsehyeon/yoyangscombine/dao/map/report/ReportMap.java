package gimsehyeon.yoyangscombine.dao.map.report;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gimsehyeon.yoyangscombine.domain.Report;

public interface ReportMap {
	Report showReport(@Param("reportNum") Integer reportNum);
	List<Report> selectReports(@Param("start")int start, @Param("end") int end) throws Exception;
	int countReport(@Param("searchOption")String searchOption, @Param("keyWord") String keyWord);
}
