package gimsehyeon.yoyangscombine.dao.communication;

import java.util.List;
import gimsehyeon.yoyangscombine.domain.Communication;


public interface CommunicationDao {
	List<Communication> selectComms(int start, int end, 
			String searchOption, String keyWord) throws Exception;	//게시판 목록 (페이지 나누기, 검색기능 포함)
	int insertComm(Communication comm) throws Exception;	//게시글 작성
	int updateComm(Communication comm) throws Exception;	//게시글 수정
	int deleteComm(int communicationNum) throws Exception;	//게시글 삭제
	Communication showComm(int communicationNum) throws Exception;	//게시글 읽기
	int countComm(String searchOption, String keyWord) throws Exception;	//게시물 레코드 갯수 계산
}
