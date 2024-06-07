#  [ Project ] MZym
<img src="https://github.com/leeyechanbal/MZym/assets/153481748/650fecd3-8730-4ef6-872d-4e1984a01f4b" height="250px" width="500px" >

***

## :sparkles: [ Summary ]
> - 헬스장 사용 회원들이 꾸준히 다닐 수 있도록 다양한 서비스를 제공하는 플랫폼
> - 헬스장의 정보 제공 과 회원들간의 정보 공유가 가능한 커뮤니티 제공
> - 온라인 상담 및 회원권 결제 서비스 제공 


## :date: [ Develop Date ]
> <p>$\large{2024.02.15\ ~ \ 2024.03.28}$</p>


## 🧑🏻‍💻 [ Contribute ]
> - <p>$\bf{\color{#5882FA} 이예찬 : \ 트레이너페이지 -\  공지사항, \ 상담예약, \ 신고}$</p>
> - 김민정 : 트레이너페이지 - 고객센터, 인바디, PT일정
> - 구성모 : 대표페이지 -  로그인, 제품관리, 트레이너 프로필 관리
> - 엄희강 : 메인페이지 - 위치조회 페이지, 고객센터
> - 손수현 : 마이페이지 - 식단관리, 영상페이지
> - 황수림 : 자유게시판 - 질문게시판, 운동모임게시판, 후기게시판


## :four_leaf_clover: [ Stack ]
<div>
  <img src="https://img.shields.io/badge/html5-E34F26?logo=html5&logoColor=white" height="30px"> &nbsp;
  <img src="https://img.shields.io/badge/css3-1572B6?logo=css3&logoColor=white" height="30px"> &nbsp;
  <img src="https://img.shields.io/badge/javascript-F7DF1E?logo=javascript&logoColor=black" height="30px"> &nbsp;
  <img src="https://img.shields.io/badge/jquery-0769AD?logo=jquery&logoColor=white" height="30px"> <br><br> 
  <img src="https://img.shields.io/badge/visualstudiocode-007ACC?logo=visualstudiocode&logoColor=white" height="30px"> &nbsp;
  <img src="https://img.shields.io/badge/eclipseide-2C2255?logo=eclipseide&logoColor=white" height="30px"> &nbsp;
  <img src="https://img.shields.io/badge/java11-007396?logo=java&logoColor=white" height="30px"> &nbsp;
  <img src="https://img.shields.io/badge/oracle-F80000?logo=visualstudiocode&logoColor=white" height="30px"> <br><br> 
  <img src="https://img.shields.io/badge/github-181717?logo=github&logoColor=white" height="30px"> &nbsp;
  <img src="https://img.shields.io/badge/apachetomcat-F8DC75?logo=apachetomcat&logoColor=black" height="30px"> 
</div>

***

## :whale2: 화면 구현

###  ① [ 공지사항 ]
 - 공지사항 등록
	- 제목, 내용, 첨부파일을 등록할 수 있습니다.
 - 공지사항 수정
   	- 부트스트랩의 collapse을 활용해서 공지사항 조회와 수정이 같은 페이지에서 가능합니다.
	- 수정시 새로운 첨부파일을 등록하면 기존 첨부파일이 삭제 되고 새로운 첨부파일로 대체 됩니다.
 - 공지사항 삭제
  	- 원하는 게시글을 클릭하고 삭제 버튼 클릭시 게시글 삭제 가능 합니다.
   	- 모달창에 글번호를 입력 해서 삭제도 가능합니다.


#### { 등록 }
<img src="https://github.com/leeyechanbal/MZym/assets/153481748/3f04302d-4226-4879-a21c-7e40db64307d"  width="80%"/>

#### { 수정 }
<img src="https://github.com/le글 ]

while(rset.next()) {
  ...

  boolean ch = (count < 2 ) ? true : (list.get(count-1).getReportNo() ==  list.get(count).getReportNo());
  
  if(ch) {
    atList.add(
        new Attachment(
          rset.getString("ORIGIN_NAME")
          , rset.getString("CHANGE_NAME")
          , rset.getString("FILE_PATH")
          , rset.getInt("FILE_LEVEL") )
        );
  } else {
    atList = new ArrayList<Attachment>();
    
    list.get(count).getBoard().setAtList(atList);
    
    atList.add(new Attachment(
            rset.getString("ORIGIN_NAME")
            , rset.getString("CHANGE_NAME")
            , rset.getString("FILE_PATH")
            , rset.getInt("FILE_LEVEL") )
        );
  }
  ...

```
***

## [ retrospect ]
사용자 요구사항 부터 Readme파일 작성까지 모든 작업들이 처음이라서 생각보다 
다양한 곳들에서 시간들을 많이 사용하게 된 것 같습니다.
특히 기능이나 코드를 깔끔하게 작성하고 주석문을 달면서 작업하다보니
기능구현에 신경을 많이 써 팀원들과 소통이나 테스트 부분에서 아쉬움이 남았던 프로젝트 였습니다.




