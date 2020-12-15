package gimsehyeon.yoyangscombine.dao.communication;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gimsehyeon.yoyangscombine.dao.map.communication.CommunicationMap;
import gimsehyeon.yoyangscombine.domain.Communication;

@Repository	//Dao Bean으로 등록
public class CommunicationDaoImpl implements CommunicationDao {
	@Autowired private CommunicationMap commMap;

	@Override
	public List<Communication> selectComms(int start, int end, String searchOption, String keyWord) throws Exception {
		// TODO Auto-generated method stub
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
