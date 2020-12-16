package gimsehyeon.yoyangscombine.service.sanatorium;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gimsehyeon.yoyangscombine.dao.sanatorium.SanaDao;
import gimsehyeon.yoyangscombine.domain.Sanatorium;

@Service
public class SanaServiceImpl implements SanaService{
	@Autowired
	private SanaDao sanaDao;
	
	
	@Override
	public Sanatorium getSana(String sanaName) {
		
		return sanaDao.selectSana(sanaName);
	}


	@Override
	public Integer addSana(String sanaName) {
		
		return sanaDao.insertSana(sanaName);
	}
	

}
