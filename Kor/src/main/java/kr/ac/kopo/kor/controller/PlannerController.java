package kr.ac.kopo.kor.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.kor.model.Member;
import kr.ac.kopo.kor.model.Planner;
import kr.ac.kopo.kor.service.PlannerService;
import kr.ac.kopo.kor.util.Pager;

@Controller
@RequestMapping("/planner")
public class PlannerController {
	
	 final String path ="planner/";
	
	@Autowired
	PlannerService service;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	@GetMapping("/view/{planId}")
	public String view(@PathVariable int planId,Model model) {
		Planner item = service.item(planId);
		
		if(item == null) return "redirect:..";
		
		model.addAttribute("item",item);
		
		return path + "view";
	}
	@RequestMapping("/list")
	public String list(Model model, Pager pager, @SessionAttribute Member member) {
		 
		String id = member.getId();
		
		List<Planner> list = service.list(pager, id);

		model.addAttribute("list",list);
				
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(Planner item) {
		service.add(item);
		return "redirect:list";
		
	}
	@GetMapping("/update")
	public String update(int planId, Model model) {
		Planner item = service.item(planId);
		model.addAttribute("item", item);
		return path + "update";
	}
	
	@PostMapping("/update")
	public String update(Planner item) {
		System.out.println(item.getPlanId());
		service.update(item);
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public String delete(int planId) {
		service.delete(planId);
		
		return "redirect:list";
	}

}
