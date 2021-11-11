package kr.ac.kopo.kor.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.kor.dao.BoardDao;
import kr.ac.kopo.kor.model.Board;
import kr.ac.kopo.kor.util.Pager;



@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;
	
	
	
	@Override
	public List<Board> list(Pager pager) {
		int total = dao.total(pager);
		pager.setTotal((float)total);
		return dao.list(pager);
	}

	@Override
	public void add(Board item) {
		String title = item.getbSubject();
		String content = item.getbContent();
		String writer = item.getbWriter();
		
		title = title.replace("<","&lt;");
		title = title.replace("<","&lt;");
		writer = writer.replace("<","&lt;");
		writer = writer.replace("<","&lt;");
		//공백처리
		title = title.replace(" ",	"&nbsp;&nbsp;");
		writer = writer.replace(" ",	"&nbsp;&nbsp;");
		//줄바꿈처리
		content = content.replace("\n",	"<br>");
		
		item.setbSubject(title);
		item.setbContent(content);
		item.setbWriter(writer);
		
		dao.add(item);

	}

	@Override
	public Board item(int boardId) {

		return dao.item(boardId);
	}

	@Override
	public void update(Board item) {
		dao.update(item);

	}

	@Override
	public void delete(int boardId) {
		dao.delete(boardId);
		
	}

	@Override //조회수
	public void increaseViewcont(int boardId) {
		dao.increaseViewcont(boardId);
			
		}
		
	}






























