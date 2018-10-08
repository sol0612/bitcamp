<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<style>
*{
	padding:0px;
	margin:0px;
}
body{
	padding:0px;
	margin:0px;
}
#mainBan{
	background-color: #fa3246;
	width:100%;
	height:600px;
}
#mainSub{
	width:1200px;
	margin:0 auto;
}

#contentBox{
	width:1200px;
	margin:0 auto;
}

#map{
	min-width:100%;
	height:600px;
}


p{
display:inline;
}

#m_topNavi{
	padding-top: 20px;
}

#m_topNavi>a{
	float:right;
	color:white;
	padding-left:20px;
	font-size: 14pt;
	cursor: pointer;
	font-weight: lighter;
}
#m_headline{
	padding-top:100px;
	text-align: center;
}

#m_headline>h2, #m_headline>h4{
	display:inline;
	color:white;
	letter-spacing: -3;
}
#m_headline>h2{
	font-weight: normal;
}
#m_headline>h4{
	font-weight: lighter;
}
#m_headline>h2{
	font-size: 45pt;
}

#m_headline>h4{
	font-size: 30pt;
}
#m_headline>h1{
	font-size: 70pt;
	color:white;
}

#logo{
	padding-top:40px;
	width:120px;
}

#contentBox{
	margin-top: 30px;
}

.cnDiv{
	padding-top:20px;
	padding-bottom: 20px;
	float:left;
	width: 250px;
}

.subwayBox{
	width: 300px;
	padding-right:20px;
}

.rangeBox{
	width: 200px;
	padding-right:20px;
}

.searchBtnBox{
	width : 200px;
	float:right;
}

#lineNum, #stationId{
	width:100%;
	border:0px;
	color:white;
	height:40px;
	background-color: #cccccc;
	font-size: 12pt;
	padding-right: 10px;
}


#myRange{
	width:200px;
	height:10px;
	margin-top:14px;
}

#searchBtn{
	border:0px;
	color:white;
	width:200px;
	height:40px;
	font-size: 12pt;
	background-color: #fa3246;
}

.slider {
    -webkit-appearance: none;
    width: 100%;
    height: 5px;
    background: #d3d3d3;
    outline: none;
    opacity: 0.7;
    -webkit-transition: .2s;
    transition: opacity .2s;
}

.slider:hover {
    opacity: 1;
}

.slider::-webkit-slider-thumb {
    -webkit-appearance: none;
    appearance: none;
    width: 25px;
    height: 25px;
    border-radius: 50%;
    background: #fa3246;
    cursor: pointer;
}

#lineSelecter{
	width:100%;
	height:100%;
	background-color:rgba(0,0,0,0.6);
	position:fixed;
	top:0px;
	left:0px;
	z-index: 1000;
}

#lineSelectBox{
	width:250px;
	margin:0 auto;
	text-align:center;
	margin-top:150px;
	background-color:white;
}

#lineHeadline{
	width:100%;
	background-color:#fa3246;
	height:40px;
	
}
#lineHeadline>h1{
	color:white;
	font-size: 14pt;
	padding: 10px 0px 10px 0px;
}

.lineOn{
	width:100%;
	font-size: 14pt;
	height:40px;
	border:none;
	background-color:#cccccc;
	border-bottom: 0.5px solid white;
	color:white;
}
.lineOn:HOVER {
	background-color:#fa3246;
}

.lineClose{
	width:100%;
	font-size: 14pt;
	height:40px;
	border:none;
	background-color:#fa3246;
	color:white;
}

#stationHeadline{
	width:100%;
	background-color:#fa3246;
	height:40px;
}

#stationHeadline>h1{
	color:white;
	font-size: 14pt;
	padding: 10px 0px 10px 0px;
}


#stationSelecter{
	width:100%;
	height:100%;
	background-color:rgba(0,0,0,0.6);
	position:fixed;
	top:0px;
	left:0px;
	z-index: 1000;
}

#stationSelectBox{
	width:600px;
	margin:0 auto;
	text-align:center;
	margin-top:150px;
	background-color:white;
}
#AllStation{
	width:100%;
	height:400px;
	overflow: auto;
	text-align: left;
}

