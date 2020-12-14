package gimsehyeon.yoyangscombine.service.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gimsehyeon.yoyangscombine.dao.report.ReportDao;

@Service("ReportService")
public class ReportServiceImpl implements ReportService{
	@Autowired private ReportDao reportdao;

}
