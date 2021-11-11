package kr.ac.kopo.kor.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.kor.model.Board;
import kr.ac.kopo.kor.util.Pager;


@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Board> list(Pager pager) {	
		return sql.selectList("board.list",pager);
	}

	@Override
	public void add(Board item) {
		sql.insert("board.add", item);

	}

	@Override
	public Board item(int boardId) {

		return sql.selectOne("board.item", boardId);
	}

	@Override
	public void update(Board item) {
		sql.update("board.update", item);

	}

	@Override
	public void delete(int boardId) {
		sql.delete("board.delete", boardId);


	}

	@Override
	public void increaseViewcont(int boardId) {
		sql.update("board.increaseViewcont", boardId);
		
	}
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("board.total", pager);
	}

}
