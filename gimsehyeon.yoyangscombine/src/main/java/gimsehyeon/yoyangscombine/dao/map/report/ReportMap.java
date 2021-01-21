package gimsehyeon.yoyangscombine.dao.map.report;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import gimsehyeon.yoyangscombine.domain.Report;

public interface ReportMap {
	Report showReport(@Param("reportNum") Integer reportNum);
	List<Report> selectReports(@Param("start")int start, @Param("end") int end) throws Exception;
	int countReport(@Param("searchOption")String searchOption, @Param("keyWord") String keyWord);
	Integer insertReport(@Param("reporter") int reporter, @Param("reportCode") int reportCode, 
					@Param("reportContent") String reportContent, @Param("reviewNum") int reviewNum);
	Integer insertPostReport(@Param("reporter") int reporter, @Param("reportCode") int reportCode, 
			@Param("reportContent") String reportContent, @Param("communicationNum") int communicationNum);
	Integer insertCommentReport(@Param("reporter") int reporter, @Param("reportCode") int reportCode, 
			@Param("reportContent") String reportContent, @Param("commentNum") int commentNum);
	Integer deleteReport(@Param("reviewNum") int reviewNum);
	Integer deletePostReport(@Param("communicationNum") int communicationNum);
	Integer deleteCommentReport(@Param("commentNum") int commentNum);
}
