package com.javalec.board.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.javalec.board.dto.BoardDto;
import com.javalec.board.service.ImageBoardService;

@Controller
@RequestMapping("/imageboard")
public class ImageBoardController {
private static final Logger logger = LoggerFactory.getLogger(ImageBoardController.class);
	
	@Resource(name="imageBoardService")
	private 	 imageBoardService;
	
	// 사용자가 board/imageboard 로 url 요청
	@RequestMapping("/list")
	public String list(Model model) {
		logger.info("imageboard_list()");
		model.addAttribute("list", imageBoardService.list());
		return "imageboard/list";
	}
	
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) {
		logger.info("imageboard_delete()");
		imageBoardService.delete(Integer.parseInt(request.getParameter("bId")));
		return "redirect:list";
	}
	
	@RequestMapping("/writeview")
	public String writeView() {
		logger.info("imageboard_write_view()");
		return "imageboard/writeview";
	}
	
	@RequestMapping("/write")
	public String write(BoardDto dto, MultipartFile uploadfile) {
		logger.info("imageboard_write()");
		
		logger.info("dto: {}", dto);
		logger.info("MultipartFile: {}", uploadfile);

		logger.info("파일 이름: {}", uploadfile.getOriginalFilename());
		logger.info("파일 크기: {}", uploadfile.getSize());
		
		saveFile(uploadfile); // 경로에 파일을 저장
		
		dto.setbImage(uploadfile.getOriginalFilename());
		
		System.out.println(dto.getbImage());
		
		imageBoardService.write(dto);
		return "redirect:list";
	}
	
	private String saveFile(MultipartFile file) {
		// 파일 이름 변경
		/*UUID uuid = UUID.randomUUID();*/		
		String saveName = file.getOriginalFilename();
		
		logger.info("saveName: {}", saveName);
		
		// 저장할 파일 객체 생성
		File saveFile = new File("D:\\Spring\\SpringBitStudy\\workspace_bit_board\\imageBoard\\src\\main\\webapp\\resources\\files",saveName); // 저장할 폴더, 파일이름
		
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return saveName;
	}

	// board/imageBoard/1 처럼 요청 -> contentView 메서드 실행 -> contentview.jsp 와 연결
	@RequestMapping("/{bId}")
	public String contentView(@PathVariable int bId, Model model) {
		logger.info("imageboard_contentView()");
		imageBoardService.contentCount(bId);
		model.addAttribute("list", imageBoardService.contentView(bId));
		return "imageboard/contentview";
	}
	
	// board/imageBoard/update/1 -> updateView 메서드 실행 -> 1번글 수정 view로 이동
	@RequestMapping("update/{bId}")
	public String updateView(@PathVariable int bId, Model model) {
		logger.info("imageboard_updateView()");
		model.addAttribute("list", imageBoardService.updateView(bId));
		return "imageboard/updateview";
	}
	
	// board/imageBoard/updateAction 으로 요청시 -> update 메서드 실행 -> board/imageBoard 로 돌아감
	@RequestMapping("/updateAction")
	public String update(BoardDto dto, MultipartFile uploadfile) {
		logger.info("imageboard_update()");
		
		logger.info("dto: {}", dto);
		logger.info("MultipartFile: {}", uploadfile);
		
		logger.info("파일 이름: {}", uploadfile.getOriginalFilename());
		logger.info("파일 크기: {}", uploadfile.getSize());
		
		saveFile(uploadfile);
		
		dto.setbImage(uploadfile.getOriginalFilename());
		
		imageBoardService.update(dto);
		return "redirect:list";
	}
	
}
