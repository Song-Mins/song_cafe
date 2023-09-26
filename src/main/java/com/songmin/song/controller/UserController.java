package com.songmin.song.controller;

import com.songmin.song.domain.PageCondition;
import com.songmin.song.domain.UserDto;
import com.songmin.song.service.BulletinService;
import com.songmin.song.service.CommentService;
import com.songmin.song.service.JoinCafeService;
import com.songmin.song.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    BulletinService bulletinService;
    @Autowired
    CommentService commentService;
    @Autowired
    JoinCafeService joinCafeService;


    //  사용자 정보 보여주는 메서드
    //  cafeMain.jsp 사용자 클릭       or      bulletinComment.jsp 사용자 클릭
    @GetMapping("/show")
    public String show(@ModelAttribute("pc") PageCondition pc, String loginId, String manager_id, Model m, RedirectAttributes rttr) {


        //  로그인 상태가 아니면
        if (loginId.equals("")) {
            //  readId, url, cafe_name + 요청 - loginForm.jsp
            rttr.addAttribute("url", "/user/show");
            rttr.addAttribute("readId", pc.getReadId());
            rttr.addAttribute("cafe_name", pc.getCafe_name());
            rttr.addAttribute("manager_id", manager_id);

            return "redirect:/login/login";
        }

        //  회원정보 저장할 변수 생성
        List<UserDto> userDtoList = null;
        UserDto readUserDto = null;
        List<String> joinCafeList = new ArrayList<>();

        try {
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

            //  회원정보 가져오기
            readUserDto = userService.get(pc.getReadId());
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        rttr.addAttribute("readId", readUserDto.getId());
        rttr.addAttribute("cafe_name", pc.getCafe_name());
        rttr.addAttribute("loginId", loginId);
        rttr.addAttribute("manager_id", manager_id);

        return "redirect:/bulletin/list";

    }
}
