package kr.ac.kopo.kor.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.kor.model.Notice;
import kr.ac.kopo.kor.util.Pager;


@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Notice> list(Pager pager) {
		
		return sql.selectList("notice.list",pager);
	}

	@Override
	public void add(Notice item) {
		sql.insert("notice.add", item);

	}

	@Override
	public Notice item(int noticeId) {

		return sql.selectOne("notice.item", noticeId);
	}

	@Override
	public void update(Notice item) {
		sql.update("notice.update", item);

	}

	@Override
	public void delete(int noticeId) {
		sql.delete("notice.delete", noticeId);


	}

	@Override
	public void increaseViewcont(int noticeId) {
		sql.update("notice.increaseViewcont", noticeId);
		
	}
	@Override
	public int total(Pager pager) {
		return sql.selectOne("notice.total", pager);
	}

}