.stationOn{
	width:20%;
	font-size: 14pt;
	height:40px;
	border:none;
	background-color:#cccccc;
	border: 0.1px solid white;
	color:white;
}

.stationOn:HOVER {
	background-color:#fa3246;
}

#stationClose{
	width:100%;
	font-size: 14pt;
	height:40px;
	border:none;
	background-color:#fa3246;
	color:white;
}

.textBox{
	text-align: center;
	padding:60px 0px 60px 0px;
}
	
.textBox>h3{
	font-size: 20pt;
	font-weight: lighter;
	letter-spacing: -1;
}
.textBox>h1{
	font-size: 34pt;
	font-weight: bolder;
	letter-spacing: -1;
}
#viewRes{
	width:100%;
	height:320px;
	margin-top:20px;
	background-color:#e6e6e6;
	text-align: center;
	display:none;
	
}
.viewCss{
	display:inline-block;
	padding:10px;
	margin:5px;
	margin-top:20px;
	background-color:white;
}
#viewList{
	display:inline-block;
}
.viewCss>h3{
	padding:10px;
}
.viewCss>h5{
	font-weight: lighter;
}
.PageMPoint{
	width:20px;
	margin-top:140px;
}
.btn_before{
	float:left;
	margin-left:15px;
}
.btn_after{
	float:right;
	margin-right:15px;
}








