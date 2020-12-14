package gimsehyeon.yoyangscombine.service.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gimsehyeon.yoyangscombine.dao.report.ReportDao;
import gimsehyeon.yoyangscombine.domain.Report;

@Service
public class ReportServiceImpl implements ReportService{	
	@Autowired 
	private ReportDao reportDao;
	
	@Override
	public Report getReport(int reportNum) {
		return reportDao.showReport(reportNum);
	}

}
