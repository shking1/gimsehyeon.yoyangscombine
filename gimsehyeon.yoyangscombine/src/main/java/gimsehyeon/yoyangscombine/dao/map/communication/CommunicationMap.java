package gimsehyeon.yoyangscombine.dao.map.communication;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import gimsehyeon.yoyangscombine.domain.Communication;

public interface CommunicationMap {
	void deleteFile(String fullName);	//첨부파일 삭제
	List<String> selectFiles(int communicationNum);	//첨부파일 목록
	void insertFile(String fullName);	//첨부파일 저장
	void updateFile(String fullName, int communicationNum);	//첨부파일 수정
	
	List<Communication> selectComms(@Param("start") int start, @Param("end") int end, 
			@Param("searchOption") String searchOption, @Param("keyWord") String keyWord) throws Exception;	//게시판 목록 (페이지 나누기, 검색기능 포함)
	int countComm(@Param("searchOption") String searchOption, @Param("keyWord") String keyWord) throws Exception;	//게시물 레코드 갯수 계산
	int insertComm(Communication comm) throws Exception;	//게시글 작성
	Communication showComm(@Param("communicationNum") int communicationNum) throws Exception;	//게시글 읽기
	int updateComm(Communication comm) throws Exception;	//게시글 수정
	int deleteComm(@Param("communicationNum") int communicationNum) throws Exception;	//게시글 삭제
}
