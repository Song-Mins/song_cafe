## 💡 프로젝트 주제 
- "song" 포털 사이트의 **카페** 서비스  
<br/>

## 💡 프로젝트 소개
- "song" 이라는 가상의 포털 사이트가 제공하는 **카페** 서비스
- **카페**에 관한 여러기능들을 제공
<br/>
 
## 💡 프로젝트 시연
### 회원가입 화면
- 회원 가입
  - 아이디, 비밀번호, 이름, 생년월일, 이메일, 전화번호가 형식에 맞지 않으면 가입 실패
  - 이미 가입된 아이디면 가입 실패   
  ![ezgif com-video-to-gif](https://github.com/Song-Mins/song_cafe/assets/130220205/3e1427a2-5684-4a51-9f5a-b6653cb6d720)

### 카페홈 화면
- 상단 메뉴바
  - 주제별, 지역별, 카페 랭킹, 내가 가입한 카페(로그인 상태)   
  ![ezgif com-video-to-gif (1)](https://github.com/Song-Mins/song_cafe/assets/130220205/ad59e59c-4407-4845-becd-6402ffbf341b)

- 카페 검색   
  ![ezgif com-video-to-gif (2)](https://github.com/Song-Mins/song_cafe/assets/130220205/b3357067-38bd-4e4b-a163-0991903339ee)

- 카페 생성
  - (로그인 상태) 일때만 카페 생성 버튼이 보임
  - (로그인 상태) 가 아니면 로그인 버튼이 보임   
  ![ezgif com-video-to-gif (3)](https://github.com/Song-Mins/song_cafe/assets/130220205/984a35e5-2269-410e-aff0-b6660306a926)

### 카페메인 화면
- 카페 가입
  - (로그인 상태 + 카페 미가입 상태) 일때만 카페 가입 버튼이 보임
  - (로그인 상태 + 카페 가입 상태) 이면 카페의 다양한 기능들이 보임
  - (로그인 상태) 가 아니면 로그인 버튼이 보임   
  ![ezgif com-video-to-gif (7)](https://github.com/Song-Mins/song_cafe/assets/130220205/d1d03906-5da0-431c-bfdc-297ec364e389)

- 게시글 쓰기
  - (로그인 상태 + 카페 가입 상태) 일때만 보임    
  ![ezgif com-video-to-gif (8)](https://github.com/Song-Mins/song_cafe/assets/130220205/1b1d751c-f610-4e3d-bf7d-92f9d3953ea1)

  
- 내가 작성한 글, 댓글쓴 글
  - (로그인 상태 + 카페 가입 상태) 일때만 보임   
  https://github.com/Song-Mins/song_cafe/assets/130220205/3837e333-c6ac-4f49-bd63-a4de615a4fff



- 사용자가 작성한 글, 댓글쓴 글
  - (로그인 상태 + 카페 가입 상태) 일때만 가능
  - 로그인 상태가 아니면 로그인 화면으로 이동, 로그인 성공 후 원래 보려던 화면으로 이동
  - 카페 가입 상태가 아니면 카페 가입 해라는 알림

- 게시글 보기
  - (로그인 상태 + 카페 가입 상태) 일때만 보임
  - 로그인 상태가 아니면 로그인 화면으로 이동, 로그인 성공 후 원래 보려던 화면으로 이동
  - 카페 가입 상태가 아니면 카페 가입 해라는 알림
    
- 카페 정보
  
- 게시글 검색
https://github.com/Song-Mins/song_cafe/assets/130220205/93f3ea00-98d3-4127-bf99-e199e5ddca23

- 게시판 생성
  - 카페 관리자 일때만 보임
  - 게시판 생성후 해당 게시판으로 이동
    
- 모든 게시글 삭제
  - 카페 관리자 일때만 보임

- 회원 강퇴
  - 카페 관리자 일때만 보임



### 게시글 화면
- 게시글 수정, 삭제
  - 자기가 쓴 게시글 일때만 보임   
  ![ezgif com-video-to-gif (9)](https://github.com/Song-Mins/song_cafe/assets/130220205/80508744-ecb1-470d-937b-fba842a7a8b9)

    
- 목록 버튼
  - 게시글을 보기전 카페 메인 화면으로 이동
  - 검색 필터, 페이지 상태 유지

- 댓글 + 답글 쓰기, 수정, 삭제
  - 자기가 쓴 댓글 + 답글 일때만 수정, 삭제 버튼   
  ![ezgif com-video-to-gif (10)](https://github.com/Song-Mins/song_cafe/assets/130220205/cb38e915-6791-445d-a013-a2935a5472fb)

  


### 로그인 화면
- 로그인
  - 아이디 기억 체크시 다음 로그인때 아이디 기억
  - 로그인 성공후 로그인 화면을 요청한 곳으로 이동      
  ![ezgif com-video-to-gif (6)](https://github.com/Song-Mins/song_cafe/assets/130220205/bbb8a078-308c-4d08-b85f-fa7256557005)

    
### 아이디, 비밀번호 찾기 화면
- 아이디 찾기
  - 값을 입력하지 않으면 입력해라는 알림
  - 입력한 정보와 일치하는 회원 없으면 일치하는 정보 없다는 알림    
  ![ezgif com-video-to-gif (4)](https://github.com/Song-Mins/song_cafe/assets/130220205/29044bc8-0531-4fd0-9f13-8ceaa83f3700)

- 비밀번호 찾기
  - 값을 입력하지 않으면 입력해라는 알림
  - 입력한 정보와 일치하는 회원 없으면 일치하는 정보 없다는 알림   
  ![ezgif com-video-to-gif (5)](https://github.com/Song-Mins/song_cafe/assets/130220205/a750afc7-6b2e-4f35-a01c-05fbc5fed106)

