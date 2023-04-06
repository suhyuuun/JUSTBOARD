package dao;

import java.util.List;

import dto.BoardDTO;
import dto.PageDTO;

public interface BoardDAO {

	//게시판 현재 페이지용
	public int count();
	
	//게시글 리스트
	public List<BoardDTO> list(PageDTO pv);
	
	//게시글 저장
	public void save(BoardDTO dto);
	
	//게시글 정보
	public BoardDTO content(int num);
	
	//게시글 조회수
	public void readCount(int num);
	
	//게시글 수정
	public void update(BoardDTO dto);
	
	//게시글 삭제
	public void delete(int num);
	
	//파일 가져오기
	public String getFile(int num);

}
