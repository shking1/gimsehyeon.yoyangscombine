package gimsehyeon.yoyangscombine.service.communication;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gimsehyeon.yoyangscombine.dao.communication.CommunicationDao;
import gimsehyeon.yoyangscombine.domain.Communication;

@Service
public class CommunicationServiceImpl implements CommunicationService {
	@Autowired private CommunicationDao commDao;
	
	@Override
	public List<String> getFiles(int communicationNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public void modifyFile(String fullName, int communicationNum) {
		// TODO Auto-generated method stub

	}

	@Override
	public void removeFile(String fullName) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Communication> getComms(int start, int end, String searchOption, String keyWord) throws Exception {
		// TODO Auto-generated method stub
		return commDao.selectComms(start, end, searchOption, keyWord);
	}

	@Override
	public int writeComm(Communication comm) throws Exception {
		// TODO Auto-generated method stub
		return commDao.insertComm(comm);
	}

	@Override
	public boolean modifyComm(Communication comm) throws Exception {
		// TODO Auto-generated method stub
		return commDao.updateComm(comm) > 0;
	}

	@Override
	public boolean removeComm(int communicationNum) throws Exception {
		// TODO Auto-generated method stub
		return commDao.deleteComm(communicationNum) > 0;
	}

	@Override
	public Communication readComm(int communicationNum) throws Exception {
		// TODO Auto-generated method stub
		return commDao.showComm(communicationNum);
	}

	@Override
	public int calcComm(String searchOption, String keyWord) throws Exception {
		// TODO Auto-generated method stub
		return commDao.countComm(searchOption, keyWord);
	}

}
