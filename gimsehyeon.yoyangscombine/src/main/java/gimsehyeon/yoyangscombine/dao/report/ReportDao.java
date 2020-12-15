package gimsehyeon.yoyangscombine.dao.report;

import java.util.List;

import gimsehyeon.yoyangscombine.domain.Report;

public interface ReportDao {
	Report showReport(Integer reportNum);
	List<Report> countReport(int start, int end) throws Exception;
	int countReport(Integer reportNum);
}
