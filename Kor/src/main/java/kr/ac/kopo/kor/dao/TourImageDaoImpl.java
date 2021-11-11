package kr.ac.kopo.kor.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.kor.model.TourImage;

@Repository
public class TourImageDaoImpl implements TourImageDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(TourImage item) {
		sql.insert("tour_image.add", item);
	}

	@Override
	public void delete(int tourId, int tourImageId) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("tourId", tourId);
		map.put("tourImageId", tourImageId);
		
		sql.delete("tour_image.delete", map);
	}

	@Override
	public void deleteByTourId(int tourId) {
		sql.delete("tour_image.deleteByTourId", tourId);
		
	}

}
