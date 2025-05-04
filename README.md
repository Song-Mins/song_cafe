![home](https://github.com/Song-Mins/song_cafe/assets/130220205/bf65646c-b499-45b0-b164-d935a18c5f72)

## 💡 프로젝트 소개
- "song" 이라는 가상의 포털 사이트가 제공하는 카페 서비스
- 카페에 관한 여러기능들을 제공
  <br/>

## 💡 사용 기술
- Spring Framework, MyBatis, JSP, MySQL
- JSP 페이지에서 사용되는 HTML, CSS 코드는 외부 템플릿 없이 모두 직접 작성하였음
  <br/>
  <br/>
  <br/>

## 💡 실제 화면
### 회원가입 화면
- 회원 가입
    - 아이디, 비밀번호, 이름, 생년월일, 이메일, 전화번호가 형식에 맞지 않으면 가입 실패
    - 이미 가입된 아이디면 가입 실패
    - 회원 가입 후 "song" 포털 사이트로 이동      
      ![ezgif com-video-to-gif](https://github.com/Song-Mins/song_cafe/assets/130220205/3e1427a2-5684-4a51-9f5a-b6653cb6d720)

#

### 카페홈 화면
- 상단 메뉴바
    - 주제별 카페, 지역별 카페, 카페 랭킹, 내가 가입한 카페(로그인 상태 일때만)   
      ![ezgif com-video-to-gif (1)](https://github.com/Song-Mins/song_cafe/assets/130220205/ad59e59c-4407-4845-becd-6402ffbf341b)

####

- 카페 검색
    -  카페명으로 카페 검색   
       ![ezgif com-video-to-gif (2)](https://github.com/Song-Mins/song_cafe/assets/130220205/b3357067-38bd-4e4b-a163-0991903339ee)

####

- 카페 생성
    - (로그인 상태) 일때만 카페 생성 버튼이 보임
    - (로그인 상태) 가 아니면 로그인 버튼이 보임
    - 카페 생성 후 생성한 카페의 메인 화면으로 이동    
      ![ezgif com-video-to-gif (3)](https://github.com/Song-Mins/song_cafe/assets/130220205/984a35e5-2269-410e-aff0-b6660306a926)

#

### 카페메인 화면
- 카페 가입
    - (로그인 상태 + 카페 미가입 상태) 일때만 카페 가입 버튼이 보임
    - (로그인 상태 + 카페 가입 상태) 이면 카페의 다양한 기능들이 보임
    - (로그인 상태) 가 아니면 로그인 버튼이 보임
    - 카페 가입 후 가입한 카페의 메인 화면으로 이동       
      ![ezgif com-video-to-gif (7)](https://github.com/Song-Mins/song_cafe/assets/130220205/d1d03906-5da0-431c-bfdc-297ec364e389)

####

- 게시글 쓰기
    - (로그인 상태 + 카페 가입 상태) 일때만 보임
    - 게시글 작성 후 카페 메인 화면의 1페이지로 이동        
      ![ezgif com-video-to-gif (8)](https://github.com/Song-Mins/song_cafe/assets/130220205/1b1d751c-f610-4e3d-bf7d-92f9d3953ea1)

####

- 내가 작성한 글, 댓글쓴 글
    - (로그인 상태 + 카페 가입 상태) 일때만 보임    
      ![ezgif com-video-to-gif (11)](https://github.com/Song-Mins/song_cafe/assets/130220205/90fdbc80-7fd7-4ad2-860a-1afc0ed4bb48)

####

- 사용자가 작성한 글, 댓글쓴 글
    - (로그인 상태 + 카페 가입 상태) 일때만 가능
    - 로그인 상태가 아니면 로그인 화면으로 이동, 로그인 성공 후 카페 가입 상태 이면 원래 보려던 화면으로 이동
    - 카페 가입 상태가 아니면 카페 가입 해라는 알림   
      ![ezgif com-video-to-gif (19)](https://github.com/Song-Mins/song_cafe/assets/130220205/cacbe8de-aa08-47a2-9737-be12817d7548)

####

- 게시글 읽기
    - (로그인 상태 + 카페 가입 상태) 일때만 가능
    - 로그인 상태가 아니면 로그인 화면으로 이동, 로그인 성공 후 카페 가입 상태 이면 원래 보려던 화면으로 이동
    - 카페 가입 상태가 아니면 카페 가입 해라는 알림
    - 게시글 읽은 후 게시글 조회수 1 증가      
      ![ezgif com-video-to-gif (17)](https://github.com/Song-Mins/song_cafe/assets/130220205/607142e7-6ea6-49c0-b680-574c8aa2ccf1)

####

- 카페 정보
    - (로그인 상태 + 카페 가입 상태) 일때만 가능
    - 로그인 상태가 아니면 로그인 화면으로 이동, 로그인 성공 후 카페 가입 상태 이면 원래 보려던 화면으로 이동
    - 카페 가입 상태가 아니면 카페 가입 해라는 알림   
      ![ezgif com-video-to-gif (18)](https://github.com/Song-Mins/song_cafe/assets/130220205/bcb24ec7-9f3d-4040-b9fc-18140ac65842)

####

- 게시글 검색
    - 게시판 종류 + 제목 + 내용 으로 게시글 검색    
      ![ezgif com-video-to-gif (13)](https://github.com/Song-Mins/song_cafe/assets/130220205/7c42de80-d31b-4a9e-8fa3-5b874217acdb)

####

- 게시판 생성
    - 카페 관리자 일때만 보임
    - 게시판 생성후 해당 게시판으로 이동    
      ![ezgif com-video-to-gif (16)](https://github.com/Song-Mins/song_cafe/assets/130220205/b14e91b4-16a0-42a7-bf12-3626a2d0000d)

####

- 모든 게시글 삭제 권환
    - 카페 관리자 일때만 보임    
      ![ezgif com-video-to-gif (12)](https://github.com/Song-Mins/song_cafe/assets/130220205/8da9c4b6-a15e-4f7e-8998-7c1a839485ac)

####

- 회원 강퇴
    - 카페 관리자 일때만 보임
    - 사용자가 카페에서 작성한 글 + 댓글 모두 삭제    
      ![ezgif com-video-to-gif (14)](https://github.com/Song-Mins/song_cafe/assets/130220205/6c55d264-0a73-4d27-9e09-a52423e4c393)

#

### 게시글 화면
- 게시글 수정, 삭제
    - 자기가 쓴 게시글 일때만 보임
    - 게시글 삭제 후 카페 메인 화면의 1페이지로 이동    
      ![ezgif com-video-to-gif (9)](https://github.com/Song-Mins/song_cafe/assets/130220205/80508744-ecb1-470d-937b-fba842a7a8b9)

####

- 목록 버튼
    - 목록 버튼 클릭시 게시글을 보기전 카페 메인 화면으로 이동
    - 게시글 검색 필터 + 페이지 상태 유지   
      ![ezgif com-video-to-gif (15)](https://github.com/Song-Mins/song_cafe/assets/130220205/638d1a0c-5e96-4c01-b41d-ef37cd15e6c4)

####

- 댓글 + 답글 쓰기, 수정, 삭제
    - 자기가 쓴 댓글 + 답글 일때만 수정, 삭제 버튼 보임
    - 댓글 작성 후 게시글 댓글 수 1 증가    
      ![ezgif com-video-to-gif (10)](https://github.com/Song-Mins/song_cafe/assets/130220205/cb38e915-6791-445d-a013-a2935a5472fb)

#

### 로그인 화면
- 로그인
    - 아이디 기억 체크시 다음 로그인때 아이디 자동 입력
    - 로그인 성공후 로그인 화면을 요청한 곳으로 이동      
      ![ezgif com-video-to-gif (6)](https://github.com/Song-Mins/song_cafe/assets/130220205/bbb8a078-308c-4d08-b85f-fa7256557005)

#

### 아이디, 비밀번호 찾기 화면
- 아이디 찾기
    - 입력한 정보와 일치하는 회원 없으면 일치하는 정보 없다는 알림    
      ![ezgif com-video-to-gif (4)](https://github.com/Song-Mins/song_cafe/assets/130220205/29044bc8-0531-4fd0-9f13-8ceaa83f3700)

####

- 비밀번호 찾기
    - 입력한 정보와 일치하는 회원 없으면 일치하는 정보 없다는 알림   
      ![ezgif com-video-to-gif (5)](https://github.com/Song-Mins/song_cafe/assets/130220205/a750afc7-6b2e-4f35-a01c-05fbc5fed106)
