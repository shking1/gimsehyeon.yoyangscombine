package gimsehyeon.yoyangscombine.dao.report;

import java.util.List;

import gimsehyeon.yoyangscombine.domain.Report;

public interface ReportDao {
	Report showReport(int reportNum);
	int countReport(int reportNum) throws Exception;
	List<Report> countReport(int start, int end) throws Exception;
}
