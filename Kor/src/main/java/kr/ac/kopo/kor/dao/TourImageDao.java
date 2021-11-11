package kr.ac.kopo.kor.dao;

import kr.ac.kopo.kor.model.TourImage;

public interface TourImageDao {

	void add(TourImage item);
	
	void deleteByTourId(int tourId);

	void delete(int tourId, int tourImageId);

}
