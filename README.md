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
  <img src="https://img.shields.io/badge/java11-007396?logo=OpenJDK&logoColor=white" height="30px"> &nbsp;
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
<img src="https://github.com/leeyechanbal/MZym/assets/153481748/e5135167-e5c4-497f-a37a-a736f8333faa"  width="80%"/>


#### { 삭제 }
<img src="https://github.com/leeyechanbal/MZym/assets/153481748/2810b4ef-eff0-4fff-803b-a3afd4430195"  width="80%"/>

### ② [ 상담예약 ]
- 상담신청이 들어온 글은 상담 대기쪽 테이블에서 조회 됩니다.
- 전화 상담이 완료되면 보고서를 통해 상담내용을 작성하고 작성 버튼 클릭 시 상담 완료 테이블로 이동 됩니다.
- 작성이 완료된 보고서는 작성한 관리자만 수정이 가능합니다.
<img src="https://github.com/leeyechanbal/MZym/assets/153481748/d346c19b-f9fa-4acb-853e-586baad7a307"  width="80%"/>

### ③ [ 신고 ]
 - 신고 처리된 각 게시글을 종류를 선택해서 조회가 가능합니다.
 - 보고서를 작성시 후 확인시 신고 완료쪽 페이지로 이동 합니다.
 - 철회 버튼 클릭시 신고된 게시글은 철회 됩니다.
 - PT후기글인 경우 부트스트랩의 Carousel을 통해 신고된 사진 확인이 가능합니다.
<img src="https://github.com/leeyechanbal/MZym/assets/153481748/a0e04949-7314-46a0-98e0-86466897427a"  width="80%"/>

### ④ [ 단축키 ]
 - 키보드로 숫자 입력시 입력 받은 값을 이용해서 해당 위치의 공지사항 상세정보가 보여집니다.
 - input, textarea에서 숫자 입력에도 작동되는 것을 방지하기 위해
   페이지 내에 textarea와 input 요소를 찾아 조건문에 false가 들어가도록 구현 했습니다.
 - keydown을 통해서 해당하는 위치의 다음요소에 있는 상세 정보를 보여주기 위해서 show라는 클래스를 [ 부트스트랩에서 사용되는 클래스 ]
   삭제 및 추가 함으로 작동하게 구현 했습니다.
 <br/>
 <img src="https://github.com/leeyechanbal/MZym/assets/153481748/331521ba-4ed5-41a2-af58-389b1ec420d1"  width="80%"/>

```
	<script>
	    const te = document.querySelectorAll("textarea");
	    $(document).keydown(function(e){
		    const val = e.key;
		    let check = true;
		    for (let i =0; i < te.length; i++){
			if((te[i] === document.activeElement)){
			    check = false; }
		    }
		    if(check){
			let $t = null;
			if(val != 0){
			    $t = $("#boardcontent tr").eq(Number(val) * 2);   
			} else if (val == 0){
			    $t = $("#boardcontent tr").eq(20);
			}
			$t.css('border', '3px solid #1abc9cc7');
			    $t.addClass('show');
			    $t.siblings().css('border', '0');
			    $t.siblings('.show').removeClass('show'); }
	    }) 
	    })
	</script>
```

### ① - 수정 [ 첨부파일 ]
 첨부 파일에서 받은 Object타입의 객체를 instanceof을 이용해서 객체를 확인  
 필요한 데이터를 String 변수를 활용하여 동적으로 쿼리를 작성하여 DB에 전달 및 데이터를 저장 하고 있습니다.
 
```
	public int insertAttachment(Connection conn, Object obj) {
		PreparedStatement pst = null;
		int result = 0;
		
		String type = null;
		String seq = null;
		Attachment att = null;
		
		
		if (obj instanceof Notice) {
			type = "N";
			seq = "SEQ_NOTICENO.currval";
			att = ((Notice) obj).getAtt();
		} else if(obj instanceof Board){
			type = "B";
			seq = "SEQ_BOARDNO.currval";
			att = ((Board) obj).getAtt();
		} else if(obj instanceof Advice) {
			type = "A";
			seq = "SEQ_ADVICENO.currval";
			att = ((Advice) obj).getAtt();
		}
		
    String sql = "insert into attachment ("
            + "FILE_NO, ATT_NO, ATT_CATEGORY, ORIGIN_NAME, "
            + "CHANGE_NAME, FILE_PATH, UPLORD_DATE, FILE_LEVEL, STATUS"
            + ") values ("
            + "SEQ_ATTACHMENT.nextval, " + seq + ", ?, ?, ?, ?, sysdate, ?, DEFAULT)";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, type);
			pst.setString(2, att.getOriginName());
			pst.setString(3, att.getChangeName());
			pst.setString(4, att.getFilePath());
			
			
	        if (att.getFileLevel() != null) {
	            pst.setInt(5, att.getFileLevel());
	        } else {
	            pst.setNull(5, java.sql.Types.NULL);
	            //자바에서 null값을 쿼리문에 전달하는 방법
	        }
			
			
			result = pst.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pst);
		}
		return result;
	}
```

### ③ -조회 [ 신고 게시판 불러 오기 ]
 - Mybatis를 사용하지 않고 신고된 게시글에 1~4개의 첨부파일을 하나의 게시글에 조회 하고 있습니다.
   Result.next()로 신고된 게기글의 정보를 조회 시 이전 신고 번호와 현재 신고 번호를 삼항 연산자로 비교하여
   true이면 기존 첨부파일의 List<Attachment> 객체에 데이터를 저장 시키고 false이면 새로운 List<Attachment>로
   생성하여 신고 게시글의 정보를 화면으로 전달시켰습니다.   

```
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




