package gimsehyeon.yoyangscombine.service.report;

import java.util.List;

import gimsehyeon.yoyangscombine.domain.Report;

public interface ReportService {
	Report getReport(int reportNum);
	int calcReport(int reportNum) throws Exception;
	
	List<Report> getReport(int start, int end) throws Exception;
}
