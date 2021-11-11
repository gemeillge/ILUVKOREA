package kr.ac.kopo.kor.service;

import java.util.List;

import kr.ac.kopo.kor.model.Member;
import kr.ac.kopo.kor.util.Pager;



public interface MemberService {

	List<Member> list(Pager pager);

	
	Member item(String id);

	void update(Member item);

	void delete(String id);

	boolean checkId(String id);

	//boolean check_email(String email);

	void add(Member item);


	Member login(String id);
	
	//아이디 찾기
	Member findId(String name, String email);
	
	//비밀번호 찾기
	Member findPwd(String id, String email, String name);


		



}
