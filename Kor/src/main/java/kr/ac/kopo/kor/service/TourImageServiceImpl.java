package kr.ac.kopo.kor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.kor.dao.TourImageDao;
import kr.ac.kopo.kor.model.TourImage;


@Service
public class TourImageServiceImpl implements TourImageService {

	@Autowired
	TourImageDao dao;
	
	@Override
	public void add(TourImage item) {
		dao.add(item);
	}

	@Override
	public void delete(int tourId, int tourImageId) {
		dao.delete(tourId, tourImageId);
	}

}
