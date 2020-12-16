package gimsehyeon.yoyangscombine.dao.sanatorium;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.dao.map.sanatorium.SanatoriumMap;
import gimsehyeon.yoyangscombine.domain.Sanatorium;


@Repository
public class SanaDaoImpl implements SanaDao {
	@Autowired private SanatoriumMap sanatoriumMap;
	
	@Override
	public Sanatorium selectSana(String sanaName) {
		return sanatoriumMap.selectSana(sanaName);
	}

	@Override
	public Integer insertSana(String sanaName) {
		
		return sanatoriumMap.insertSana(sanaName);
	}

}
