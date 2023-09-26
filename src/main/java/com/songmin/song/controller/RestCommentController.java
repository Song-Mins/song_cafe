package com.songmin.song.controller;

import com.songmin.song.domain.CommentDto;
import com.songmin.song.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class RestCommentController {

    @Autowired
    CommentService commentService;

    //  해당게시물의 모든 댓글 가져오는 메서드
    @GetMapping("/comments")      //   GET  /comments?bno=
    public ResponseEntity<List<CommentDto>> list(Integer bno) {

        List<CommentDto> commentList = null;

        try {
             commentList =  commentService.getList(bno);
             return new ResponseEntity<List<CommentDto>>(commentList, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<CommentDto>>(HttpStatus.BAD_REQUEST);
        }
    }

    //  해당 게시물에 댓글 등록하는 메서드
    @PostMapping("/comments")      //   POST  /comments?bno=
    public ResponseEntity<Integer> write(@RequestBody CommentDto commentDto, Integer bno) {

        commentDto.setBno(bno);

        int num = 0;

        try {
            num = commentService.write(commentDto);

            if (num != 1) {
                throw new Exception();
            }
            return new ResponseEntity<Integer>(num, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
        }
    }

    //  해당 댓글을 삭제하는 메서드
    @DeleteMapping("/comments/{cno}")      //   DELETE  /comments/1?bno=100
    public ResponseEntity<Integer> remove(@PathVariable Integer cno, Integer bno) {

        int num = 0;

        try {
            num = commentService.remove(cno, bno);

            if(num != 1) {
                throw new Exception();
            }

            return new ResponseEntity<Integer>(num, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
        }
    }


    //  해당 댓글을 수정하는 메서드
    @PatchMapping("/comments/{cno}")      //   PATCH  /comments/1
    public ResponseEntity<Integer> modify(@PathVariable Integer cno, @RequestBody CommentDto commentDto, Integer bno) {

        commentDto.setCno(cno);
        commentDto.setBno(bno);

        int num = 0;
        try {
            num = commentService.modify(commentDto);

            if(num != 1) {
                throw new Exception();
            }
            return new ResponseEntity<Integer>(num, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
        }

    }
}
