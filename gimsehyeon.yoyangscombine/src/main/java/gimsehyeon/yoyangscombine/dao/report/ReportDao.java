package gimsehyeon.yoyangscombine.dao.report;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import gimsehyeon.yoyangscombine.domain.Report;

public interface ReportDao {
	Report showReport(Integer reportNum);
	List<Report> selectReports(int start, int end) throws Exception;
	int countReport(String searchOption, String keyWord);
	Integer insertReport( int reporter, int reportCode, 
			  String reportContent, int reviewNum);
	Integer insertPostReport( int reporter, int reportCode, 
			  String reportContent, int communicationNum);
	Integer insertCommentReport( int reporter, int reportCode, 
			  String reportContent, int commentNum);
	Integer deleteReport( int reviewNum);
	
	Integer deletePostReport( int communicationNum);
	Integer deleteCommentReport( int commentNum);
	
	
}
