<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" EnableEventValidation="false" Inherits="MobileWeb.en.search" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <header class="header">
	    <script src="<%=GetRoot() %>/en/common/include/header.js" ></script> 	
	    <h1 class="acc-hidden"> 통합검색  </h1>	
	    <p class="location">
		    <strong>  통합검색 </strong>
	    </p>
    </header>

    <!-- 오픈시 보일 메뉴 -->
    <nav class="gnb" >
	    <script src="<%=GetRoot() %>/en/common/include/gnb.js" ></script> 	
    </nav>
    <!-- // 오픈시 보일 메뉴  -->

    <!--   width:100% -->
    <section class="container">
		
	    <!--   content -->
	    <section class="content">
		    <div class="">
			    <fieldset class="search_products w600">
				    <legend class="acc-hidden"> 제품검색 폼 </legend>
				    <label for="value_01" class="acc-hidden"> 제품검색 </label>
				    <span class="input_bg">
                        <input type="text" runat="server" id="search_text" placeholder="제품을 검색해 주세요" />
                    </span>
				    <asp:LinkButton ID="btnSearch" runat="server" Text="Search" CssClass="button green" OnClick="btnSearch_Click" style="width:60px;text-align:center" />
			    </fieldset>
		    </div>
	       	
		    <!--  list  -->
		    <div id="list_box" class="list_box"></div>

            <div id="spinner" style="display: none; width:0px; margin:0px auto 17px;"></div>
			<!--  //  list  -->

	    </section> 
	    <!--   // content -->
    </section>

    <!-- //  width:100% -->
    <script src="<%=GetRoot() %>/en/common/include/footer.js" ></script>
     <script src="<%=GetRoot() %>/en/common/js/spin.min.js" ></script>
     <script language="javascript">
         $(document).ready(function () {

             more_list();

             var opts = {
                 lines: 9, // The number of lines to draw
                 length: 5, // The length of each line
                 width: 4, // The line thickness
                 radius: 8, // The radius of the inner circle
                 corners: 1, // Corner roundness (0..1)
                 rotate: 0, // The rotation offset
                 direction: 1, // 1: clockwise, -1: counterclockwise
                 color: '#000', // #rgb or #rrggbb or array of colors
                 speed: 2.2, // Rounds per second
                 trail: 60, // Afterglow percentage
                 shadow: false, // Whether to render a shadow
                 hwaccel: false, // Whether to use hardware acceleration
                 className: 'spinner', // The CSS class to assign to the spinner
                 zIndex: 2e9, // The z-index (defaults to 2000000000)
                 top: 'auto', // Top position relative to parent in px
                 left: 'auto' // Left position relative to parent in px
             };

             var target = document.getElementById('spinner');
             var spinner = new Spinner(opts).spin(target);
         });


         var now_page = 0;

         $(window).scroll(function () {
             if ($(window).scrollTop() == $(document).height() - $(window).height()) {

                 $("#spinner").show();
                 var showTim = function () {
                     more_list();
                     $("#spinner").hide();
                 }
                 setTimeout(showTim, 300);

             }
         });

         var search = function () {
             var search_text = $('#<%= search_text.ClientID %>').val();

             location.href = "/en/search.aspx?search_text=" + search_text;
         }

         function more_list() {

             now_page++;

             $.ajax({
                 type: "POST"
                , cache: false
                , url: "<%=GetRoot() %>/ws/product.asmx/GetProductList"
                , data: {
                    "now_page": now_page
                    , "lang_cd": "ENG"
					, "catg_no1": ""
					, "catg_no2": ""
					, "prod_type_cd": ""
					, "prod_s_init_cd": ''
					, "prod_e_init_cd": ''
					, "prod_tag": $('#<%= search_text.ClientID %>').val()
					, "prod_sorting": ""
                }
                , async: false
                , dataType: "xml" // Debugging을 위해 일단 TEXT로 받는다.
                , success: function (xml, status) {
                    html = '';

                    $(xml).find("Result>List>Products").each(function () {
						var CATE_CD = $(this).children("CATE_CD").text();
						var CATG_NO1 = $(this).children("CATG_NO1").text();
						var PROD_IMG1 = $(this).children("PROD_IMG1").text();
						var PROD_CD = $(this).children("PROD_CD").text();
						var PROD_NM = $(this).children("PROD_NM").text();
						var USAGE = $(this).children("USAGE").text();
						var PROD_TYPE = $(this).children("PROD_TYPE").text();
						var view_url = get_detail_url(CATG_NO1, PROD_TYPE);

                        html += '<article class="list_type_img">';
                        html += '	<span class="left_img">';

                        if (PROD_TYPE == "PROD_NEW") {
                            html += '       <i class="new"> new </i>';
                        }
						html += '       <a href="/en/pdt/pdt_view.aspx?category=' + CATE_CD + '&prod_cd=' + PROD_CD + '"><img src="' + PROD_IMG1 + '" alt=""  width="107" height="78" onerror="this.src=<%=GetRoot() %>/en/common/images/products/new_no.jpg" /></a>';
                        html += '   </span>';
						html += '   <a href="/en/pdt/pdt_view.aspx?category=' + CATE_CD + '&prod_cd=' + PROD_CD + '" class="right_text">';
                        html += '		<h1>' + PROD_NM + '</h1>';
                        html += '		<p>' + USAGE + '</p>';
                        html += '	</a>';
                        html += '</article>';
                    });

                    if (html != '') {

                        $('#list_box').append(html);
                    }

                }
	            , error: function (xhr, textStatus) {
	                alert("네트워크 오류 또는 요청을 처리할 수 없습니다.");
	            }
	            , complete: function (xhr, textStatus) {
	            }
             });
         }

         function get_detail_url(catg_no1, prod_type) {
             var url = "";

             if (catg_no1 == "1") {
                 // 인체 의약품
                 url = "/pdt/pdt_human_products_view.aspx";
             }
             else if (catg_no1 == "2" && prod_type == "PROD_GODL") {
                 // 동물 의약품 > 관납제품
                 url = "/pdt/pdt_animal_delivery_view.aspx";
             }
             else if (catg_no1 == "2") {
                 // 동물 의약품
                 url = "/pdt/pdt_animal_products_view.aspx";
             }
             else if (catg_no1 == "3" && prod_type == "PROD_BADG") {
                 // 바이오 공정소재 > 배지
                 url = "/pdt/pdt_bio_badge_view.aspx";
             }
             else if (catg_no1 == "3" && prod_type == "PROD_REGIN") {
                 // 바이오 공정소재 > 레진
                 url = "/pdt/pdt_bio_resin_view.aspx";
             }
             else if (catg_no1 == "3") {
                 // 바이오공정소재 > 카달로그 제품
                 url = "/pdt/pdt_bio_catalog_view.aspx";
             }
             else if (catg_no1 == "4") {
                 // 수출 인체 의약품
                 url = "/pdt/pdt_global_human_view.aspx";
             }
             else if (catg_no1 == "5") {
                 // 수출 동물 의약품
                 url = "/pdt/pdt_global_animal_view.aspx";
             }
             else if (catg_no1 == "6") {
                 // 건강기능식품
                 url = "/pdt/pdt_health_view.aspx";
             }
             else if (catg_no1 == "7") {
                 // 의료기기
                 url = "/pdt/pdt_medical_view.aspx";
			 }


             return url;
         }
     </script>

</asp:Content>
