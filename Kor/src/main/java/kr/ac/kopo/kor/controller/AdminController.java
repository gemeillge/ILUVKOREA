package kr.ac.kopo.kor.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.kor.model.Area;
import kr.ac.kopo.kor.model.City;
import kr.ac.kopo.kor.model.Member;
import kr.ac.kopo.kor.model.Notice;
import kr.ac.kopo.kor.model.Tour;
import kr.ac.kopo.kor.model.TourImage;
import kr.ac.kopo.kor.service.AreaService;
import kr.ac.kopo.kor.service.CityService;
import kr.ac.kopo.kor.service.MemberService;
import kr.ac.kopo.kor.service.NoticeService;
import kr.ac.kopo.kor.service.TourImageService;
import kr.ac.kopo.kor.service.TourService;
import kr.ac.kopo.kor.util.Pager;
import kr.ac.kopo.kor.util.Uploader;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	TourService tourService;
	
	@Autowired
	TourImageService tourImageService;
	
	@Autowired
	AreaService areaService;
	
	@Autowired
	CityService cityService;
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("")
	public String index() {
		return "admin/adminindex";
	}
	
	//회원목록
	@RequestMapping("/memberlist")
	public String memberlist(Model model,Pager pager) {
		List<Member> list = memberService.list(pager);

		model.addAttribute("list", list);

		return "admin/memberlist";
	}
	@GetMapping("/memberupdate")
	public String memberupdate(String id, Model model) {
		Member item = memberService.item(id);
		
		model.addAttribute("item", item);
		
		return "admin/memberupdate";
	}
	
	@PostMapping("/memberupdate")
	public String memberupdate(Member item) {
		memberService.update(item);
		
		return "redirect:memberlist";
	}
	
	@RequestMapping("/memberdelete")
	public String memberdelete(String id) {
		memberService.delete(id);
		
		return "redirect:memberlist";
	}	
	
	//관광지 관리자
	@GetMapping("/tourview/{tourId}")
	public String tourview(@PathVariable int tourId, Model model) {
		Tour item = tourService.item(tourId);
		
		
		if(item == null)
			return "redirect:..";
		
		model.addAttribute("item", item);
		
		return "admin/tourview";
	}
	
	
	
	
	@GetMapping("/tourlist")
	public String tourlist(Model model,Pager pager) {
		List<Tour> list = tourService.list(pager);
		

		model.addAttribute("list", list);

		return "admin/tourlist";

	}

	@GetMapping("/touradd")
	public String touradd(Model model,Pager pager) {
		pager.setPerPage(Integer.MAX_VALUE);
		List<Area> arealist = areaService.list(pager);
		
		pager.setPerPage(Integer.MAX_VALUE);
		List<City> citylist = cityService.list(pager);
		
		model.addAttribute("arealist", arealist);
		model.addAttribute("citylist", citylist);
		
		return "admin/touradd";

	}

	@PostMapping("/touradd")
	public String touradd(Tour item, List<MultipartFile> files) {		

		
		List<TourImage> images = new ArrayList<TourImage>();
		
		for(MultipartFile file : files) {
			String filename = file.getOriginalFilename();
						
			if(Uploader.upload(file)) {
				TourImage image = new TourImage();
				
				image.setFilename(filename);
				
				images.add(image);
			} else
				System.out.println("Uploader 처리 실패: " + filename);
		}
		
		item.setTourImages(images);
		
		tourService.add(item);

		return "redirect:tourlist";

	}

	@GetMapping("/tourupdate/{tourId}")
	public String tourupdate(@PathVariable int tourId, Model model, Pager pager) {
		Tour item = tourService.item(tourId);
		
		model.addAttribute("item", item);
		
		List<Area> arealist = areaService.list(pager);
		List<City> citylist = cityService.list(pager);
		
		model.addAttribute("arealist", arealist);
		model.addAttribute("citylist", citylist);
		
		return "admin/tourupdate";

	}

	@PostMapping("/tourupdate/{tourId}")
	public String tourupdate(@PathVariable int tourId, Tour item) {
		
		item.setTourId(tourId);
		
		tourService.update(item);
		return "redirect:../tourlist";
		
		

	}
	@ResponseBody
	@PostMapping("/tourupdate/{tourId}/image")
	public TourImage tourupdate(@PathVariable int tourId, MultipartFile uploadFile) {
		if(Uploader.upload(uploadFile)) {
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
	@DeleteMapping("/tourupdate/{tourId}/{tourImageId}")
	public String tourdelete(@PathVariable int tourId, @PathVariable int tourImageId) {
		tourImageService.delete(tourId, tourImageId);
		
		return "OK";
	}

	@GetMapping("/tourdelete/{tourId}")
	public String tourdelete(@PathVariable int tourId) {
		
		tourService.delete(tourId);
		return "redirect:../tourlist";
	}
	
	
//공지사항 관리자 
	@InitBinder public void initBinder(WebDataBinder binder) { SimpleDateFormat
		 dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 binder.registerCustomEditor(java.util.Date.class, new
		 CustomDateEditor(dateFormat, false)); }
		 
		
		/*
		 * @GetMapping("/view/{boardId}") public ModelAndView view(@RequestParam int
		 * boardId, HttpSession session){ // 조회수 증가 처리 service.increaseViewcont(boardId,
		 * session); // 모델(데이터)+뷰(화면)를 함께 전달하는 객체 ModelAndView mav = new ModelAndView();
		 * // 뷰의 이름 mav.setViewName("board/view"); // 뷰에 전달할 데이터 mav.addObject("dto",
		 * service.item(boardId)); return mav; }
		 */
		 
		
		 @GetMapping("/noticeview/{noticeId}")
		 public String noticeview(@PathVariable int noticeId,  Model model)  { 
			 Notice item =  noticeService.item(noticeId);
			
		  
			 if (item == null) return "redirect:..";
			 
			 noticeService.increaseViewcont(noticeId);
			 model.addAttribute("item", item);
		  
			 return "admin/noticeview"; }
		 
		 
		@RequestMapping("/noticelist")
		public String noticelist(Model model,Pager pager) {
			List<Notice> list = noticeService.list(pager);

			model.addAttribute("list", list);

			return "admin/noticelist";

		}

		@GetMapping("/noticeadd")
		public String noticeadd() {
			return "admin/noticeadd";

		}

		@PostMapping("/noticeadd")
		public String noticeadd(Notice item) {
			noticeService.add(item);

			return "redirect:noticelist";

		}

		@GetMapping("/noticeupdate")
		public String noticeupdate(int noticeId, Model model) {
			Notice item = noticeService.item(noticeId);
			
			model.addAttribute("item", item);
			return "admin/noticeupdate";

		}

		@PostMapping("/noticeupdate")
		public String noticeupdate(Notice item) {
			noticeService.update(item);
			return "redirect:noticelist";

		}

		@RequestMapping("/noticedelete")
		public String noticedelete(int noticeId) {
			noticeService.delete(noticeId);
			return "redirect:noticelist";
		}
	
	
	

}
