package gimsehyeon.yoyangscombine.service.report;

import java.util.List;

import gimsehyeon.yoyangscombine.domain.Report;

public interface ReportService {
	Report getReport(Integer reportNum);
	int calcReport(Integer reportNum) throws Exception;
	List<Report> getReports(int start, int end) throws Exception;
}
