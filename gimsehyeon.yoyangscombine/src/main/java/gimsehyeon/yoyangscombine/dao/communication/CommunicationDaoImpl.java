package gimsehyeon.yoyangscombine.dao.communication;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.dao.map.communication.CommunicationMap;
import gimsehyeon.yoyangscombine.domain.Communication;

@Repository	//Dao Bean으로 등록
public class CommunicationDaoImpl implements CommunicationDao {
	@Autowired private CommunicationMap commMap;
	
	@Override
	public List<String> selectFiles(int communicationNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateFile(String fullName, int communicationNum) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Communication> selectComms(int start, int end, String searchOption, String keyWord) throws Exception {
		// TODO Auto-generated method stub
//		Map<String, Object> map = new HashMap<>();
//		map.put("start", start);
//		map.put("end", end);
//		map.put("search_option", searchOption);
//		map.put("keyword", keyWord);
		return commMap.selectComms(start, end, searchOption, keyWord);
	}

	@Override
	public int insertComm(Communication comm) throws Exception {
		// TODO Auto-generated method stub
		return commMap.insertComm(comm);
	}

	@Override
	public int updateComm(Communication comm) throws Exception {
		// TODO Auto-generated method stub
		return commMap.updateComm(comm);
	}
 
	@Override
	public int deleteComm(int communicationNum) throws Exception {
		// TODO Auto-generated method stub
		return commMap.deleteComm(communicationNum);
	}

	@Override
	public Communication showComm(int communicationNum) throws Exception {
		// TODO Auto-generated method stub
		return commMap.showComm(communicationNum);
	}

	@Override
	public int countComm(String searchOption, String keyWord) throws Exception {
		// TODO Auto-generated method stub
		return commMap.countComm(searchOption, keyWord);
	}

}
