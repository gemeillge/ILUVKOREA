package kr.ac.kopo.kor.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.kor.model.Area;
import kr.ac.kopo.kor.model.City;
import kr.ac.kopo.kor.model.Tour;
import kr.ac.kopo.kor.model.TourImage;
import kr.ac.kopo.kor.service.AreaService;
import kr.ac.kopo.kor.service.CityService;
import kr.ac.kopo.kor.service.TourImageService;
import kr.ac.kopo.kor.service.TourService;
import kr.ac.kopo.kor.util.Pager;
import kr.ac.kopo.kor.util.Uploader;

@Controller
@RequestMapping("/tour")
public class TourController {
	private final String path = "tour/";

	@Autowired
	TourService service;

	@Autowired
	TourImageService tourImageService;

	@Autowired
	AreaService areaService;

	@Autowired
	CityService cityService;

	@GetMapping("/view/{tourId}")
	public String view(@PathVariable int tourId, Model model) {
		Tour item = service.item(tourId);

		if (item == null)
			return "redirect:..";

		model.addAttribute("item", item);

		return path + "view";
	}

	@GetMapping({ "/", "/list" })
	public String list(Model model, Pager pager) {
		List<Tour> list = service.list(pager);

		model.addAttribute("list", list);

		return path + "list";

	}

	@GetMapping("/add")
	public String add(Model model, Pager pager) {
		List<Area> arealist = areaService.list(pager);
		List<City> citylist = cityService.list(pager);

		model.addAttribute("arealist", arealist);
		model.addAttribute("citylist", citylist);

		return path + "add";

	}

	@PostMapping("/add")
	public String add(Tour item, List<MultipartFile> files) {
		List<TourImage> images = new ArrayList<TourImage>();
		for (MultipartFile file : files) {
			String filename = file.getOriginalFilename();

			if (Uploader.upload(file)) {
				TourImage image = new TourImage();

				image.setFilename(filename);

				images.add(image);
			} else
				System.out.println("Uploader 처리 실패: " + filename);
		}

		item.setTourImages(images);

		service.add(item);

		return "redirect:list";

	}

	@GetMapping("/update/{tourId}")
	public String update(@PathVariable int tourId, Model model, Pager pager) {
		Tour item = service.item(tourId);

		model.addAttribute("item", item);

		List<Area> arealist = areaService.list(pager);
		List<City> citylist = cityService.list(pager);

		model.addAttribute("arealist", arealist);
		model.addAttribute("citylist", citylist);

		return path + "update";

	}

	@PostMapping("/update/{tourId}")
	public String update(@PathVariable int tourId, Tour item) {

		item.setTourId(tourId);

		service.update(item);
		return "redirect:../list";

	}

	@ResponseBody
	@PostMapping("/update/{tourId}/image")
	public TourImage update(@PathVariable int tourId, MultipartFile uploadFile) {
		if (Uploader.upload(uploadFile)) {
			String filename = uploadFile.getOriginalFilename();

			TourImage image = new TourImage();

			image.setTourId(tourId);
			image.setFilename(filename);

			tourImageService.add(image);

			return image;
		} else
			return null;
	}

	@ResponseBody

	@DeleteMapping("/update/{tourId}/{tourImageId}")
	public String delete(@PathVariable int tourId, @PathVariable int tourImageId) {
		tourImageService.delete(tourId, tourImageId);

		return "OK";
	}

	@GetMapping("/delete/{tourId}")
	public String delete(@PathVariable int tourId) {

		service.delete(tourId);
		return "redirect:../list";
	}

}