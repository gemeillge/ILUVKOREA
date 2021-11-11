package kr.ac.kopo.kor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.kor.dao.TourDao;
import kr.ac.kopo.kor.dao.TourImageDao;
import kr.ac.kopo.kor.model.Tour;
import kr.ac.kopo.kor.model.TourImage;
import kr.ac.kopo.kor.util.Pager;



@Service
public class TourServiceImpl implements TourService {

	
	@Autowired
	TourDao dao;
	
	@Autowired
	TourImageDao tourImageDao;
	
	@Override
	public List<Tour> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal((float)total);
		
		return dao.list(pager);
	}

	@Override
	@Transactional
	public void add(Tour item) {
		dao.add(item);
		
		System.out.println(item.getTourImages().size());
		
		for(TourImage image : item.getTourImages()) {
			System.out.println(image.getFilename());
			
			image.setTourId( item.getTourId() );
			
			tourImageDao.add(image);
		}
	}

	@Override
	public Tour item(int tourId) {
		Tour item = dao.item(tourId);
		Tour nameitem = dao.nameitem(tourId);
		
		item.setAreaName(nameitem.getAreaName());
		item.setCityName(nameitem.getCityName());
		
		return item;
	}

	@Override
	public void update(Tour item) {
		dao.update(item);

	}

	@Override
	@Transactional
	public void delete(int tourId) {
		tourImageDao.deleteByTourId(tourId);
		dao.delete(tourId);

	}

	

}
