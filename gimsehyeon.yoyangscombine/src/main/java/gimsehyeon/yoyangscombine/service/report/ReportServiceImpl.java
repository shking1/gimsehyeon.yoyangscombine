package gimsehyeon.yoyangscombine.service.report;

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
	public int calcReport(Integer reportNum) throws Exception{
		return reportDao.countReport(reportNum);
	}
	
	@Override
	public List<Report> getReport(int start, int end) throws Exception{
		return reportDao.countReport(start, end);
	}

}
