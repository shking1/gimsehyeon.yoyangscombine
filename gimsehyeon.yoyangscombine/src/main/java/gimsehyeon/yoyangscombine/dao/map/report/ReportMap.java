package gimsehyeon.yoyangscombine.dao.map.report;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gimsehyeon.yoyangscombine.domain.Report;

public interface ReportMap {
	Report showReport(@Param("reportNum") int reportNum);

	int countReport(int reportNum) throws Exception;

	List<Report> countReport(@Param("start") int start, @Param("end") int end) throws Exception;
}
