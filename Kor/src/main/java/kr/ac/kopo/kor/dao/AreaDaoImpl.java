package kr.ac.kopo.kor.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.kor.model.Area;
import kr.ac.kopo.kor.util.Pager;


@Repository
public class AreaDaoImpl implements AreaDao {

	@Autowired
	SqlSession sql;
		
	@Override
	public List<Area> list(Pager pager) {
		return sql.selectList("area.list",pager);
	}

	@Override
	public void add(Area item) {
		sql.insert("area.add", item);

	}

	@Override
	public Area item(int areaId) {
		return sql.selectOne("area.item", areaId);
	}

	@Override
	public void update(Area item) {
		sql.update("area.update", item);
	}

	@Override
	public void delete(int areaId) {
		sql.delete("area.delete", areaId);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("area.total", pager);
		}



	

}
