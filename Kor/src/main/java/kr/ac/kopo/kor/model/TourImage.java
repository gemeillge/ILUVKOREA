package kr.ac.kopo.kor.model;

public class TourImage {
	private int tourImageId;
	private String filename;
	private int tourId;
	
	public int getTourImageId() {
		return tourImageId;
	}
	public void setTourImageId(int tourImageId) {
		this.tourImageId = tourImageId;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getTourId() {
		return tourId;
	}
	public void setTourId(int tourId) {
		this.tourId = tourId;
	}
	
	
}
