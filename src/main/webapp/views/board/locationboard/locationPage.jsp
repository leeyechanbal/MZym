<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬스장 위치</title>
<!--네이버지도-->
    <script type="text/javascript" 
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8fnkkiuva9"></script>
<style>
	

    .locationPage_content{ /*메인 영역*/
    border: 2px solid #1ABC9C;
    width: 90%;
    height: 100%;
    margin: auto;
    margin-top: 50px;
    min-height: 1200px;
    padding: 50px;
    border-radius: 10px;
	  }
	  .locationPage_content > div {
	    flex: 1;
	    margin: 20px;
	}
	.pageTitle{
	    height: 20%;
	    position: relative;
	    
	}
	.text-overlay {
	      position: absolute;
	      top: 50%;
	      left: 80%;
	      transform: translate(-50%, -50%);
	      color: white;
	      padding: 10px;
	      display: flex;
	      justify-content: center;
	      align-items: center;
	      flex-wrap: nowrap;
	      width: 50%;
	    
	    }
	.pageTitle img{
	    width: 100%;
	    height: 100%;
	    border-radius: 10px;
	   
	}
	.addressArea{
	    height: 10%;
	    flex-wrap: nowrap;
	    font-size: 30px;
	    border-bottom: 4px solid #e0e0e0;
	}
	
	
	.contentArea{
	    height: 20%;
	}
	.iconArea{
	    height: 20%;
	    display: flex;
	    margin: auto;
	    justify-content: space-between;
	}
	.icon1{
	    background-color: #1ABC9C;
	    border-radius: 10px;
	    width: 20%;
	    height: 50%;
	    color: white;
	    font-weight: bold;
	    text-align: center;
	    margin: 10px;
	    font-size: 30px;
	    flex-wrap: nowrap;
	}
	.contentField{
	    font-size: 20px;
	    padding: 20px;
	    
	}
	.con1{
	    text-align: center;
	    font-size: 30px;
	    margin-bottom: 10px;
	}
	.con2 {
	    display: flex;
	    justify-content: center;
	    align-items: center; 
	    height: 80%; 
	    border-top: 2px solid grey;
	}
	
	.con2 ul {
	    padding: 0; 
	}
	
	.con2 li {
	    list-style: none;
	    margin: 20px;
	    font-size: 20px; 
	    text-align: center; 
	}
	.iconCentent{
	    background-color: #1ABC9C;
	    color: white;
	    border-radius: 10px;
	    font-weight: bold;
	    padding: 10px;
	    margin: 20px;
	    width: 25%;
	    
	}

</style>
</head>
<body>
	<div class="wrap">
	<%@ include file="/views/common/Mzym_header.jsp" %>
	
	      
      
        <!-- Section start -->
        <section class="main_content">
		<%@ include file="/views/common/Mzym_sidebar.jsp" %>
          	<div class="locationPage_content">
            <div class="pageTitle">
                <img src="<%=contextPath %>/resources/img/common/제목 배경사진.png">
                <div class="text-overlay">
                    <h1>Mzym 오시는 길</h1>
                </div>
            </div>
            <div class="addressArea"><span style="font-size: 40px; font-weight: bold;">주소 :</span> 서울 금천구 가산디지털2로 95 3층 </div>
            <div id="map" style="height: 500px;"></div>
            <div class="contentArea">
                <div class="icon1">Myzm 소개</div>
                <div class="contentField">서울 금천구에 위치한 Mzym은 넓은 규모에 최신식 운동기구, 체계적이고 효율적 1:1 전문매칭 시스템을 통해 웨이트트레이닝 본질에 <br><br>집중한, 회원님께 최고의 서비스를 제공하는 피트니스 센터입니다. </div>
            </div>
            <div class="iconArea">
                <div class="iconCentent">
                    <div class="con1">운영시간</div>
                    <div class="con2">
                        <ul>
                            <li>평일 : 06:00 ~ 24:00</li>
                            <li>주말 : 09:00 ~ 22:00</li>
                            <li>공휴일 : 09:00 ~ 18:00</li>
                        </ul>
                    </div>
                </div>
                <div class="iconCentent">
                    <div class="con1">회원권</div>
                    <div class="con2">
                        <ul>
                            <li>3개월/ 6개월/ 12개월</li>
                            <li>PT이용권 (상품구매 참조)</li>
                        </ul>

                    </div>
                </div>
                <div class="iconCentent">
                    <div class="con1">기타 및 비용</div>
                    <div class="con2">
                       <ul>
                            <li>일일 입장 무제한</li>
                            <li>운동복 월 1만원</li>
                            <li>개인사물함 월 1만원</li>
                       </ul>
                    </div>
                </div>

            </div>
        </div> 
		</section>
        <!-- Section end -->
        
	<%@ include file="/views/common/Mzym_footer.jsp" %>
	<script>

        var map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.47641021789274, 126.87983768328583),
            zoom: 17
        });

        var marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(37.47641021789274, 126.87983768328583),
            map: map
        });

    </script>


	</div>
</body>
</html>