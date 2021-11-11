package kr.ac.kopo.kor.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.kor.model.Planner;
import kr.ac.kopo.kor.util.Pager;


@Repository
public class PlannerDaoImpl implements  PlannerDao {

	@Autowired
	SqlSession sql; 
	
	@Override
	public void add(Planner item) {
		sql.insert("planner.add", item);
		
	}

	@Override
	public Planner item(int planId) {

		return sql.selectOne("planner.item",planId);
	}

	@Override
	public void update(Planner item) {
		sql.update("planner.update", item);
		
	}

	@Override
	public void delete(int planId) {
		sql.delete("planner.delete", planId);

		
	}

	@Override
	public List<Planner> list(Pager pager, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("pager", pager);
		map.put("id", id);

		return sql.selectList("planner.list", map);
	}

	@Override
	public int total(Pager pager, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("pager", pager);
		map.put("id", id);

		return sql.selectOne("planner.total", map);
	}
}
