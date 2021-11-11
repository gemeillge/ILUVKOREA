package kr.ac.kopo.kor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.kor.dao.CityDao;
import kr.ac.kopo.kor.model.City;
import kr.ac.kopo.kor.util.Pager;


@Service
public class CityServiceImpl implements CityService {

	@Autowired
	CityDao dao;
	
	@Override
	public List<City> list(Pager pager) {
		int total = dao.total(pager);
		pager.setTotal((float)total);
		return dao.list(pager);
	}

	@Override
	public void add(City item) {
		dao.add(item);
	}

	@Override
	public City item(int cityId) {
		return dao.item(cityId);
	}

	@Override
	public void update(City item) {
		dao.update(item);
	}

	@Override
	public void delete(int cityId) {
		dao.delete(cityId);
	}




	
}
