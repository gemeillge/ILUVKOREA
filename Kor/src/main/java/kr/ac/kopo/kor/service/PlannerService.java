package kr.ac.kopo.kor.service;

import java.util.List;

import kr.ac.kopo.kor.model.Planner;
import kr.ac.kopo.kor.util.Pager;

public interface PlannerService {

	List<Planner> list(Pager pager, String id);

	void add(Planner item);

	Planner item(int planId);

	void update(Planner item);

	void delete(int planId);

}
