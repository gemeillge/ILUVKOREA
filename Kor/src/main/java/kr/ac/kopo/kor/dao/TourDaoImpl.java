package kr.ac.kopo.kor.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.kor.model.Tour;
import kr.ac.kopo.kor.util.Pager;

@Repository
public class TourDaoImpl implements TourDao {

	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<Tour> list(Pager pager) {
		return sql.selectList("tour.list",pager);
	}

	@Override
	public void add(Tour item) {
		sql.insert("tour.add", item);
	}

	@Override
	public Tour item(int tourId) {
		return sql.selectOne("tour.item", tourId);
	}

	@Override
	public void update(Tour item) {
		sql.update("tour.update", item);
	}

	@Override
	public void delete(int tourId) {
		sql.delete("tour.delete", tourId);

	}

	@Override
	public Tour nameitem(int tourId) {
		return sql.selectOne("tour.nameitem",tourId);
	}
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("tour.total", pager);
	}

}
