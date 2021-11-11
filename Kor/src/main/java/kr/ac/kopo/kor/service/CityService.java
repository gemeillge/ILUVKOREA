package kr.ac.kopo.kor.service;

import java.util.List;

import kr.ac.kopo.kor.model.City;
import kr.ac.kopo.kor.util.Pager;

public interface CityService {

	List<City> list(Pager pager);

	void add(City item);

	City item(int cityId);

	void update(City item);

	void delete(int cityId);

	


}
