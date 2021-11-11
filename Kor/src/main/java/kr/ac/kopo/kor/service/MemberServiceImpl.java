package kr.ac.kopo.kor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.kor.dao.MemberDao;
import kr.ac.kopo.kor.model.Member;
import kr.ac.kopo.kor.util.Pager;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Override
	public List<Member> list(Pager pager) {
		int total = dao.total(pager);
		pager.setTotal((float)total);
		return dao.list(pager);
	}

	@Override
	public void add(Member item) {
		dao.add(item);
	}

	@Override
	public boolean checkId(String id) {
		if(dao.checkId(id) > 0)
			return false;
		else
			return true;
	}

	@Override
	public Member item(String id) {
		return dao.item(id);
	}



	@Override
	public void update(Member item) {
		dao.update(item);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public Member login(String id) {		
		return dao.login(id);
	}
	
	@Override
	public Member findId(String name, String email) {
		return dao.findId(name, email);
	}

	

	@Override
	public Member findPwd(String id, String email, String name) {
		return dao.findPwd(id, email, name);
		
	}

	/*
	 * @Override 
	 * public boolean check_email(String email) {
	 * if(dao.check_email(email)>0) 
	 * return false; else return true; }
	 */
}
