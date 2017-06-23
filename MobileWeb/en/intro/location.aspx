<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="location.aspx.cs" Inherits="MobileWeb.en.intro.location" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	    <header class="header">
		    <script src="<%=GetRoot() %>/en/common/include/header.js"></script> 	
		    <h1 class="acc-hidden">Contact Us</h1>	
		    <p class="location">
			    <span>Company</span><em>></em>
			    <strong>Contact Us</strong>
		    </p>
	    </header>

        <!-- 오픈시 보일 메뉴 -->
	    <nav class="gnb" >
		    <script src="<%=GetRoot() %>/en/common/include/gnb.js" ></script> 	
	    </nav>
	    <!-- // 오픈시 보일 메뉴  -->

	    <!--   width:100% -->
	    <section class="container">
		    <h1 class="acc-hidden">오시는길</h1>	
		    <!--   content -->
		    <section id="map_content" class="content  w600">
			    <h2 class="title_blueline ">Headquarter (R&D center)</h2>
                <div id="map_canvas" style="width:100%; height:200px;"></div>
			    <ul class="address_list">
				    <li class="addr">66 Jeyakgongdan 1-gil Hyangnameup, Hwasung, Gyeonggi, Korea 445-937</li>
				    <li class="tel">Tel : +82 31-353-6141 (Korean)</li>
				    <li class="fax">Fax : +82 31-353-6146</li>
			    </ul>

                <h2 class="title_blueline ">Seoul Office</h2>
                <div id="map_canvas2" style="width:100%; height:200px;"></div> 
			    <ul class="address_list lineB mB10"> 
				    <li class="addr">61 Namhyeon 3-gil, Gwanak-gu, Seoul, Korea 151-800</li>
				    <li class="tel">Tel : +82 2-581-2333 (Korean)</li>
				    <li class="fax">Fax : +82 2-581-1644</li>
			    </ul>
		    </section> 
		    <!--   // content -->
	    </section>
	     <!-- //  width:100% -->
	    <script src="<%=GetRoot() %>/en/common/include/footer.js"></script> 
    
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