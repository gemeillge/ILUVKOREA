package kr.ac.kopo.kor.util;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class Uploader {
	
	static String uploadPath = "D://upload/";

	public static boolean upload(MultipartFile file) {
		if (file != null && !file.isEmpty()) {
			String filename = file.getOriginalFilename();

			try {
				file.transferTo(new File(uploadPath + filename));
				
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return false;
	}

}