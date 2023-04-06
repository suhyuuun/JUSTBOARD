package service;

import java.util.List;

import dto.BoardDTO;
import dto.PageDTO;

public interface BoardService {

	public int countProcess();

	
	public List<BoardDTO> listProcess(PageDTO pv);
	
	public void insertProcess(BoardDTO dto);
	
	public BoardDTO contentProcess(int num);
	
	public void deleteProcess(int num, String urlpath);
	
	public BoardDTO updateSelectProcess(int num);
	
	public void updateProcess(BoardDTO dto, String urlpath);
	
	public String fileSelectProcess(int num);

}
