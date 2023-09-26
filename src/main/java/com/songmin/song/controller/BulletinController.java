package com.songmin.song.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.songmin.song.domain.BulletinDto;
import com.songmin.song.domain.PageCondition;
import com.songmin.song.domain.PageHandler;
import com.songmin.song.service.BulletinBoardService;
import com.songmin.song.service.BulletinService;
import com.songmin.song.service.JoinCafeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/bulletin")
public class BulletinController {

    @Autowired
    BulletinService bulletinService;

    @Autowired
    BulletinBoardService bulletinBoardService;
    @Autowired
    JoinCafeService joinCafeService;


    //	pc(검색조건)에 해당하는 게시글 가져오는 메서드 - cafeMain.jsp
    @GetMapping("/list")
    public String list(@ModelAttribute("pc") PageCondition pc, String manager_id, String loginId, Model m) {

        //	게시판 조건이 없으면 "전체 게시판" 으로 초기화
        if (pc.getBulletin_board().equals("")) {
            pc.setBulletin_board("전체 게시판");
        }

		//	page 조건이 null 이면 1로 초기화
		if (pc.getPage() == null) {
			pc.setPage(1);
		}

        //	검색조건 출력해보기
        System.out.println("||------------------------------------------------------------------");
        System.out.println("pc = " + pc);
        System.out.println("------------------------------------------------------------------||");

        //	필요 변수 생성
        List<BulletinDto> bulletinDtoList = new ArrayList<>();
        int totalCnt = 0;
        PageHandler ph = null;
        List<String> bulletin_boardList = new ArrayList<>();
        List<String> joinCafeList = new ArrayList<>();

        try {
            //	pc(검색조건)을 만족하는 게시글 가져오기 (현재 페이지의 게시글들)
            bulletinDtoList = bulletinService.readPageConditionBulletins(pc);
            //	pc(검색조건)을 만족하는 총 게시글 수 가져오기 (전체 페이지의 게시글 수)
            totalCnt = bulletinService.countPageConditionBulletins(pc);
            //	ph(전체 페이지 관리) 생성
            ph = new PageHandler(pc, totalCnt);
            System.out.println("ph = " + ph);

            //	현재 카페의 게시판들 가져오기
            bulletin_boardList = bulletinBoardService.readBulletin_board(pc.getCafe_name());
            //	현재 아이디의 가입한 카페들 가져오기
            joinCafeList = joinCafeService.read(loginId);

        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        //	모델에 저장
        m.addAttribute("ph", ph);
        m.addAttribute("bulletinDtoLIst", bulletinDtoList);
        m.addAttribute("bulletin_boardList", bulletin_boardList);
        m.addAttribute("joinCafeList", joinCafeList);
        m.addAttribute("manager_id", manager_id);

        //	사용자가 작성한 게시글 이면
        if (pc.getReadId() != "" && pc.getCommentBnoList() == null) {
            m.addAttribute("mode", "userBulletin");
        }

        //	사용자가 댓글단 게시글 이면
        if (pc.getCommentBnoList() != null) {
            m.addAttribute("mode", "userComment");
        }

        //	pc, ph, bulletinDtoLIst, bulletin_boardList, joinCafeList, manager_id, if - mode
        return "cafeMain";

    }


    //	게시글 읽어오는 메서드 - bulletinComment.jsp
    @GetMapping("/read")
    public String read(String bno, String loginId, String manager_id, @ModelAttribute("pc") PageCondition pc, Model m, RedirectAttributes rttr) {

        System.out.println("read - pc = " + pc);

        //  로그인 상태가 아니면
        if (loginId.equals("")) {
            //	url, bno, pc + redirect - loginForm.jsp
            rttr.addAttribute("url", "/bulletin/read");
            rttr.addAttribute("bno", bno);
            rttr.addAttribute("page", pc.getPage());
            rttr.addAttribute("option", pc.getOption());
            rttr.addAttribute("keyword", pc.getKeyword());
            rttr.addAttribute("cafe_name", pc.getCafe_name());
            rttr.addAttribute("bulletin_board", pc.getBulletin_board());
            rttr.addAttribute("manager_id", manager_id);
            return "redirect:/login/login";
        }

        //  로그인 상태 이면

        //	필요 변수 생성
        BulletinDto bulletinDto = null;
        List<String> bulletin_boardList = new ArrayList<>();
        List<String> joinCafeList = new ArrayList<>();

        try {
            //	해당 게시글 읽어오기
            bulletinDto = bulletinService.readBulletin(Integer.valueOf(bno));
            //	현재 카페의 게시판들 가져오기
            bulletin_boardList = bulletinBoardService.readBulletin_board(pc.getCafe_name());
            //	현재 아이디의 가입한 카페들 가져오기
            joinCafeList = joinCafeService.read(loginId);
            System.out.println("joinCafeList = " + joinCafeList);

            //  카페 가입 상태가 아니면
            if (!joinCafeList.contains(pc.getCafe_name())) {
                rttr.addAttribute("cafe_name", pc.getCafe_name());
                rttr.addAttribute("loginId", loginId);
                rttr.addAttribute("manager_id", manager_id);
                rttr.addFlashAttribute("msg", "cafeJoin");
                return "redirect:/bulletin/list";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        //	모델에 저장
        m.addAttribute("bulletinDto", bulletinDto);
        m.addAttribute("bulletin_boardList", bulletin_boardList);
        m.addAttribute("joinCafeList", joinCafeList);
        m.addAttribute("manager_id", manager_id);

        //	pc, bulletinDto, bulletin_boardList, joinCafeList
        return "bulletinComment";
    }


    //	게시글 삭제하는 메서드 - cafeMain.jsp
    @GetMapping("/delete")
    public String delete(Integer bno, String id, String manager_id, @ModelAttribute("pc") PageCondition pc, RedirectAttributes rttr) {

        try {
            //	해당 게시글 삭제하기
            int num = bulletinService.removeBulletin(bno);
            //	삭제 실패하면 예외 발생
            if (num != 1) {
                throw new Exception("게시글 삭제에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        //	pc, loginId, msg(flash) + redirect - cafeMain.jsp
        rttr.addAttribute("page", pc.getPage());
        rttr.addAttribute("option", pc.getOption());
        rttr.addAttribute("keyword", pc.getKeyword());
        rttr.addAttribute("cafe_name", pc.getCafe_name());
        rttr.addAttribute("manager_id", manager_id);
        rttr.addAttribute("loginId", id);
        rttr.addFlashAttribute("msg", "bulletinDLT_OK");

        return "redirect:/bulletin/list";
    }

    //	게시글 쓰기 화면 보여주는 메서드 - bulletinForm.jsp
    @GetMapping("/write")
    public String write(@ModelAttribute("bulletinDto") BulletinDto bulletinDto, @ModelAttribute("pc") PageCondition pc, String manager_id, Model m) {

        List<String> bulletin_boardList = new ArrayList<>();
        List<String> joinCafeList = new ArrayList<>();

        try {
            //	현재 카페의 게시판들 가져오기
            bulletin_boardList = bulletinBoardService.readBulletin_board(pc.getCafe_name());

            //	현재 아이디의 가입한 카페들 가져오기
            joinCafeList = joinCafeService.read(bulletinDto.getId());
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        m.addAttribute("bulletin_boardList", bulletin_boardList);
        m.addAttribute("joinCafeList", joinCafeList);
        m.addAttribute("manager_id", manager_id);

        //	bulletinDto, pc, bulletin_boardList, joinCafeList
        return "bulletinForm";
    }


    //	게시글 등록하는 메서드
    @PostMapping("write")
    public String write(@ModelAttribute("bulletinDto") BulletinDto bulletinDto, RedirectAttributes rttr) {

        //	등록하는 게시글 출력해보기
        System.out.println("bulletinDto = " + bulletinDto);

        if (bulletinDto.getBulletin_board() == null) {
            bulletinDto.setBulletin_board("전체게시판");
        }

        try {
            //	게시글 등록하기
            int num = bulletinService.addBulletin(bulletinDto);

            //	등록 실패하면 예외 발생
            if (num != 1) {
                throw new Exception();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        //	cafe_name, loginId, msg(flash) + redirect - cafeMain.jsp
        rttr.addAttribute("cafe_name", bulletinDto.getCafe_name());
        rttr.addAttribute("loginId", bulletinDto.getId());
        rttr.addFlashAttribute("msg", "bulletinWRT_OK");

        return "redirect:/bulletin/list";
    }

    //	게시글 수정화면 보여주는 메서드 - bulletinForm
    @GetMapping("/modify")
    public String modify(@ModelAttribute("bulletinDto") BulletinDto bulletinDto, @ModelAttribute("pc") PageCondition pc, String manager_id, Model m) {

        List<String> bulletin_boardList = new ArrayList<>();
        List<String> joinCafeList = new ArrayList<>();

        try {
            //	현재 카페의 게시판들 가져오기
            bulletin_boardList = bulletinBoardService.readBulletin_board(pc.getCafe_name());
            //	현재 아이디의 가입한 카페들 가져오기
            joinCafeList = joinCafeService.read(bulletinDto.getId());
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        //	모델에 저장 - 수정 화면 인지 알려주기
        m.addAttribute("mode", "modify");
        m.addAttribute("bulletin_boardList", bulletin_boardList);
        m.addAttribute("joinCafeList", joinCafeList);
        m.addAttribute("manager_id", manager_id);

        //	bulletinDto, pc, mode
        return "bulletinForm";
    }

    //	게시글 수정하는 메서드
    @PostMapping("/modify")
    public String modify(@ModelAttribute("bulletinDto") BulletinDto bulletinDto, @ModelAttribute("pc") PageCondition pc, String manager_id, RedirectAttributes rttr) {

        //	수정하는 게시글 정보 출력해보기
        System.out.println("bulletinDto = " + bulletinDto);

        try {
            //	게시글 수정하기
            int num = bulletinService.updateBulletin(bulletinDto);

            //	수정에 실패하면 예외발생
            if (num != 1) {
                throw new Exception();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        //	bno, pc, msg(flash) + redirect - bulletinForm.jsp
        rttr.addAttribute("bno", bulletinDto.getBno());
        rttr.addAttribute("page", pc.getPage());
        rttr.addAttribute("option", pc.getOption());
        rttr.addAttribute("keyword", pc.getKeyword());
        rttr.addAttribute("cafe_name", pc.getCafe_name());
        rttr.addAttribute("manager_id", manager_id);
        rttr.addFlashAttribute("msg", "bulletinMDF_OK");


        return "redirect:/bulletin/read";
    }
}

