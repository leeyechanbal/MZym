#  [ Project ] MZym
<img src="https://github.com/leeyechanbal/MZym/assets/153481748/650fecd3-8730-4ef6-872d-4e1984a01f4b" height="250px" width="500px" >

***

## :sparkles: [ Summary ]
> - 헬스장 사용 회원들이 꾸준히 다닐 수 있도록 다양한 서비스를 제공하는 플랫폼
> - 헬스장의 정보 제공 과 회원들간의 정보 공유가 가능한 커뮤니티 제공
> - 온라인 상담 및 회원권 결제 서비스 제공 


## :date: [ Develope Date ]
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
 - 공지사항 등록, 삭제, 수정
 - 수정시 첨부파일을 새로 등록하면 새로운 첨부파일이 등록 되도록 구현
<img src="https://github.com/leeyechanbal/MZym/assets/153481748/3f04302d-4226-4879-a21c-7e40db64307d"  width="80%"/>
<img src="https://github.com/leeyechanbal/MZym/assets/153481748/e5135167-e5c4-497f-a37a-a736f8333faa"  width="80%"/>

###  ③ [ 신고 ]
 - 신고된 각 종류 게시글과 댓글의 데이터를 조회 해서 한번에 보여주도록 구현
<img src="https://github.com/leeyechanbal/MZym/assets/153481748/3f283bb4-7c68-4f9e-9236-17773f242c73"  width="80%"/>

###  ② [ 단축키 ]
 - 키보드로 숫자 입력시 입력 받은 값을 이용해서 해당 위치의 공지사항 정보가 보이도록 구현
 - input, textarea에서 숫자 입력에도 작동되는 것을 방지
 <img src="https://github.com/leeyechanbal/MZym/assets/153481748/331521ba-4ed5-41a2-af58-389b1ec420d1"  width="80%"/>
 <br>
 
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

<br>

###  ④ [ 첨부파일 ]
 첨부 파일에서 받은 Object타입의 객체를 instanceof을 이용해서 객체를 확인  
 필요한 데이터를 동적으로 생성해서 문자열로 Qurey를 작성해서 DB에 전달
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
###  ⑤ [ 신고 게시판 불러 오기 ]
DB로 부터 받아온 정보의 pt후기 사진일 경우 list<Attachment>에 2번 데이터를 저장한 후   
이전의 신고 번호 다음 리스트의 신고 번호를 을 비교해서 새로운 List<>을 생성해 받아와  
font단에 전달
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
1. API를 찿아보고 적용 했으면 더욱 빠른 개발이 가능 했을 것 같다.
2. 디버깅 사용 하기
3. 테스트 많이 해보기

