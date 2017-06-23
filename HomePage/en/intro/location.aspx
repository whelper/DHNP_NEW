<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="location.aspx.cs" Inherits="HomePage.en.intro.location" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">
    <section id="content" class="sub_content " >
			<header>
				<h1 class="pageTitle line"> Contact Us  </h1>
				<p class="location">
					<a href="/en/index.aspx"><span> <img src="/en/common/images/common/i_home.png" alt="home" />  </span></a>
					<a href="/en/intro/vision.aspx"><span>Company</span>   <em> > </em></a>
					<a href="/en/intro/location.aspx"><strong> Contact Us</strong></a>
				</p>
			</header>
			<!--  내용  ***************** -->
			<article class="map_box">
				<h2 class="title">Headquarter (R&D center)</h2>
				<div id="map_canvas2" class="map"></div> 
				<ul class="map_list">
					<li>
						<h2>Address</h2>
						<p>66 Jeyakgongdan 1-gil Hyangnameup, Hwasung, Gyeonggi, Korea 445-937</p>
					</li>
					<li class="w170">
						<h2>Tel</h2>
						<p>+82 31-353-6141 (Korean)</p>
					</li>
					<li>
						<h2>Fax</h2>
						<ul>
							<li>+82 31-353-6146</li>
						</ul>
					</li>
				</ul>
			</article>	
			<article class="map_box">
				<h2 class="title">Seoul Office</h2>
				<div id="map_canvas" class="map"></div> 
				<ul class="map_list">
					<li>
						<h2>Address</h2>
						<p>61 Namhyeon 3-gil, Gwanak-gu, Seoul, Korea 151-800</p>
					</li>
					<li class="w170">
						<h2>Tel</h2>
						<p>+82 2-581-2333 (Korean)<br />+82 2-3415-7808 (English)</p>
					</li>
					<li>
						<h2>Fax</h2>
						<ul>
							<li>+82 2-581-1644  </li>
						</ul>
					</li>
				</ul>
			</article>
			<!-- // 내용 ***************** -->         
		</section>  <!--// sub_content -->


<!-- popup -->
<div class="pop_wrap" id="pop_wrap_01" style="display:none;">
    <div class="pop_wrap_alpha"></div>
	<section class="popupContent top">
		<div class="lineBox_input">
			<fieldset class="myinfo" style="margin:0px">
				<div id="map_canvas_pop" class="map" style="width:100%;height:420px; background:#cecece;"></div> 
			</fieldset>
		</div>
		<p class="btn_center">
			<button type="button" onclick="javascript:popupClose();" class="button gray"> 닫기 </button>
		</p>
	</section>
</div>
 <!-- // popup -->

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&region=KR&language=en"> 
</script> 
<script type="text/javascript">
    var StreetViewPanorama = new function () { }

    var globalMap;
    var globalMap2;
    var globalMapPop;
    var globalMarker;
    var globalMarker2;
    var globalMarkerPop;
    var globalGeocoder;

    $(document).ready(function () {
        var w_val = $(window).width();

        $("#map_canvas").attr("width", w_val - 20);

        initialize(37.475315, 126.979821, 37.090924, 126.904129);
    });

    // 맵 초기화
    function initialize(x1, y1, x2, y2) {
        globalGeocoder = new google.maps.Geocoder();

        var latlng = new google.maps.LatLng(x1, y1);
        var latlng2 = new google.maps.LatLng(x2, y2);

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

        var myOptions2 = {
            zoom: 16,
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
            title: "Seoul Office"
            //, icon: "http://" //아이콘을 별도로 줄때 사용
        };

        var myOptions2 = {
            position: globalMap2.getCenter(),
            draggable: false,
            map: globalMap2,
            //icon: "http://sstatic.naver.net/search/img2/ico_bal_a.gif", // 아이콘 설정할 때
            visible: true,
            title: "Headquarter (R&D center)"
            //, icon: "http://" //아이콘을 별도로 줄때 사용
        };

        globalMarker = new google.maps.Marker(myOptions);
        globalMarker2 = new google.maps.Marker(myOptions2);
    }

    function popLocation(x, y) {
        popupClick(1);

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
            title: "서울사무소"
            //, icon: "http://" //아이콘을 별도로 줄때 사용
        };

        globalMarkerPop = new google.maps.Marker(myMarkOptions);
    }
</script>

</asp:Content>