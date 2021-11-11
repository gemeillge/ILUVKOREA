package kr.ac.kopo.kor.service;

import java.util.List;

import kr.ac.kopo.kor.model.Area;
import kr.ac.kopo.kor.util.Pager;


public interface AreaService {

	List<Area> list(Pager pager);

	void add(Area item);

	Area item(int areaId);

	void update(Area item);

	void delete(int areaId);





	
	

}
