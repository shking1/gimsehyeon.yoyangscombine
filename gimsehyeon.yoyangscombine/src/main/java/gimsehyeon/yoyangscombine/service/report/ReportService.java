package gimsehyeon.yoyangscombine.service.report;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import gimsehyeon.yoyangscombine.domain.Report;

public interface ReportService {
	Report getReport(Integer reportNum);
	int calcReport(String searchOption, String keyWord) throws Exception;
	List<Report> getReports(int start, int end) throws Exception;
	Integer addReport( int reporter,  int reportCode, 
			String reportContent, int reviewNum);
	Integer delReport(int reviewNum);
}
