package kr.ac.kopo.kor.model;

import java.util.List;

public class Tour {

	private int tourId;
	private String tourName;
	private String tourMapx;
	private String tourMapy;
	private int areaId;
	private int cityId;
	private List<TourImage> tourImages;
	private String tourCon;
	
	private String areaName;
	private String cityName;
	public int getTourId() {
		return tourId;
	}
	public void setTourId(int tourId) {
		this.tourId = tourId;
	}
	public String getTourName() {
		return tourName;
	}
	public void setTourName(String tourName) {
		this.tourName = tourName;
	}
	public String getTourMapx() {
		return tourMapx;
	}
	public void setTourMapx(String tourMapx) {
		this.tourMapx = tourMapx;
	}
	public String getTourMapy() {
		return tourMapy;
	}
	public void setTourMapy(String tourMapy) {
		this.tourMapy = tourMapy;
	}
	public int getAreaId() {
		return areaId;
	}
	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public List<TourImage> getTourImages() {
		return tourImages;
	}
	public void setTourImages(List<TourImage> tourImages) {
		this.tourImages = tourImages;
	}
	public String getTourCon() {
		return tourCon;
	}
	public void setTourCon(String tourCon) {
		this.tourCon = tourCon;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	
	
	
	
	

}