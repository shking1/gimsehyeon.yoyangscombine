package gimsehyeon.yoyangscombine.service.report;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gimsehyeon.yoyangscombine.dao.report.ReportDao;
import gimsehyeon.yoyangscombine.domain.Report;

@Service
public class ReportServiceImpl implements ReportService{	
	@Autowired 
	private ReportDao reportDao;
	
	@Override
	public Report getReport(Integer reportNum) {
		return reportDao.showReport(reportNum);
	}
	
	@Override
	public int calcReport(String searchOption, String keyWord) throws Exception{
		return reportDao.countReport(searchOption, keyWord);
	}
	
	@Override
	public List<Report> getReports(int start, int end) throws Exception{
		return reportDao.selectReports(start, end);
	}

	@Override
	public Integer addReport(int reporter, int reportCode,  String reportContent, int reviewNum) {
		
		return reportDao.insertReport(reporter, reportCode, reportContent, reviewNum);
	}
}
