package kr.ac.kopo.kor.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.ac.kopo.kor.model.Member;
import kr.ac.kopo.kor.service.MemberService;
import kr.ac.kopo.kor.util.Pager;


@Controller
@RequestMapping("/member")
public class MemberController {
	final String path = "member/";
	
	@Autowired
	MemberService service;
	
	
	  @RequestMapping({"", "/", "/list"})
	  public String list(Model model,Pager pager) {
	  List<Member> list = service.list(pager);
	  
	  model.addAttribute("list", list);
	  
	  return path + "list"; }
	 
	
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(Member item) {
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/update")
	public String update(String id, Model model) {
		Member item = service.item(id);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/update")
	public String update(Member item) {
	 service.update(item);
		
		return "redirect:..";
	}
	
	@RequestMapping("/delete")
	public String delete(String id, HttpSession session) {
		service.delete(id);
		session.invalidate();
		return "redirect:..";
	}	
}









