$(function(){
	/***********************************************
	*  gnb   container
	*************************************************/	
	/* 메뉴 높이값 추출 */
	$('#no_content').css({'height':($(document).height()-10)+'px'}); 
	//$('.content').css({'min-height':($(document).height()-300)+'px'}); 
	/* 메뉴 열고 닫기 */
	var open =false;
	var wrap = $('.wrap');      

    $(".container").on("click", function () {
        if (wrap.hasClass('open')) wrap.removeClass('open');
    });

    $('#j_iconOpen').on('click', function () {
		open=!open
		if(open==true){
		 		wrap.addClass('open');	 
		 		$(".gnb").show();
			}else{
				wrap.removeClass('open');
				//$(".gnb").hide();
			}
       });
	/* gnb  */
	//$("ul.ly").hide();
	$(".gnb_ul>li>a").each( function() {
		$(this).on('click', function(){
			if($(this).next("ul.ly").is(":visible"))
			{
				$(this).removeClass("onhover");
				$("ul.ly").stop().slideUp("slow"); 
			} else {
			   	 $('.gnb_ul>li>a').removeClass("onhover");
			   	 $("ul.ly").stop().slideUp(200); 
			   	 $(this).addClass("onhover");
			   	 $(this).next("ul.ly").stop().slideDown(200);   // 열려있던 메뉴 닫히고			 
			}
		});
	});

	/* 슬라이드 효과    1번은 메인   2번은 메인 제품소개 배너 3번 은 제품상세페이지 */
	$('#slider1').bxSlider({
		auto: true,
		autoHover:false
	});
	$('#slider2').bxSlider({	
		 infiniteLoop: false,
		 hideControlOnEnd: true
	});

//   로드 후  실행   끝
});

/***    발자취 탭  *******/  
function Content_tap( t1 ) {
	 for (var i=1; i<=10; i++) {
		  if ( i == t1 ) {			  
			   $(".content_0" + i).show(); 
			   $(".tap_0" + i ).addClass("onhover");
		  }else {			
			   $(".content_0" + i).hide();
			   $(".tap_0" + i).removeClass("onhover");
		  }
	 }
}

/***   팝업  *******/
function popupClick(v1) {
	$("#pop_wrap_0"+v1).show();
}

function popupClick2(v1) {
    $("#pop_wrap_" + v1).show();
}

function popupClose(c1) {
	$("#pop_wrap_0"+c1 ).hide();
}

function popupClose2(c1) {
    $("#pop_wrap_" + c1).hide();
}