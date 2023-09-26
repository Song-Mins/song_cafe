package com.songmin.song.controller;


import com.songmin.song.domain.BulletinBoardDto;
import com.songmin.song.service.BulletinBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/bulletinBoard")
public class BulletinBoardController {

    @Autowired
    BulletinBoardService bulletinBoardService;

    @PostMapping("/add")
    public String add(BulletinBoardDto bulletinBoardDto, String manager_id, String loginId, RedirectAttributes rttr) {

        System.out.println("bulletinBoardDto = " + bulletinBoardDto);

        String name = bulletinBoardDto.getName();
        name =  name.trim() + " 게시판";
        bulletinBoardDto.setName(name);

        System.out.println("bulletinBoardDto = " + bulletinBoardDto);


        int num = 0;

        try {
            num = bulletinBoardService.addBulletinBoard(bulletinBoardDto);

            if (num != 1) {
                throw new Exception();
            }
        } catch (Exception e) {
            rttr.addAttribute("cafe_name", bulletinBoardDto.getCafe_name());
            rttr.addAttribute("manager_id", manager_id);
            rttr.addAttribute("loginId", loginId);
            if (num == 10) {
                rttr.addFlashAttribute("msg", "bulletin_boardADD_ERR");
            } else {
                rttr.addFlashAttribute("msg", "bulletin_boardWRT_ERR");
            }
            return "redirect:/bulletin/list";
        }

        rttr.addAttribute("cafe_name", bulletinBoardDto.getCafe_name());
        rttr.addAttribute("bulletin_board", bulletinBoardDto.getName());
        rttr.addAttribute("manager_id", manager_id);
        rttr.addAttribute("loginId", loginId);

        return "redirect:/bulletin/list";
    }
}