</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31560f6f51cc23c9f8ef204f4664e637"></script>
<script>
	
	var lineNum = '';
	var stationId = '';
	var x = '';
	var xx = '';
	var yy = '';
	var y = '';
	var radius = '2000';
	var cnt=1;
	var markerCnt=1;
	var ResOne;
	var ResList=[];
	
	var before=1;
	var after=2;
	
	// 노선도 정보로 지하철역 리스트 값 얻기.
	var stationUrl = 'http://openAPI.seoul.go.kr:8088/55686455676570643239595a596655/xml/SearchSTNBySubwayLineService/1/300/';
	
	
	
	
	/* window.onload=function(){
		$.ajax({
			url: stationUrl+lineNum,
			success : function(data){
				$(data).find('SearchSTNBySubwayLineService').find('row').each(function(){
					$('#stationId').append('<option value="'+$(this).find('STATION_CD').text()+'" ">'+$(this).find('STATION_NM').text()+'</option>');
				})
			}
		})
	} */
	
	
	
	$(document).ready(
		function() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
			    center: new daum.maps.LatLng(37.948100, 127.061034), // 지도의 중심좌표
			    level: 5 // 지도의 확대 레벨
			};
			var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			$('#lineSelecter').css("display", "none");
			$('#stationSelecter').css("display", "none");
			
			
			/* $('.lineOn').on('click',function(){
				var lineNum=$(this).val();
				
				$('#lineNum').val(lineNum);
				$('#lineNum').html(lineNum+'호선');
				
				$('lineSelecter').css('display','none');
			}) */
			
			
			//lineNum선택 후 stationId 출력 
			$('.lineOn').on('click',function(){
				lineNum = $(this).val(); //지하철 라인 정보 갱신.
				
				$('#lineNum').css('background-color', "#fa3246")
				$('#lineNum').val(lineNum);
				$('#lineNum').html($(this).html()); //노선 버튼 갱신
				
				$('#lineSelecter').css('display','none'); // 지하철 노선 선택창 none
				
				$('#AllStation').html(''); //역정보 초기화.
				
				$.ajax({
					url: stationUrl+lineNum,
					error:console.log("노선선택 = "+stationUrl+lineNum),
					success : function(data){
						cnt=1;
						
						$(data).find('SearchSTNBySubwayLineService').find('row').each(function(){
							var st_code = $(this).find('STATION_CD').text();
							console.log("지하철 코드 = "+st_code);
							var st_name = $(this).find('STATION_NM').text();
							/* if($(this).index()==2){
								$('#stationSelectBox').append('<div id="stationHeadline"><h1>지하철 역 선택</h1></div>');
							} */
							
							if(cnt%5==0){
								$('#AllStation').append('<button class="stationOn" value="'+st_code+'" onclick="stationSelect(\''+st_code+'\',\''+st_name+'\')">'+st_name+'</button><br>');
							console.log(st_code+', '+st_name);
							}else{
								$('#AllStation').append('<button class="stationOn" value="'+st_code+'" onclick="stationSelect(\''+st_code+'\',\''+st_name+'\')">'+st_name+'</button>');
							
							}
							cnt++;
						})
						/* $('#stationSelectBox').append('<button id="stationClose" onclick="stationClose()">닫기</div>'); */
					}
				})
			})
			
			
			//지하철 노선 여닫기
			$('#lineNum').on('click',function(){
				if($("#lineSelecter").css("display") == "none"){   
			        $('#lineSelecter').css("display", "block"); //보이기.
			    } else {  
			        $('#lineSelecter').css("display", "none"); //숨기기.
			    }
			})

			
			
			// 지하철역 선택.
			/* $('.stationOn').on('click',function(){
				stationId = $(this).val();
				
				$('#stationId').val(lineNum);
				$('#stationId').html($(this).html()); //노선 버튼 갱신
				
				$('#stationSelecter').css('display','none'); // 지하철 노선 선택창 none
				
				$.ajax({
					url : stationLoc+stationId,
					success : function(data){
						$(data).find('SearchLocationOfSTNByIDService').find('row').each(function(){
							x = $(this).find('XPOINT_WGS').text();
							y = $(this).find('YPOINT_WGS').text();
						})
					}
				})
			}) */
			
			
			
			
			
			
			
			
			//지하철 역 여닫기
			$('#stationId').on('click',function(){
				/* if($("#stationSelecter").css("display") == "none"){   
			        $('#stationSelecter').css("display", "block"); //보이기.
			    } else {  
			        $('#stationSelecter').css("display", "none"); //숨기기.
			    }
				 */
				if(lineNum==''){
					alert("지하철 노선을 선택해주세요.")
				}else{
					$('#stationSelecter').css("display", "block"); //보이기.
				}
			})
			
			
			// 검색 범위 저장
			$('#myRange').change(function(){
				radius = $(this).val();
			})
			
			
			// 맛집 출력
			$('#searchBtn').on('click', function() {
				
					if($('#lineNum').val()!="n"){
						if($('stationId').val()!="n"){
							
							/* alert('lineNum = '+$('#lineNum').val()+', stationId = '+$('#stationId').val()); */
					
							var xhr = new XMLHttpRequest();
							var foodUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList'; /*URL*/
							var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'jaWvwp%2FnA5aEEWuqg66iLJF7yCE9KKeEBLOn7KxW2pA8VHjjaDiwHGUQDSCedHcKNpBWjzCe9YHHgpO5M03Vjw%3D%3D'; /*Service Key*/
							queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('300'); /*한 페이지 결과 수*/
							queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /*현재 페이지 번호*/
							queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); /*IOS(아이폰),AND(안드로이드),WIN(원도우폰), ETC*/
							queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('TourAPI3.0_Guide'); /*서비스명=어플명*/
							queryParams += '&' + encodeURIComponent('arrange') + '=' + encodeURIComponent('A'); /*(A=제목순,B=조회순,C=수정일순,D=생성일순) 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)*/
							queryParams += '&' + encodeURIComponent('contentTypeId') + '=' + encodeURIComponent('39'); /*관광타입(관광지, 숙박 등) ID*/
							queryParams += '&' + encodeURIComponent('mapX') + '=' + encodeURIComponent(y); /*GPS X좌표(WGS84 경도 좌표)*/
							queryParams += '&' + encodeURIComponent('mapY') + '=' + encodeURIComponent(x); /*GPS Y좌표(WGS84 위도 좌표)*/
							queryParams += '&' + encodeURIComponent('radius') + '=' + encodeURIComponent(radius); /*거리 반경(단위m), Max값 20000m=20Km*/
							queryParams += '&' + encodeURIComponent('listYN') + '=' + encodeURIComponent('Y'); /*목록 구분 (Y=목록, N=개수)*/	
							
							
							
							//지도 위치 이동
							var moveLatLon = new daum.maps.LatLng(x, y);
							markerCnt=1;
							$('#viewRes').css('display','block');
						    
						    // 지도 중심을 부드럽게 이동시킵니다
						    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
							map.setCenter(moveLatLon);
							
						    // 맛집 마커 생성
							$.ajax({
								url : foodUrl+queryParams,
								error : console.log(foodUrl+queryParams),
								success : function(data){
									$('#viewRes').html='';
									$(data).find('response').find('body').find('items').find('item').each(function(){
										
										var xx = $(this).find('mapx').text();
										var yy = $(this).find('mapy').text();
										var title = $(this).find('title').text();
										
										
										ResOne=[
											 $(this).find('firstimage').text(),
											 $(this).find('title').text(),
											 $(this).find('addr1').text(),
											 $(this).find('tel').text(),
											 xx,
											 yy
											
										]
										
										ResList.push(ResOne);
										
										if(markerCnt<=5){
			
											// 마커 이미지의 이미지 주소입니다
											var imageSrc = "/TeamWeekProject3/image/pickIcon-01.png";
											
											// 마커 이미지의 이미지 크기 입니다
											var imageSize = new daum.maps.Size(24);
										    
										    // 마커 이미지를 생성합니다    
										    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
										    
										    // 마커를 생성합니다
										    var marker = new daum.maps.Marker({
										        map: map, // 마커를 표시할 지도
										        position: new daum.maps.LatLng(yy, xx), // 마커를 표시할 위치
										        title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
										        image : markerImage // 마커 이미지 
										    });
										    
										    
										    // markerView에 맛집 정보 추가.
										    $('#viewList').append('<div class="view'+markerCnt+' viewCss"></div>');
										    /* alert(ResList[markerCnt].); */
										    $('.view'+markerCnt+'').append('<img src="'+$(this).find('firstimage').text()+'" width="180px;" height="180px;" >');
										    $('.view'+markerCnt+'').append('<h3>'+$(this).find('title').text()+'</h3>');
										    $('.view'+markerCnt+'').append('<h5>'+$(this).find('addr1').text()+'</h5>');
										    $('.view'+markerCnt+'').append('<h5>'+$(this).find('tel').text()+'</h5>');
										    /* alert('markerCnt = '+markerCnt+', addr1 = '+$(this).find('addr1').text()); */
										    markerCnt++;
										} 
									})
								}
							})	
						}else{
							alert("지하철 역을 선택후 시도해주세요.");
						}
					}else{
						alert("지하철 노선과 지하철 역을 선택후 시도해주세요.");
					}
			})
			
			$('.btn_after').on('click',function(){
				/* $('#viewList').html=''; */
				alert('다음페이지');
				
			})
			
			$('.btn_before').on('click',function(){
				alert('이전페이지');
			})
			
			
			
			
			
			
			
			
			//범위 실시간 갱신
			function radiusCh(){
				var val = document.getElementById('myRange').value;
				if(val>=1000){
					val=val/1000+'km 검색';
				}else{
					val = val+'m 검색'
				}
				document.getElementById('searchBtn').setAttribute('value', val);
			}



			
			// 지하철 노선 선택
			
			
			
			/* // 지하철 역 선택
			$('.stationOn').on('click',function(){
				var station=$(this).val();
				
				$('#lineNum').val(lineNum);
				$('#lineNum').html(lineNum+'호선');
				
				$('lineSelecter').css('display','none');
			}) */
			
			
			
			
			
			
		})//마지막토큰

		
		
		// 일반 function문
		// 지하철 역 선택시 좌표값 얻기
		function stationSelect(st_cd, st_nm){
		/* alert(st_cd+', '+st_nm); */
			var stationBtn = document.getElementById('stationId');
		
			stationBtn.style.backgroundColor="#fa3246";
			stationBtn.innerHTML = st_nm;
			stationBtn.setAttribute('value', st_cd);
			
			stationId = st_cd;
			
			document.getElementById('stationSelecter').style.display = "none";
			
			// 지하철역 정보로 좌표값 얻기.
			var stationLoc = 'http://openapi.seoul.go.kr:8088/55686455676570643239595a596655/xml/SearchLocationOfSTNByIDService/1/1/';
			
			$.ajax({
				url : stationLoc+stationId,
				error: console.log("stationId = "+stationId+"url = "+stationLoc+stationId),
				success : function(data){
					$(data).find('SearchLocationOfSTNByIDService').find('row').each(function(){
						x = $(this).find('XPOINT_WGS').text();
						/* alert(x); */
						y = $(this).find('YPOINT_WGS').text();
					})
				}
			})
		}
	
	
	// 노선선택창 닫기
	function lineClose(){
		var lineSelecter = document.getElementById("lineSelecter");
			lineSelecter.style.display="none";
	}
	
	//지하철 선택창 닫기
	function stationClose(){
		var stationSelecter = document.getElementById("stationSelecter");
			stationSelecter.style.display="none";
	}
		

		
		
