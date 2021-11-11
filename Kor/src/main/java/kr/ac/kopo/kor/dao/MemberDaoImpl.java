package kr.ac.kopo.kor.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.kor.model.Member;
import kr.ac.kopo.kor.util.Pager;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(Member item) {
		sql.insert("member.add", item);

	}

	@Override
	public int checkId(String id) {
		return sql.selectOne("member.checkId", id);
	}

	@Override
	public Member item(String id) {
		return sql.selectOne("member.item", id);
	}

	@Override
	public List<Member> list(Pager pager) {
		return sql.selectList("member.list",pager);
	}

	@Override
	public void update(Member item) {
		sql.update("member.update", item);

	}

	@Override
	public void delete(String id) {
		sql.delete("member.delete", id);

	}

	@Override
	public Member login(String id) {
		return sql.selectOne("member.login", id);
	}
	
	@Override
	public int total(Pager pager) {
		return sql.selectOne("member.total", pager);
	}


	@Override
	public Member findId(String name, String email) {
		HashMap<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);
						
		return sql.selectOne("member.findId", map);
	}

	@Override
		public Member findPwd(String id, String email, String name) {
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("email", email);
		map.put("name", name);
		
		return sql.selectOne("member.findPwd", map);
	}
	

	/*
	 * @Override 
	 * public int check_email(String email) { 
	 * return sql.selectOne("member.check_email", email);
	 * 
	 * }
	 */

}
