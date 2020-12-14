package gimsehyeon.yoyangscombine.dao.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.dao.map.report.ReportMap;
import gimsehyeon.yoyangscombine.domain.Report;

@Repository
public class ReportDaoImpl implements ReportDao {
	@Autowired private ReportMap reportMap;
	
	@Override
	public Report showReport(int reportNum) {
		return reportMap.showReport(reportNum);
	}
}