</script>
</head>
<body>

<!-- 메인배너 -->
<div id=mainBan>
	<div id="mainSub">
		<div id="m_topNavi">
			<a>로그인</a>
			<a>더보기</a>
			<a>예약내역</a>
			<a>내주변</a>
		</div>
		
		<div id="m_headline">
			<h2>숙박</h2>
			<h4>부터 </h4>
			<h2>맛집</h2>
			<h4>까지</h4><br>
			<h1>역이어때.</h1>
			<img id="logo" src="/TeamWeekProject3/image/pickicon3.png">
		</div>
	</div>
</div>

<!-- 맛집 컨텐츠 -->
	<div id=contentBox>
		<div class=textBox>
			<h3>입의 즐거움을 위한</h3>
			<h1>역주변 맛집 추천</h1>
		</div>
	
		<!--지하철 노선 선택 -->
		<div class="cnDiv subwayBox">
			<button type="button" value="n" id="lineNum">지하철 노선 선택</button>
		</div>
		
		<!-- 지하철역 선택 -->
		<div class="cnDiv subwayBox">
			<button value="n" id="stationId">지하철역 선택</button>
		</div>
		
		<!-- 검색범위 설정 -->
		<div class="rangeBox cnDiv">
	  		<input type="range" min="100" max="10000" value="2000" class="slider" id="myRange" step="100" oninput="radiusCh()">
	  		
		</div>
		
		<div class="cnDiv searchBtnBox">
			<input type="button" id="searchBtn" value="2km검색" >
		</div>
		
		<!--지도 -->
		<div id="map"></div>
		<div id="viewRes">
			<img src="../TeamWeekProject3/image/before.png" class="PageMPoint btn_before" >
			<div id="viewList"></div>
			<img src="../TeamWeekProject3/image/after.png" class="PageMPoint btn_after" >
		</div>
		
		
		<div class=textBox>
			<h3>눈의 즐거움을 위한</h3>
			<h1>MOVIE Chart</h1>
		</div>
		
		<div>
			<jsp:include page="movie_search.jsp"></jsp:include>
		</div>
		
	</div>
	
