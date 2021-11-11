package kr.ac.kopo.kor.dao;

import java.util.List;

import kr.ac.kopo.kor.model.Notice;
import kr.ac.kopo.kor.util.Pager;

public interface NoticeDao {

	List<Notice> list(Pager pager);

	void add(Notice item);

	Notice item(int noticeId);

	void update(Notice item);

	void delete(int noticeId);

	void increaseViewcont(int noticeId);

	int total(Pager pager);
}
