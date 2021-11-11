package kr.ac.kopo.kor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.kor.dao.NoticeDao;
import kr.ac.kopo.kor.model.Notice;
import kr.ac.kopo.kor.util.Pager;


@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao dao;
	
	
	
	@Override
	public List<Notice> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal((float)total);
		
		return dao.list(pager);
	}

	@Override
	public void add(Notice item) {
		String title = item.getnSubject();
		String content = item.getnContent();
		String writer = item.getnWriter();
		
		title = title.replace("<","&lt;");
		title = title.replace("<","&lt;");
		writer = writer.replace("<","&lt;");
		writer = writer.replace("<","&lt;");
		//공백처리
		title = title.replace(" ",	"&nbsp;&nbsp;");
		writer = writer.replace(" ",	"&nbsp;&nbsp;");
		//줄바꿈처리
		content = content.replace("\n",	"<br>");
		
		item.setnSubject(title);
		item.setnContent(content);
		item.setnWriter(writer);
		
		dao.add(item);

	}

	@Override
	public Notice item(int noticeId) {

		return dao.item(noticeId);
	}

	@Override
	public void update(Notice item) {
		dao.update(item);

	}

	@Override
	public void delete(int noticeId) {
		dao.delete(noticeId);
		
	}

	@Override //조회수
	public void increaseViewcont(int noticeId) {
		dao.increaseViewcont(noticeId);
			
		}
		
	}






























