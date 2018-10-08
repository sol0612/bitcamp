<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>실시간 박스오피스 & 영화검색</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/movie.css">
<script>
	//crossDomain 해결코드
	$(function() {
		$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
			if (options.crossDomain && jQuery.support.cors) {
				options.url = "https://cors-anywhere.herokuapp.com/" + options.url;
			}
		});
	});

	//조회할 날짜를 계산
	var dt = new Date();

	//0(1월)부터 시작하기때문에 1더해주기
	var m = dt.getMonth() + 1;
	if (m < 10) { var month = "0" + m;
	} else { var month = m + ""; }

	//당일 박스오피스는 안나오기때문에 전날 박스오피를 가져오기위해 -1해줌
	var d = dt.getDate() - 1;
	if (d < 10) { var day = "0" + d;
	} else { var day = d + ""; }

	var y = dt.getFullYear();
	var year = y + "";

	var result = year + month + day;
	

	//천단위마다 콤마찍어주는 함수
	function addComma(num) {
		// 문자열 길이가 3과 같거나 작은 경우 입력 값을 그대로 리턴
		if (num.length <= 3) {
			return num;
		}
		// 3단어씩 자를 반복 횟수 구하기
		var count = Math.floor((num.length - 1) / 3);

		// 결과 값을 저정할 변수
		var result = "";

		// 문자 뒤쪽에서 3개를 자르며 콤마(,) 추가
		for (var i = 0; i < count; i++) {

			// 마지막 문자(length)위치 - 3 을 하여 마지막인덱스부터 세번째 문자열 인덱스값 구하기
			var length = num.length;
			var strCut = num.substr(length - 3, length);
			// 반복문을 통해 value 값은 뒤에서 부터 세자리씩 값이 리턴됨.

			// 입력값 뒷쪽에서 3개의 문자열을 잘라낸 나머지 값으로 입력값 갱신
			num = num.slice(0, length - 3);

			// 콤마(,) + 신규로 자른 문자열 + 기존 결과 값
			result = "," + strCut + result;
		}
		// 마지막으로 루프를 돌고 남아 있을 입력값(value)을 최종 결과 앞에 추가
		result = num + result;

		// 최종값 리턴
		return result;
	}

	//박스오피스 로딩하는 함수시작
	$(function() {
		$.ajax({
					//&itemPerPage: 1-10위 까지의 데이터가 출력되도록 설정
					url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=df5e3a1e2892f4cb84d6c91c0d170ede&targetDt="
							+ result + "&itemPerPage=10",
					dataType : "xml",
					success : function(data) {
						var $data = $(data).find("boxOfficeResult>dailyBoxOfficeList>dailyBoxOffice");
						//데이터를 테이블 구조에 저장.
						if ($data.length > 0) {
							var table = $("<table/>").attr("class", "table");
							//<table>안에 테이블의 컬럼 타이틀 부분인 thead 태그
							var thead = $("<thead/>").append($("<tr/>"))
									.append(
											//추출하고자 하는 컬럼들의 타이틀 정의
											$("<th width='100px' style='background-color:#f0f0f0'/>").html("순위"),
											$("<th width='500px' style='background-color:#f0f0f0'/>").html("영화 제목"),
											$("<th width='200px' style='background-color:#f0f0f0'/>").html("영화 개봉일"),
											$("<th width='200px' style='background-color:#f0f0f0'/>").html("오늘 관객수"),
											$("<th width='200px' style='background-color:#f0f0f0'/>").html("누적 관객수"));

							var tbody = $("<tbody/>");
							
							$.each($data, function(i, o) {
								//오픈 API에 정의된 변수와 내가 정의한 변수 데이터 파싱
								var $rank = $(o).find("rank").text(); // 순위
								var $movieNm = $(o).find("movieNm").text(); //영화명
								var $openDt = $(o).find("openDt").text();// 영화 개봉일
								var $audiCnt = $(o).find("audiCnt").text(); //해당일의 관객수
								var $audiAcc = $(o).find("audiAcc").text(); //누적 관객수

								//<tbody><tr><td>태그안에 파싱하여 추출된 데이터 넣기
								var row = $("<tr style='background-color:#f0f0f0'/>").append(
										$("<td style='background-color:#f0f0f0'/>").text($rank),
										$("<td style='background-color:#f0f0f0'/>").text($movieNm),
										$("<td style='background-color:#f0f0f0'/>").text($openDt),
										$("<td style='background-color:#f0f0f0'/>").text(addComma($audiCnt)),
										$("<td style='background-color:#f0f0f0'/>").text(addComma($audiAcc)));

								tbody.append(row);

							});// end of each 

							table.append(thead);
							table.append(tbody);
							$(".wrap").append(table);

						}
					},
					//에러 발생시 "실시간 박스오피스 로딩중"메시지가 뜨도록 한다.
					error : function() {
						alert("실시간 박스오피스 로딩중...");
					}
				});
	}); //박스오피스 로딩하는 함수끝

	//검색결과 받아오는 함수 시작	
	$(function() {
		// 발급받은 네이버 id랑 시크릿키 변수로 선언해줌
		var XNaverClientId = "Ii999zNeEDa3b7kVaHHH";
		var XNaverClientSecret = "r3rW99SGsC";

		$.popup = function() {
			alert('1');
			$('.wrap3').css('display','block');
			/* var layer = document.getElementById("wrap3");
			layer.style.display = "block"; */
		
		}

		$.close = function() {
			$('.wrap3').css('display','none');
			/* var layer = document.getElementById("wrap3");
			layer.style.display = "none"; */
			
			//그전에 출력되있는 정보는 삭제해줌
			$('#table2').remove();
		}

		// form에서 값 받아오기
		$.serviceAPISearchBlog = function() {
			if ("" == $.trim($("#query").val())) {
				$("#query").val("검색어");
			}

			$.ajax({
						crossDomain : true,
						context : this,
						traditional : true,
						//json 요청 url
						url : "https://openapi.naver.com/v1/search/movie.json",
						method : "GET",
						type : "GET",
						dataType : "JSON",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						async : true,
						cache : true,
						timeout : 0,
						headers : {
							//네이버에서 발급받은 아이디랑 시크릿키 입력
							"X-Naver-Client-Id" : XNaverClientId,
							"X-Naver-Client-Secret" : XNaverClientSecret
						},
						//Form의 값을 전달해줌
						data : $("#serviceAPISearchForm").serialize(),
						success : function(data, textStatus, jqXHR) {
							
							if (data != null) {
								//JSON을 문자열로 바꿔줌
								var json = JSON.stringify(data);

								if (json.length > 0) {
									var table2 = $("<table/>").attr("id","table2");
									$('#table2').remove();
									
									//<table>안에 테이블의 컬럼 타이틀 부분인 thead 태그
									var thead2 = $("<thead/>").append(
											$("<tr/>")).append(
									//추출하고자 하는 컬럼들의 타이틀 정의
											$("<th />").html("포스터"),
											$("<th width='200px;'/>").html("영화제목"),
											$("<th width='300px;'/>").html("감독"),
											$("<th width='500px;'/>").html("주연배우"),
											$("<th width='100px;'/>").html("평점"));

									var tbody2 = $("<tbody/>");

									var item = JSON.parse(json);

									$.each(item.items, function(i) {
														var data = item.items;
														
														var title = data[i].title.replace(/<b>|<\/b>/g,'');
														var link = data[i].link
														var img = data[i].image;
														var director = data[i].director.replace('|','');
														var actor = data[i].actor.replace(/\|/g,' | ');
														var rate = data[i].userRating;

														var row2 = $("<tr/>").append(
																		//포스터이미지클릭시 링크이동
																		$("<td> <a href="+ link +"> <img id=\"img_src\" src="+ img +"></a> </td>"),
																		$("<td/>").text(title),
																		$("<td/>").text(director),
																		$("<td/>").text(actor),
																		$("<td/>").text(rate));

														tbody2.append(row2);

													});// end of each 

									table2.append(thead2);
									table2.append(tbody2);
									$(".wrap2").append(table2);

								}
							}
						},

						error : function(jqXHR, textStatus, errorThrown) { //에러났을때
							var errorResponseCode = "";
							errorResponseCode += "readyState : ";
							errorResponseCode += jqXHR.readyState;
							if ("0" == jqXHR.readyState) {
								errorResponseCode += "-UNSENT";
							}
							if ("1" == jqXHR.readyState) {
								errorResponseCode += "-OPENED";
							}
							if ("2" == jqXHR.readyState) {
								errorResponseCode += "-HEADERS_RECEIVED";
							}
							if ("3" == jqXHR.readyState) {
								errorResponseCode += "-LOADING";
							}
							if ("4" == jqXHR.readyState) {
								errorResponseCode += "-DONE";
							}
							alert(errorResponseCode);
						},
						complete : function(jqXHR, textStatus) {
						}
					});
		}
	}); //검색결과 출력하는 함수 끝
</script>
</head>
<body>


	
	
	<div id="movieChart">
		
		<div id="mo_searchBox">
			<h3 >- 실시간 박스오피스 -</h3>
			<form name="serviceAPISearchForm" id="serviceAPISearchForm"	method="post" action="" onsubmit="return false;">
				<div id="mo_inline">
					<div id="MovieSearchInput" >		
						<input class="form-control" type="text" id="query"  name="query"	placeholder="보고싶은 영화를 검색하세요" value="" />
					</div>
				</div>
				
				<button class="btn btn-primary"  type="button" onclick="$.serviceAPISearchBlog(); $.popup();">검색</button>
			</form>
		</div>
		
		<div class="wrap"></div>
		
	</div>
	<div class="wrap3">
		<h5 style="display:inline-block;">포스터를 클릭하면 네이버 영화정보로 넘어갑니다.</h5>
		<div id="close" onclick="$.close();" style="float:right;">X</div>
		<div class="wrap2" id="popup">
			
			
		</div>
	</div>
	
	<div id="bottomSpace">
	
	</div>
</body>
</html>