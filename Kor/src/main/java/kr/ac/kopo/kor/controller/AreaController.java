package kr.ac.kopo.kor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.kor.model.Area;
import kr.ac.kopo.kor.service.AreaService;
import kr.ac.kopo.kor.util.Pager;

@Controller
@RequestMapping("/area")
public class AreaController {
	private final String path ="area/";
	
	@Autowired
	AreaService service;
	
	
	@RequestMapping("/list")
	public String list(Model model, Pager pager) {
		
		
		
		List<Area> list = service.list(pager);
		model.addAttribute("list", list);

		return path + "list";

	}

	@GetMapping("/add")
	public String add() {
		return path + "add";

	}

	@PostMapping("/add")
	public String add(Area item) {
		service.add(item);

		return "redirect:list";

	}

	@GetMapping("/update")
	public String update(int areaId, Model model) {
		Area item = service.item(areaId);
		
		model.addAttribute("item", item);
		return path + "update";

	}

	@PostMapping("/update")
	public String update(Area item) {
		service.update(item);
		return "redirect:list";

	}

	@RequestMapping("/delete")
	public String delete(int areaId) {
		service.delete(areaId);
		return "redirect:list";
	}
}
