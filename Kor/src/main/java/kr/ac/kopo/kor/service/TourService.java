package kr.ac.kopo.kor.service;

import java.util.List;

import kr.ac.kopo.kor.model.Tour;
import kr.ac.kopo.kor.util.Pager;

public interface TourService {

	List<Tour> list(Pager pager);

	void add(Tour item);

	Tour item(int tourId);

	void update(Tour item);

	void delete(int tourId);



}