<div id="lineSelecter">
	<div id="lineSelectBox">
		<div id="lineHeadline"><h1>지하철 노선 선택</h1></div>
		<button class="lineOn" value="1" >1호선</button><br>
		<button class="lineOn" value="2" >2호선</button><br>
		<button class="lineOn" value="3" >3호선</button><br>
		<button class="lineOn" value="4" >4호선</button><br>
		<button class="lineOn" value="5" >5호선</button><br>
		<button class="lineOn" value="6" >6호선</button><br>
		<button class="lineOn" value="7" >7호선</button><br>
		<button class="lineClose" onclick="lineClose()">닫기</button>
	</div>
</div>

<div id="stationSelecter">
	<div id="stationSelectBox">
		<div id="stationHeadline"><h1>지하철 역 선택</h1></div>
		<div id="AllStation">
		
		</div>
		<button id="stationClose" onclick="stationClose()">닫기</button>
	</div>
</div>


<script>
	var val;
	function radiusCh(){
		var val = document.getElementById('myRange').value;
		if(val>=1000){
			val=val/1000+'km 검색';
		}else{
			val = val+'m 검색'
		}
		document.getElementById('searchBtn').setAttribute('value', val);
	}



	/* function selectLine(line){
		var lineNum = document.getElementById('lineNum');
		
		lineNum.innerHTML= line+'호선';
		lineNum.setAttribute('value',line);
		
		//지하철 노선 select창 닫기.
		document.getElementById('lineSelecter').style.display="none";
	} */



</script>


</body>
</html>



