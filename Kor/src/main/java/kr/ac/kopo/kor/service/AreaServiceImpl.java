package kr.ac.kopo.kor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.kor.dao.AreaDao;
import kr.ac.kopo.kor.model.Area;
import kr.ac.kopo.kor.util.Pager;


@Service
public class AreaServiceImpl implements AreaService {

	@Autowired
	AreaDao dao;
	
	@Override
	public List<Area> list(Pager pager) {
		int total = dao.total(pager);
		pager.setTotal((float)total);
		return dao.list(pager);
	}

	@Override
	public void add(Area item) {
		dao.add(item);
	}

	@Override
	public Area item(int areaId) {
		return dao.item(areaId);
	}

	@Override
	public void update(Area item) {
		dao.update(item);
	}

	@Override
	public void delete(int areaId) {
		dao.delete(areaId);

	}

}
