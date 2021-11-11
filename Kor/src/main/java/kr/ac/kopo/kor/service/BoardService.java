package kr.ac.kopo.kor.service;

import java.util.List;


import kr.ac.kopo.kor.model.Board;
import kr.ac.kopo.kor.util.Pager;

public interface BoardService {

	List<Board> list(Pager pager);

	void add(Board item);

	Board item(int boardId);

	void update(Board item);

	void delete(int boardId);

	void increaseViewcont(int boardId);


}
