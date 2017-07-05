$(function () {
    /*******  gnb 메뉴 **********/
    $('.ly').stop().hide();
    $(".gnb>ul>li>a").each(function (e) {
        $(this).on('focus mouseover', function () {
            $('.header_bg').stop().animate({ height: 320 }, 200, function () {
                $('.ly').stop().slideDown(200);
            });   // 오버시
        });
    });
    //  메인 네비게이션 bg bar
    $(".header_bg").on('focusout mouseleave', function () {
        $('.ly').stop().slideUp(100);
        $('.header_bg').stop().animate({ height: 57 });
    });
    /******  snb 메뉴 *********/
    $('.snb>ul>li>a').each(function () {
        $(this).on('click', function () {
            if ($(this).next("ul.sy").is(":visible"))    //  if ($(this).next("ul.sy").is(":visible") == true) 
            {
                $("ul.sy").stop().slideUp("slow");
                $(this).removeClass("onhover");
            } else {
                $('.snb>ul>li>a').removeClass("onhover");
                $("ul.sy").stop().slideUp("slow");
                $(this).next("ul.sy").stop().slideDown("slow");   // 열려있던 메뉴 닫히고
                $(this).addClass("onhover");
            }
        });
    });


    /******* 제품  사진 ************/
    //  제품 리스트 2개일때  
    //$('.list_Item:even').css("margin-right", "33px");
    //  제품 리스트 3개일때 
    //$('.list_Item.about').css("margin-right", "30px");
    $('.list_Item.about:nth-child(3n+3)').css("margin-right", "0");
    //  제품 리스트 4개일때 
    $('.list_Item.total').css("margin-right", "14px");
    $('.list_Item.total:nth-child(4n)').css("margin-right", "0");
    // 제품 상세보기 -  사진 갤러리 
    $('#thumbs').delegate('img', 'click', function () {
        $('#largeImage').attr('src', $(this).attr('src').replace('small', 'big'));
        $('#largeImage').parent().attr('href', $(this).attr('src').replace('small', 'big')); ;
        //$('#description').html($(this).attr('alt'));
    });

    /******* table   ************/
    var table_a = $("#j_table button"),
	      table_content = $("#j_table .content_view");

    table_a.on('click', function (e) {
        e.preventDefault();
        table_content.hide();      // 모든  컨텐츠은 안보이고 
        table_content.prev().removeClass("onhover");   // 활성화 삭제하고 

        if ($(this).parents().next().is(':hidden') == true) {
            $(this).parents().addClass("onhover");    // tr 에  활성화  
            $(this).parents().next().show();          //   tr.contrnt_view
        }
    });

    /** 이미지 파일 로드하기  01번 소스 (아래에 2번소스 ) **/
    $('.btn_upfile').on('click', function () {
        $(this).siblings('.realupload').trigger('click');
    });

    $('.ibtn_x').on('click', function () {
        $('.ibtn_x').addClass('off');
        $('.add_thumb').addClass('off').find('img').remove();
        $('.realupload ').val('');
    });


    /***********************************************
    *  quick 
    *************************************************/
    $(document).ready(function () {
        var quick_menu = $('#quick_menu');
        var quick_top = 150;

        var quick_bottom_limit = $('.wrap').height() - quick_top - quick_menu.height() - $('.footer').height() - 40;

        //quick_menu.css('top', $(window).height() - quick_bottom_limit );
        //quick_menu.animate( { "top": $(document).scrollTop() + quick_top +"px" }, 500 );
        $(window).scroll(function () {
            quick_menu.stop();

            if (quick_bottom_limit < $(window).scrollTop()) {

                quick_menu.animate({ "top": quick_bottom_limit + quick_top + "px" }, 1000);
            } else {

                quick_menu.animate({ "top": $(window).scrollTop() + quick_top + "px" }, 1000);
            }

            //console.log(quick_bottom_limit + ' , ' + $(document).scrollTop() );
        });
    })

    // 로딩후 실행 끝 *************************// 
});

/** 이미지 파일 로드하기  2번소스  **/  
$.fn.extend({
    // Upload preview Function
    displayImage : function(file) {

        if (typeof FileReader !== "undefined") {
            // var container = document.getElementsByClassName(classname),
            //     img = document.createElement("img"),
            //     reader;
            var container = $('.add_thumb'),
                img = document.createElement("img"),
                reader;


            //console.log($(this));
            container.append(img);
            reader = new FileReader();
            reader.onload = (function (theImg) {
                return function (evt) {
                    theImg.src = evt.target.result;
                };
            }(img));
            reader.readAsDataURL(file);
        }
    }
});
/** // 이미지 파일 로드하기  2번소스  **/

function changeImage(input, previewer) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $("#preview").empty();
            $("#preview").append("<img src='" + e.target.result + "' />");
            //$('#blah').attr('src', e.target.result);
        }
     
        reader.readAsDataURL(input.files[0]);
        $('.add_thumb').removeClass('off');
        $('.ibtn_x').removeClass('off');
    }

    /*
    var ua = window.navigator.userAgent;

    if (ua.indexOf("MSIE") > -1) {//ie일때
        var file = inputfile;
        //console.log(file.name + "\n" + file.type + "\n" + file.size + "\n" + file.lastModifiedDate); // upfile var

        $(this).displayImage(file);
        $('.add_thumb').removeClass('off');
        $('.ibtn_x').removeClass('off');
    } else {
        var file = $(inputfile)[0].files[0];
        //console.log(file.name + "\n" + file.type + "\n" + file.size + "\n" + file.lastModifiedDate); // upfile var

        $(this).displayImage(file);
        $('.add_thumb').removeClass('off');
        $('.ibtn_x').removeClass('off');
    }
    */
}

/***    제품  탭 컨텐츠  *******/  
function changeContent_tap( pp1 ) {
	for (var i=1; i<=10; i++) { 
		if (i == pp1) {
			$(".tab_content_0" + i ).show();
			$("#tap_0" + i ).attr('class', 'onhover');
		} else {
			$(".tab_content_0" + i ).hide();
			$("#tap_0" + i ).attr('class', 'none');
		}
	}
}
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
/***  메인 팝업  *******/
function popupClick(v1) {
	$(".pop_wrap").hide();
	$("#pop_wrap_0"+v1 ).show( "slow" ); // 전체팝업 열리고
	//$(".popupContent").draggable({handle: 'h1'}); // 팝업드래그,  {handle: 'h1'} 는 마우스드래그할 영역
}
function popupClose() {
	//$(".pop_wrap").html("");
	$(".pop_wrap").hide();	
}
/***  입사 지원  팝업  *******/
function jop_popupClick(v1) {
	$("#pop_wrap_0"+v1).show( "slow" ); // 전체팝업 열리고
	$("#popupContainer_0"+v1 ).stop().show( 'blind ');
}
function jop_popupClose( c1 ) {
	$("#pop_wrap_0"+c1 ).hide( );
}

$(".pop_wrap").on( 'click' , function(){
	$(".pop_wrap").hide();
})




