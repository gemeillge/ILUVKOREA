package kr.ac.kopo.kor.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Planner {

	private int planId;// 플래너 번허
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date planRdate;// 작성일
	
	private String planTitle;// 제목
	private int planMsize;// 인원수
	private String planConcept;// 테마 내용
	private String planDay;// day
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date planSday;// 시작일
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date planEday;// 종료일
	private String id ;

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public Date getPlanRdate() {
		return planRdate;
	}

	public void setPlanRdate(Date planRdate) {
		this.planRdate = planRdate;
	}

	public String getPlanTitle() {
		return planTitle;
	}

	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}

	public int getPlanMsize() {
		return planMsize;
	}

	public void setPlanMsize(int planMsize) {
		this.planMsize = planMsize;
	}

	public String getPlanConcept() {
		return planConcept;
	}

	public void setPlanConcept(String planConcept) {
		this.planConcept = planConcept;
	}

	public String getPlanDay() {
		return planDay;
	}

	public void setPlanDay(String planDay) {
		this.planDay = planDay;
	}

	public Date getPlanSday() {
		return planSday;
	}

	public void setPlanSday(Date planSday) {
		this.planSday = planSday;
	}

	public Date getPlanEday() {
		return planEday;
	}

	public void setPlanEday(Date planEday) {
		this.planEday = planEday;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
			
}