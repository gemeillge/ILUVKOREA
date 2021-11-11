package kr.ac.kopo.kor.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.kor.model.Member;
import kr.ac.kopo.kor.service.MemberService;

@Controller
public class RootController {

	@Autowired
	MemberService service;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@ResponseBody
	@RequestMapping("/checkId")
	public String checkId(String id) {
		if(service.checkId(id))
			return "OK";
		else
			return "FAIL";
	}
	

	/*
	 * @RequestMapping("/check_email")
	 * public String check_email(String email){
	 * if(service.check_email(email)) 
	 * return "OK"; 
	 * else return "FAIL"; }
	 */
	
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String signup(Member item) {
		service.add(item);
		
		return "redirect:.";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(Member item, HttpSession session) {
		Member member = service.login(item.getId());		
		
		if(member != null) {
			String id = member.getId();
			String passwd = member.getPasswd();
			
			if(id.equals(item.getId()) && passwd.equals(item.getPasswd()) ) {
				
				
				session.setAttribute("member", member);
				
				return "redirect:.";
			}
			
			return "redirect:login";
		}
		
		return "redirect:login";		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:.";
	}

	// 아이디 찾기
	
		@GetMapping("/findId")
		public String findId() {
			return "findId";
		}
		

		@ResponseBody
		@PostMapping("/findId")
		public String findId(@RequestBody Member find) {		
			Member member = service.findId(find.getName(), find.getEmail());
			
			if(member == null) {
				
				return "null";
			}else {
				String id = member.getId();
				return id;
			}		
		}
		@GetMapping("/findPwd")
		public String findPwd() {
			return "findPwd";
		}
		

		@ResponseBody
		@PostMapping("/findPwd")
		public String findPwd(@RequestBody Member find) {		
			Member member = service.findPwd(find.getId(), find.getEmail(), find.getName());
			
			if(member == null) {
				
				return "null";
			}else {
				String passwd = member.getPasswd();
				return passwd;
			}		
		}	
	
}

































