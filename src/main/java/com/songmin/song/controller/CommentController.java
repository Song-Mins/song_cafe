package com.songmin.song.controller;

import com.songmin.song.domain.CommentDto;
import com.songmin.song.domain.PageCondition;
import com.songmin.song.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    CommentService commentService;

    //  주어진 아이디
    @GetMapping("/list")
    public String list(@ModelAttribute("pc") PageCondition pc, String loginId, String manager_id, RedirectAttributes redirectAttributes) {

        System.out.println("CommentControllerPc = " + pc);

        //  조건에 맞는 댓글들을 저장할, 이 댓글들의 게시글 번호를 저장할 변수 생성
        List<CommentDto> commentDtoList = null;
        List<Integer> commentBnoList = new ArrayList<>();

        CommentDto commentDto = new CommentDto();
        commentDto.setId(pc.getReadId());
        commentDto.setCafe_name(pc.getCafe_name());


        try {
            //  작성자가 쓴 댓글들을 가져옴
            commentDtoList = commentService.getIdComments(commentDto);
            System.out.println("commentDtoList = " + commentDtoList);

            //  댓글들의 게시글 번호를 변수에 저장
            for (CommentDto comment : commentDtoList) {
                commentBnoList.add(comment.getBno());
            }

            //  게시글 번호의 중복 제거
            HashSet<Integer> hs = new HashSet<>(commentBnoList);
            commentBnoList.clear();
            commentBnoList.addAll(hs);

            System.out.println("commentBnoList = " + commentBnoList);

        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        //  page, readId, commentBnoList, cafe_name + 요청 - cafeMain.jsp
        redirectAttributes.addAttribute("page", pc.getPage());
        redirectAttributes.addAttribute("readId", pc.getReadId());
        redirectAttributes.addAttribute("commentBnoList", commentBnoList);
        redirectAttributes.addAttribute("cafe_name", pc.getCafe_name());
        redirectAttributes.addAttribute("loginId", loginId);
        redirectAttributes.addAttribute("manager_id", manager_id);

        return "redirect:/bulletin/list";
    }
}
