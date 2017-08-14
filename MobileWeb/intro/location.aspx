﻿<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="location.aspx.cs" Inherits="MobileWeb.intro.location" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	    <header class="header">
		    <script src="<%=GetRoot() %>/common/include/header.js"></script> 	
		    <h1 class="acc-hidden">오시는길</h1>	
		    <p class="location">
			    <span>기업</span><em>></em>
			    <strong>오시는길</strong>
		    </p>
	    </header>

        <!-- 오픈시 보일 메뉴 -->
	    <nav class="gnb" >
		    <script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	    </nav>
	    <!-- // 오픈시 보일 메뉴  -->

	    <!--   width:100% -->
	    <section class="container">
		    <h1 class="acc-hidden">오시는길</h1>	
		    <!--   content -->
		    <section id="map_content" class="content  w600">
			    <h2 class="title_blueline ">본사(중앙연구소)</h2>
                <div id="map_canvas" style="width:100%;height:200px;"></div>
			    <ul class="address_list">
				    <li class="addr">(445-937) 경기도 화성시 향남읍 제약공단1길 66</li>
				    <li class="tel">Tel : 031-353-6141~5 </li>
				    <li class="fax">Fax : 031-353-6146</li>
			    </ul>

                <h2 class="title_blueline ">서울사무소</h2>
                <div id="map_canvas2" style="width:100%;height:200px;"></div> 
			    <ul class="address_list lineB mB10"> 
				    <li class="addr">(151-800) 서울특별시 관악구 남현3길 61</li>
				    <li class="tel"><a href="tel:02-581-2333">Tel : 02-581-2333</a></li>
				    <li class="fax">Fax : 02-581-1644</li>
			    </ul>
                <div class="map_total">
				    <h2 class="title">대한뉴팜 지점 안내</h2>
				    <ul>
					    <li>
					        <h4>서울 1 지점</h4><!--<a href="javascript:popLocation(37.557191, 126.864411);" class="map_view">약도보기</a>-->
					        <p><span>▶</span>서울시 강서구 양천로 583 우림블루나인센터 B동 1804호</p>
					        <p><span>▶</span><em class="pR20">Tel : 070-4748-6678 </em><em>Fax : 070-4015-1229 </em></p>
				        </li>
				        <li>
					        <h4>서울 2 지점</h4><!--<a href="javascript:popLocation(37.553623, 127.194633);" class="map_view">약도보기</a>-->
					        <p><span>▶</span>경기도 하남시 조정대로 150(덕풍동)762 아이테코 그린존 220호</p>
					        <p><span>▶</span><em class="pR20">Tel :  02-463-8188 </em><em>Fax : 02-463-8189 </em></p>
						
				        </li>
				        <li>
					        <h4>서울 3 지점</h4><!--<a href="javascript:popLocation(37.639958, 126.786115);" class="map_view">약도보기</a>-->
					        <p><span>▶</span>경기도 고양시 일산동구 호수로 358-25 (백석동) 동문굿모닝타워2차 712,713호</p>
					        <p><span>▶</span><em class="pR20">Tel : 070-4734-7607 </em><em>Fax : 070-4015-1222</em></p>
				        </li>
				        <li>
					        <h4>경기 지점</h4><!--<a href="javascript:popLocation(37.274813, 127.073696);" class="map_view">약도보기</a>-->
					        <p><span>▶</span>경기도 용인시 기흥구 흥덕1로101(영덕동) 스타프라자 5층 504호</p>
					        <p><span>▶</span><em class="pR20">Tel :  031-461-0973~4 </em><em>Fax : 031-461-0972</em></p>
				        </li>
						<li>
					        <h4>인천 지점</h4><!--<a href="javascript:popLocation(37.274813, 127.073696);" class="map_view">약도보기</a>-->
					        <p><span>▶</span>인천광역시 계양구 작전동 901-3 세종팰리스 8층 802호</p>
					        <p><span>▶</span><em class="pR20">Tel :  032-276-0021 </em><em>Fax : 070-4009-1020</em></p>
				        </li>
				        <li>
					        <h4>부산 지점</h4><!--<a href="javascript:popLocation(35.146556, 129.111926);" class="map_view">약도보기</a>-->
					        <p><span>▶</span>부산시 수영구 광남로 44 (남천동)</p>
					        <p><span>▶</span><em class="pR20">Tel : 051-554-9841~2</em><em>Fax : 051-554-9843</em></p>
				        </li>
				        <li>
					        <h4>대구 지점</h4><!--<a href="javascript:popLocation(35.921066, 128.598935);" class="map_view">약도보기</a>-->
					        <p><span>▶</span>대구광역시 동구 팔공로47길 46(봉무동 1548-8) 캐슬빌딩 305호</p>
					        <p><span>▶</span><em class="pR20">Tel : 053-951-5614</em><em>Fax : 053-951-5615</em></p>
				        </li>
				        <li>
					        <h4>대전 지점</h4><!--<a href="javascript:popLocation(36.363231, 127.336671);" class="map_view">약도보기</a>-->
					        <p><span>▶</span> 대전시 유성구 유성대로 785, 경롱빌딩 6층(장대동)</p>
					        <p><span>▶</span><em class="pR20">Tel : 042-624-0451</em><em>Fax : 042-624-0452</em></p>
				        </li>
				        <li>
					        <h4>광주 지점</h4><!--<a href="javascript:popLocation(35.104258, 126.901232);" class="map_view">약도보기</a>-->
					        <p><span>▶</span>광주시 남구 노대동 효우로 136번길, 2층</p>
					        <p><span>▶</span><em class="pR20">Tel :  062-372-0250~6</em><em> Fax : 062-372-0251</em></p>
				        </li>
				    </ul>
			    </div>
		    </section> 
		    <!--   // content -->
	    </section>
	     <!-- //  width:100% -->
	    <script src="<%=GetRoot() %>/common/include/footer.js"></script> 
    
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true&region=KR"></script>
    <script type="text/javascript">
    var StreetViewPanorama = new function () { }

    var globalMap;
    var globalMap2;
    var globalMarker;
    var globalMarker2;
    var globalGeocoder;

    $(document).ready(function () {
        var w_val = $(window).width();

        $("#map_canvas").attr("width", w_val - 20);

        initialize(37.090924, 126.904129, 37.475315, 126.979821);
    });

    // 맵 초기화
    function initialize(x1, y1, x2, y2) {
        globalGeocoder = new google.maps.Geocoder();

        var latlng = new google.maps.LatLng(x1, y1);
        var latlng2 = new google.maps.LatLng(x2, y2);

        var myOptions = {
            zoom: 15,
            center: latlng,
            navigationControl: false,    // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택.
            navigationControlOptions: {
                position: google.maps.ControlPosition.TOP_RIGHT,
                style: google.maps.NavigationControlStyle.DEFAULT // ANDROID, DEFAULT, SMALL, ZOOM_PAN
            },
            streetViewControl: false,
            scaleControl: false,    // 지도 축적 보여줄 것인지.        
            mapTypeControl: false, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
            mapTypeId: google.maps.MapTypeId.ROADMAP  // HYBRID, ROADMAP, SATELLITE, TERRAIN
        };

        var myOptions2 = {
            zoom: 15,
            center: latlng2,
            navigationControl: false,    // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택.
            navigationControlOptions: {
                position: google.maps.ControlPosition.TOP_RIGHT,
                style: google.maps.NavigationControlStyle.DEFAULT // ANDROID, DEFAULT, SMALL, ZOOM_PAN
            },
            streetViewControl: false,
            scaleControl: false,    // 지도 축적 보여줄 것인지.        
            mapTypeControl: false, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
            mapTypeId: google.maps.MapTypeId.ROADMAP  // HYBRID, ROADMAP, SATELLITE, TERRAIN
        };

        globalMap = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
        globalMap2 = new google.maps.Map(document.getElementById("map_canvas2"), myOptions2);

        setMark();
    }

    // 맵 중앙에 마크찍기
    function setMark() {
        var myOptions = {
            position: globalMap.getCenter(),
            draggable: false,
            map: globalMap,
            //icon: "http://sstatic.naver.net/search/img2/ico_bal_a.gif", // 아이콘 설정할 때
            visible: true,
            title: "<?php echo $result->SHOP_NAME ?>"
            //, icon: "http://" //아이콘을 별도로 줄때 사용
        };

        var myOptions2 = {
            position: globalMap2.getCenter(),
            draggable: false,
            map: globalMap2,
            //icon: "http://sstatic.naver.net/search/img2/ico_bal_a.gif", // 아이콘 설정할 때
            visible: true,
            title: "<?php echo $result->SHOP_NAME ?>"
            //, icon: "http://" //아이콘을 별도로 줄때 사용
        };

        globalMarker = new google.maps.Marker(myOptions);
        globalMarker2 = new google.maps.Marker(myOptions2);
    }

    function popLocation(loc_nm, x, y) {
        popupClick(1);

        $("#map_canvas_pop").text(loc_nm);

        //var w_val = $(window).width();
        //$("#map_canvas_pop").attr("width", w_val - 20);

        globalGeocoder = new google.maps.Geocoder();

        var latlng = new google.maps.LatLng(x, y);

        var myOptions = {
            zoom: 16,
            center: latlng,
            navigationControl: false,    // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택.
            navigationControlOptions: {
                position: google.maps.ControlPosition.TOP_RIGHT,
                style: google.maps.NavigationControlStyle.DEFAULT // ANDROID, DEFAULT, SMALL, ZOOM_PAN
            },
            streetViewControl: false,
            scaleControl: false,    // 지도 축적 보여줄 것인지.        
            mapTypeControl: false, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
            mapTypeId: google.maps.MapTypeId.ROADMAP  // HYBRID, ROADMAP, SATELLITE, TERRAIN
        };

        globalMapPop = new google.maps.Map(document.getElementById("map_canvas_pop"), myOptions);

        var myMarkOptions = {
            position: globalMapPop.getCenter(),
            draggable: false,
            map: globalMapPop,
            //icon: "http://sstatic.naver.net/search/img2/ico_bal_a.gif", // 아이콘 설정할 때
            visible: true,
            title: loc_nm
            //, icon: "http://" //아이콘을 별도로 줄때 사용
        };

        globalMarkerPop = new google.maps.Marker(myMarkOptions);
    }
</script> 

<!--  popup -->
<div class="pop_wrap" id="pop_wrap_01" style="display:none;">
	<div class="pop_wrap_alpha"></div>
	<section class="popupContent">
		<div class="lineBox" id="map_canvas_pop">지점</div>
		<p class="btn_center">
			<button type="button" onclick="popupClose(1);" class="button gray"> 닫기 </button>
		</p>
	</section> 		                                 
</div>
<!-- // popup -->

</asp:Content>