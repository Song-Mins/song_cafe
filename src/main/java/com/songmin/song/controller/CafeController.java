package com.songmin.song.controller;

import com.songmin.song.domain.*;
import com.songmin.song.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;


@Controller()
@RequestMapping("/cafe")
public class CafeController {

    @Autowired
    CafeService cafeService;

    @Autowired
    UserService userService;

    @Autowired
    BulletinService bulletinService;

    @Autowired
    BulletinBoardService bulletinBoardService;

    @Autowired
    JoinCafeService joinCafeService;

    //	pc(검색조건)에 해당하는 카페 가져오는 메서드
    @GetMapping("/list")
    public String home(@ModelAttribute("pc") PageCondition pc, String mode, HttpServletRequest request, Model m) {

        //  pc(검색조건) 출력해보기
        System.out.println("||------------------------------------------");
        System.out.println("pc = " + pc);
        System.out.println("------------------------------------------||");

        //  필요 변수 생성
        List<String> joinCafeList = new ArrayList<>();
        List<CafeDto> cafeDtoList = new ArrayList<>();
        int totalCnt = 0;
        PageHandler ph = null;
        UserDto userDto = null;
        Properties properties1 = new Properties();
        Properties properties2 = new Properties();
        Properties properties3 = new Properties();

        //  로그인 아이디 저장
        String id = "";
        HttpSession session = request.getSession(false);
        if (session != null) {
            id = (String) session.getAttribute("id");
        }

        try {
            //  검색 모드 일때
            if (!"".equals(pc.getKeyword())) {
                System.out.println("-------------- keyword --------------");
            }

            //  지역 모드 일때
            else if ("region".equals(mode)) {
                System.out.println("-------------- region --------------");

                // region1이 ""이면 "서울"로 초기화
                if ("".equals(pc.getRegion1())) {
                    pc.setRegion1("서울");
                }

                //  region2가 ""이면 "전체"로 초기화
                if ("".equals(pc.getRegion2())) {
                    pc.setRegion2("전체");
                }

                //	모든 region1 정보 가져오기
                List<String> allRegion1 = new ArrayList<>();
                properties1.load(new FileReader("C:\\Users\\ssoog\\IdeaProjects\\song\\src\\main\\resources\\region1.properties"));

                for (Object region : properties1.values()) {
                    allRegion1.add((String) region);
                }

                //	모든 region2 정보 가져오기
                properties2.load(new FileReader("C:\\Users\\ssoog\\IdeaProjects\\song\\src\\main\\resources\\region2.properties"));
                String region2 = properties2.getProperty(pc.getRegion1());
                List<String> allRegion2 = new ArrayList<>(Arrays.asList(region2.split(",")));
                allRegion2.add(0, "전체");

                //	모델에 저장
                m.addAttribute("allRegion1", allRegion1);
                m.addAttribute("allRegion2", allRegion2);


            }

            //  랭크 모드일때
            else if ("rank".equals(mode)) {
                System.out.println("-------------- rank --------------");
            }

            //  주제 모드일때
            else if ("topic".equals(mode) || id == "") {
                System.out.println("-------------- topic --------------");

                //  topic이 ""이면 "게임"으로 초기화
                if ("".equals(pc.getTopic())) {
                    pc.setTopic("게임");
                }

                //  모든 topic 정보 가져오기
                List<String> allTopic = new ArrayList<>();
                properties3.load(new FileReader("C:\\Users\\ssoog\\IdeaProjects\\song\\src\\main\\resources\\topic.properties"));
                for (Object topic : properties3.values()) {
                    allTopic.add((String) topic);
                }

                //	모델에 저장
                m.addAttribute("allTopic", allTopic);
            }

            //  내카페 모드일때 - 다시 구현하기
            else if (id != "") {
                System.out.println("--------------id - cafeHome--------------");

                userDto = userService.get(id);
                joinCafeList = userDto.getJoin_cafe();
                System.out.println("cafeNameList = " + joinCafeList);
                pc.setJoinCafeList(joinCafeList);
            }

            //	pc(검색 조건)에 해당하는 카페 + 총 카페수 가져오기
            cafeDtoList = cafeService.getPageConditionBoard(pc);
            totalCnt = cafeService.count(pc);
            //  ph(전체 페이지 관리) 생성
            ph = new PageHandler(pc, totalCnt);

        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        //	모델에 저장
        m.addAttribute("cafeDtoList", cafeDtoList);
        m.addAttribute("totalCnt", totalCnt);
        m.addAttribute("ph", ph);
        m.addAttribute("mode", mode);

        //	cafeDtoList, ph, pc
        return "cafeHome";
    }

    //  카페 생성 화면 보여주는 메서드
    @GetMapping("/write")
    public String write(@ModelAttribute("cafeDto") CafeDto cafeDto, Model m) {

        List<String> allTopic = new ArrayList<>();
        List<String> allRegion1 = new ArrayList<>();


        try {

            Properties properties1 = new Properties();
            properties1.load(new FileReader("C:\\Users\\ssoog\\IdeaProjects\\song\\src\\main\\resources\\topic.properties"));

            for (Object topic : properties1.values()) {
                allTopic.add((String) topic);
            }


            Properties properties2 = new Properties();
            properties2.load(new FileReader("C:\\Users\\ssoog\\IdeaProjects\\song\\src\\main\\resources\\region1.properties"));

            for (Object region : properties2.values()) {
                allRegion1.add((String) region);
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        m.addAttribute("allTopic", allTopic);
        m.addAttribute("allRegion1", allRegion1);

        //	cafeDto, allTopic
        return "cafeForm";
    }

    //  카페 생성하는 메서드
    @PostMapping("/write")
    public String write(@ModelAttribute("cafeDto") CafeDto cafeDto, RedirectAttributes rttr) {

        try {
            //  카페 생성하기 - 실패하면 예외 발생
            if (cafeService.add(cafeDto) != 1) {
                throw new Exception();
            }
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg", "cafeWRT_ERR");
            return "redirect:/cafe/write";
        }

        //	cafe_name, manager_id, loginId, msg + redirect - cafeMain.jsp
        rttr.addAttribute("cafe_name", cafeDto.getName());
        rttr.addAttribute("manager_id", cafeDto.getManager_id());
        rttr.addAttribute("loginId", cafeDto.getManager_id());
        rttr.addFlashAttribute("msg", "cafeWRT_OK");
        return "redirect:/bulletin/list";

    }

    @GetMapping("/read")
    public String read(String cafe_name, String loginId, String manager_id, HttpServletRequest request, Model m, RedirectAttributes rttr) {

        //  로그인 상태가 아니면
        if (loginId.equals("")) {
            rttr.addAttribute("url", "/cafe/read");
            rttr.addAttribute("cafe_name", cafe_name);

            return "redirect:/login/login";
        }

        //  로그인 상태 이면
        CafeDto cafeDto = null;
        List<String> bulletin_boardList = new ArrayList<>();
        List<String> joinCafeList = new ArrayList<>();

        try {
            //	현재 아이디의 가입한 카페들 가져오기
            joinCafeList = joinCafeService.read(loginId);
            System.out.println("joinCafeList = " + joinCafeList);

            //  카페 가입 상태가 아니면
            if (!joinCafeList.contains(cafe_name)) {
                rttr.addAttribute("cafe_name", cafe_name);
                rttr.addAttribute("loginId", loginId);
                rttr.addAttribute("manager_id", manager_id);
                rttr.addFlashAttribute("msg", "cafeJoin");
                return "redirect:/bulletin/list";
            }

            cafeDto = cafeService.read(cafe_name);

            //	현재 카페의 게시판들 가져오기
            bulletin_boardList = bulletinBoardService.readBulletin_board(cafe_name);
            //	현재 아이디의 가입한 카페들 가져오기
            joinCafeList = joinCafeService.read(loginId);
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }



        //  모델에 저장
        m.addAttribute("cafeDto", cafeDto);
        m.addAttribute("bulletin_boardList", bulletin_boardList);
        m.addAttribute("joinCafeList", joinCafeList);

        //	cafeDto
        return "cafeInfo";
    }

    @GetMapping("/join")
    public String manage(JoinCafeDto joinCafeDto, String manager_id, RedirectAttributes rttr) {
        try {
            joinCafeService.add(joinCafeDto);
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        rttr.addAttribute("loginId", joinCafeDto.getId());
        rttr.addAttribute("cafe_name", joinCafeDto.getJoin_cafe());
        rttr.addAttribute("manager_id", manager_id);
        rttr.addFlashAttribute("msg", "cafeJOIN_OK");
        return "redirect:/bulletin/list";
    }

    @GetMapping("/delete")
    public String delete(String readId, String cafe_name, String loginId, String manager_id, RedirectAttributes rttr) {

        JoinCafeDto joinCafeDto = new JoinCafeDto();
        joinCafeDto.setId(readId);
        joinCafeDto.setJoin_cafe(cafe_name);

        try {
            int num = joinCafeService.remove(joinCafeDto);
            if (num != 1) {
                throw new Exception();
            }
        } catch (Exception e) {
            return "error";
        }

        rttr.addAttribute("cafe_name", cafe_name);
        rttr.addAttribute("loginId", loginId);
        rttr.addAttribute("manager_id", manager_id);
        rttr.addFlashAttribute("msg", "userDLT_OK");

        return "redirect:/bulletin/list";
    }

}
