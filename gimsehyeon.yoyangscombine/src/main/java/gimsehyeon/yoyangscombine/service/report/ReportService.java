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
	Integer addPostReport( int reporter,  int reportCode, 
			String reportContent, int communicationNum);
	Integer addCommentReport( int reporter,  int reportCode, 
			String reportContent, int commentNum);
	Integer delReport(int reviewNum);
	Integer delPostReport(int communicationNum);
	Integer delCommentReport(int commentNum);
}
