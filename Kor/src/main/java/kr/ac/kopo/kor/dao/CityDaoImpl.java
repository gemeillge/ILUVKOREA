package kr.ac.kopo.kor.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.kor.model.City;
import kr.ac.kopo.kor.util.Pager;


@Repository
public class CityDaoImpl implements CityDao {

	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<City> list(Pager pager) {
		return sql.selectList("city.list",pager);
	}

	@Override
	public void add(City item) {
		sql.insert("city.add", item);
	}

	@Override
	public City item(int cityId) {
		return sql.selectOne("city.item", cityId);
	}

	@Override
	public void update(City item) {
		sql.update("city.update", item);
	}

	@Override
	public void delete(int cityId) {
		sql.delete("city.delete", cityId);
	}
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("city.total", pager);
	}



}
