package kr.ac.kopo.kor.dao;

import java.util.List;

import kr.ac.kopo.kor.model.City;
import kr.ac.kopo.kor.util.Pager;

public interface CityDao {

	List<City> list(Pager pager);

	void add(City item);

	City item(int cityId);

	void update(City item);

	void delete(int cityId);

	int total(Pager pager);



}
