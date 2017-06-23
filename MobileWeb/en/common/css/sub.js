$(function(){
	/***********************************************
	*  gnb
	*************************************************/	
	/* 메뉴 높이갑 추출 */
	//$('.gnb').css({'height':($(document).height())+'px'}); 
	$('.container').css({'height':($(document).height()-30)+'px'}); 

	/* 메뉴 열고 닫기 */
	var open =false;
	var wrap = $('.wrap');       
	$('#j_iconOpen').on( 'click', function(){
		open=!open
		if(open==true){
		 		wrap.addClass('open');	 
			}else{
				wrap.removeClass('open');
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

       
//   로드 후  실행   끝
});



