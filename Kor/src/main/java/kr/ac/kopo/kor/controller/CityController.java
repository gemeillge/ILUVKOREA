package kr.ac.kopo.kor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.kor.model.Area;
import kr.ac.kopo.kor.model.City;
import kr.ac.kopo.kor.service.AreaService;
import kr.ac.kopo.kor.service.CityService;
import kr.ac.kopo.kor.util.Pager;

@Controller
@RequestMapping("/city")
public class CityController {
	private final String path ="city/";
	
	@Autowired
	CityService service;
	
	@Autowired
	AreaService areaService;
	
	@RequestMapping("/list")
	public String list(Model model, Pager pager) {
		
		List<City> list = service.list(pager);
		model.addAttribute("list", list);

		return path + "list";

	}

	@GetMapping("/add")
	public String add(Model model, Pager pager) {
		
		List<Area> list = areaService.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "add";

	}

	@PostMapping("/add")
	public String add(City item) {
		service.add(item);

		return "redirect:list";

	}

	@GetMapping("/update")
	public String update(int cityId, Model model, Pager pager) {
		City item = service.item(cityId);
		model.addAttribute("item", item);
		
		List<Area> arealist = areaService.list(pager);
		model.addAttribute("arealist", arealist);
		
		return path + "update";

	}

	@PostMapping("/update")
	public String update(City item) {
		service.update(item);
		return "redirect:list";

	}

	@RequestMapping("/delete")
	public String delete(int cityId) {
		service.delete(cityId);
		return "redirect:list";
	}
}
