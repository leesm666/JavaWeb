package com.springboot.mybatisweb.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springboot.mybatisweb.model.CommentDo;
import com.springboot.mybatisweb.model.DogDo;
import com.springboot.mybatisweb.service.CommentService;
import com.springboot.mybatisweb.service.DogService;

@Controller
public class DogController {

	@Autowired
	DogService dService;

	@Autowired
	CommentService cService;

	@RequestMapping(value = "/insertBoard.do")
	public String insertBoard() {
		System.out.println("[Mybatis] insertBoard() -- >");

		// 뷰리졸버에 의해서,
		// /boardviews/insertBoard.jsp 호출하게 됨..
		return "insertBoard";
	}

	@PostMapping(value = "/insertBoardProc.do")
	public String insertBoardProc(@ModelAttribute DogDo ddo) throws IOException {

		String fileName = null;
		MultipartFile file = ddo.getUploadimage();
		if (!file.isEmpty()) {

			String originalFileName = file.getOriginalFilename();
			fileName = originalFileName;
			file.transferTo(new File("C:\\upload\\" + fileName));

		}

		ddo.setImage(fileName);
		dService.insertBoard(ddo);

		return "redirect:/getAllDogs.do";
	}

	@RequestMapping(value = "/getAllDogs.do")
	public String getAllDogs(DogDo ddo, Model model) {
		System.out.println("[Mybatis] getAllDogs() --> ");

		ArrayList<DogDo> dList = dService.getAllDogs();

		for (DogDo ddo1 : dList) {
			System.out.println("-->" + ddo1.toString());
		}

		model.addAttribute("dList", dList);

		return "getAllDogs";
	}

	@RequestMapping(value = "/getAllDogsContent.do")
	public String getAllDogsContent(DogDo ddo, Model model, RedirectAttributes rttr) {
		System.out.println("[Mybatis] getAllDogsContent() !!");
		System.out.println("seq: " + ddo.getSeq());

		// Dao의 getBoard() 이용하여 한개의 데이터 가져오기
		DogDo dogsboard = dService.getDogsBoard(ddo);

		System.out.println(dogsboard.getLocation());
		System.out.println(dogsboard.getImage());

		// 댓글 목록 조회
		ArrayList<CommentDo> comments = cService.getCommentList(ddo.getSeq());
		System.out.println("댓글 목록 크기: " + comments.size()); // 디버깅용

		// 이미지 파일 경로 설정
		if (dogsboard.getImage() != null && !dogsboard.getImage().isEmpty()) {
			String imagePath = "C:/upload/" + dogsboard.getImage();
			model.addAttribute("imagePath", imagePath);
		}

		model.addAttribute("dogsboard", dogsboard);
		model.addAttribute("comments", comments);

		return "getAllDogsContent";

	}

	// 비밀번호 불일치시 처리 메솓
	@PostMapping("/boardAction.do")
	public String boardAction(@RequestParam("password") String password, @RequestParam("action") String action,
			RedirectAttributes rttr, DogDo ddo) {
		DogDo dogsboard = dService.getDogsBoard(ddo);

		if (dogsboard != null && dogsboard.getPassword().equals(password)) {
			if ("modify".equals(action)) {
				return "redirect:/modifyBoard.do?seq=" + ddo.getSeq();
			} else if ("delete".equals(action)) {
				System.out.println("Delete삭제 기능 --> ");
				System.out.println(ddo.toString());

				dService.deleteBoard(ddo);
				return "redirect:/getAllDogs.do";
			}
		} else {
			rttr.addFlashAttribute("errorMessage1", "비밀번호가 일치하지 않습니다.");
		}
		return "redirect:/getAllDogsContent.do?seq=" + ddo.getSeq();
	}

	@RequestMapping(value = "/modifyBoard.do")
	public String modifyBoard(DogDo ddo, Model model) {
		System.out.println("[Mybatis] modifyBoard() !!");
		System.out.println("seq: " + ddo.getSeq());

		// Dao의 getBoard() 이용하여 한개의 데이터 가져오기
		DogDo dogsboard = dService.getDogsBoard(ddo);
		model.addAttribute("dogsboard", dogsboard);

		return "getAllDogsContentModify";
	}

	@RequestMapping(value = "/modifyBoardProc.do")
	public String modifyBoardProc(DogDo ddo, Model model) {
		System.out.println("[Mybatis] modifyBoardProc() !!");

		dService.modifyBoard(ddo);

		return "redirect:/getAllDogsContent.do?seq=" + ddo.getSeq();

	}

	@RequestMapping(value = "/searchBoardList.do")
	public String searchBoardList(@RequestParam(value = "searchCon") String searchCon,
			@RequestParam(value = "searchKey") String searchKey, Model model) {

		System.out.println("[Mybatis] searchBoardList()");
		System.out.println("searchCon:" + searchCon);
		System.out.println("searchKey:" + searchKey);

		ArrayList<DogDo> dList = dService.searchBoardList(searchCon, searchKey);

		model.addAttribute("dList", dList);

		return "getAllDogs";

	}

	@RequestMapping("/filterByCategory.do")
	public String filterByCategory(@RequestParam("category") String category, Model model) {

		ArrayList<DogDo> dList;
		// 전체
		if (category == null || category.isEmpty()) {
			System.out.println("category == null || category.isEmpty()");
			dList = dService.getAllDogs();
		} else {
			System.out.println(category);
			dList = dService.getDogsByCategory(category);
		}

		// Add data to the model
		model.addAttribute("dList", dList);

		return "getAllDogs";
	}

	// 댓글 작성 처리
	@PostMapping("/comment/write.do")
	public String writeComment(@ModelAttribute CommentDo cdo) {
		System.out.println("댓글 작성 완료");
		// null 체크 추가
		if (cdo.getWriter() != null && cdo.getContent() != null) {
			cService.insertComment(cdo);
		}

		System.out.println(cdo.getDog_id());
		return "redirect:/getAllDogsContent.do?seq=" + cdo.getDog_id();
	}

	@PostMapping("/comment/delete.do")
	public String deleteComment(@ModelAttribute CommentDo cdo, RedirectAttributes rttr) {
		CommentDo existingComment = cService.getCommentInfo(cdo.getComments_id());

		if (existingComment != null && existingComment.getPassword().equals(cdo.getPassword())) {
			cService.deleteComment(cdo);
		} else {
			// 비밀번호가 일치하지 않을 때 메시지 전달
			rttr.addFlashAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
		}
		return "redirect:/getAllDogsContent.do?seq=" + cdo.getDog_id();
	}

}
