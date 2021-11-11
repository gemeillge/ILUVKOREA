package kr.ac.kopo.kor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.kor.dao.PlannerDao;
import kr.ac.kopo.kor.model.Planner;
import kr.ac.kopo.kor.util.Pager;

@Service
public class PlannerServiceImpl implements PlannerService {

	@Autowired
	PlannerDao dao;
	
	@Override
	public List<Planner> list(Pager pager,String id) {
		int total = dao.total(pager, id);
		
		pager.setTotal((float)total);
		
		return dao.list(pager, id);
	}

	@Override
	public void add(Planner item) {
		dao.add(item);

	}

	@Override
	public Planner item(int planId) {

		return dao.item(planId);
	}

	@Override
	public void update(Planner item) {
		dao.update(item);

	}

	@Override
	public void delete(int planId) {
		dao.delete(planId);

	}

}
