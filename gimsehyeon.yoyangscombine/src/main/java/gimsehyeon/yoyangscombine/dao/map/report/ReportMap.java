package gimsehyeon.yoyangscombine.dao.map.report;

import org.apache.ibatis.annotations.Param;

import gimsehyeon.yoyangscombine.domain.Report;

public interface ReportMap {
	Report showReport(@Param("reportNum") int reportNum);
}
