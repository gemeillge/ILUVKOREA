package kr.ac.kopo.kor.util;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	private int page = 1; //그냥 페이지
	private int perPage = 16; /* 한 페이지에 보여주고 싶은 양 */
	private float total; //총량
	private int perGroup = 5; // 다음 페이지 그룹으로 이동할 때 한 번에 이동할 갯수. 잘 안바꿈
	private int search = 0; //?
	private String keyword; //??
	private String order;	//???
	private int orderMode = 0;  // 0=default 1=asc 2=desc
	
	
	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public int getOrderMode() {
		return orderMode;
	}

	public void setOrderMode(int orderMode) {
		this.orderMode = orderMode;
	}

	public int getOffset() {
		return (page - 1) * perPage;
	}
	
	public String getQuery() {
		String queryString = "";
		
		queryString += "&perPage=" + perPage;
		
		if(search > 0)
		queryString += "search=" + search + "&keyword=" + keyword ;
		
		if(orderMode == 1 || orderMode == 2)
			queryString += "&order=" + order +"&orderMode=" + orderMode;
		return queryString;
	}
	public int getSearch() {
		return search;
	}

	public void setSearch(int search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {	
		this.keyword = keyword;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public float getTotal() {
		return total;
	}

	public List<Integer> getList() {
		ArrayList<Integer> list = new ArrayList<Integer>();

		int startPage = (page - 1) / perGroup * perGroup + 1;

		for (int index = startPage; index < (startPage + perGroup) && index <= getLast(); index++)
			list.add(index);

		if (list.isEmpty())
			list.add(1);

		return list;
	}

	public int getLast() { //pagination의 마지막 페이지를 구하는 메소드
		return (int) Math.ceil(total / perPage); //주어진 숫자보다 크거나 같은 Integer를 반환
	}

	public int getPrev() { //이전 페이지 그룹
		return page <= perPage ? 1 : (((page - 1) / perGroup) - 1) * perGroup + 1;
	}

	public int getNext() { //다음 페이지 그룹
		int next = (((page - 1) / perGroup) + 1) * perGroup + 1;
		int last = getLast();

		return next < last ? next : last;
	}

}
