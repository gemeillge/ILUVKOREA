package kr.ac.kopo.kor.dao;

import java.util.List;

import kr.ac.kopo.kor.model.Area;
import kr.ac.kopo.kor.util.Pager;

public interface AreaDao {

	List<Area> list(Pager pager);

	void add(Area item);

	Area item(int areaId);

	void update(Area item);

	void delete(int areaId);

	int total(Pager pager);





}
