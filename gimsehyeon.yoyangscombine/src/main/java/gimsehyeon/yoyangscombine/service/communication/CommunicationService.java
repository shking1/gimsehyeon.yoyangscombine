package gimsehyeon.yoyangscombine.service.communication;

import java.util.List;
import gimsehyeon.yoyangscombine.domain.Communication;

public interface CommunicationService {
	List<String> getFiles(int communicationNum);	//첨부파일 목록
	void addFile(String fullName);	//첨부파일 저장
	void modifyFile(String fullName, int communicationNum);	//첨부파일 수정
	void removeFile(String fullName);	//첨부파일 삭제
	
	List<Communication> getComms(int start, int end, 
			String searchOption, String keyWord) throws Exception;	//게시판 목록 (페이지 나누기, 검색기능 포함)
	int writeComm(Communication comm) throws Exception;	//게시글 작성
	boolean modifyComm(Communication comm) throws Exception;	//게시글 수정
	boolean removeComm(int communicationNum) throws Exception;	//게시글 삭제
	Communication readComm(int communicationNum) throws Exception;	//게시글 읽기
	int calcComm(String searchOption, String keyWord) throws Exception;	//게시물 레코드 갯수 계산
}
