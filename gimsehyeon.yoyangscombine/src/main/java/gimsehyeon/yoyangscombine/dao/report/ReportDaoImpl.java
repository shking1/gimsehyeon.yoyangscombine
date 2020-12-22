package gimsehyeon.yoyangscombine.dao.report;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.dao.map.report.ReportMap;
import gimsehyeon.yoyangscombine.domain.Report;

@Repository
public class ReportDaoImpl implements ReportDao {
	@Autowired private ReportMap reportMap;
	
	@Override
	public Report showReport(Integer reportNum) {
		return reportMap.showReport(reportNum);
	}
	@Override
	public List<Report> selectReports(int start, int end)throws Exception {
		// TODO Auto-generated method stub
		return reportMap.selectReports(start, end);
	}
	@Override
	public int countReport(String searchOption, String keyWord) {
		// TODO Auto-generated method stub
		return reportMap.countReport(searchOption, keyWord);
	}
	@Override
	public Integer insertReport(int reporter, int reportCode, 
			String reportContent) {
		
		return reportMap.insertReport(reporter, reportCode,  reportContent);
	}
}
