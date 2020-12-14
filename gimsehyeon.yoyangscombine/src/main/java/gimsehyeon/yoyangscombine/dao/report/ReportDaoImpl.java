package gimsehyeon.yoyangscombine.dao.report;

import java.util.List;

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
	
	@Override
	public int countReport(int reportNum) throws Exception{
		return reportMap.countReport(reportNum);
	}

	@Override
	public List<Report> countReport(int start, int end)throws Exception {
		// TODO Auto-generated method stub
		return reportMap.countReport(start, end);
	}
}
