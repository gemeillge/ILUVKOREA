package kr.ac.kopo.kor.dao;

import java.util.List;

import kr.ac.kopo.kor.model.Member;
import kr.ac.kopo.kor.util.Pager;



public interface MemberDao {

	void add(Member item);

	int checkId(String id);

	Member item(String id);

	List<Member> list(Pager pager);

	void update(Member item);

	void delete(String id);

	Member login(String id);

	Member findId(String name, String email);

	Member findPwd(String id, String email, String name);

	int total(Pager pager);

	/* Member findId(String email); */

	//int check_email(String email);

}
