package kr.ac.kopo.kor.service;

import kr.ac.kopo.kor.model.TourImage;

public interface TourImageService {
	
	void add(TourImage item);

	void delete(int tourId, int tourImageId);
}
