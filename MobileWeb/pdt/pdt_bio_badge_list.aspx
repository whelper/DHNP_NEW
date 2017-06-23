<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="pdt_bio_badge_list.aspx.cs" Inherits="MobileWeb.pdt.pdt_bio_badge_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/common/include/header.js"></script> 	
		<h1 class="acc-hidden">배지</h1>	
		<p class="location">
			<span>제품</span><em>></em>
			<span>바이오 공정소재</span><em>></em>
			<strong>배지</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">배지  </h1>	
		<ul class="tap_3depth">
			<li> <a href="pdt_bio_badge_list.aspx" class="onhover">배지</a></li>
			<li> <a href="pdt_bio_resin_list.aspx">레진</a></li>
			<li> <a href="pdt_bio_catalog_list.aspx">카달로그제품</a></li>
		</ul>
<!--   content -->
		<section class="content">
			<div class="lineB">
				<fieldset class="search_products w600">
					<legend class="acc-hidden">제품검색 폼</legend>
					<label for="value_01" class="acc-hidden">제품검색</label>
					<span class="input_bg"><input type="text" id="search_text" name="search_text" runat="server" placeholder="제품을 검색해 주세요" /></span>
                    <button type="button" class="button green" onclick="javascript:search_all();"> Search  </button>
				</fieldset>
			</div>
	       	<dl class="text_search_box w600">
	       		 <dt  class="acc-hidden"> 제품명 </dt>
	       		 <dd>
					<ul class="box">
						<li<%if (ProdInitial.Equals("")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('');">전체</li>
					    <li<%if (ProdInitial.Equals("INIT_1")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_1');">가</li>
					    <li<%if (ProdInitial.Equals("INIT_2")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_2');">나</li>
                        <li<%if (ProdInitial.Equals("INIT_3")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_3');">다</li>
                        <li<%if (ProdInitial.Equals("INIT_4")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_4');">라</li>
                        <li<%if (ProdInitial.Equals("INIT_5")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_5');">마</li>
                        <li<%if (ProdInitial.Equals("INIT_6")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_6');">바</li>
                        <li<%if (ProdInitial.Equals("INIT_7")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_7');">사</li>
                        <li<%if (ProdInitial.Equals("INIT_8")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_8');">아</li>
                        <li<%if (ProdInitial.Equals("INIT_9")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_9');">자</li>
                        <li<%if (ProdInitial.Equals("INIT_10")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_10');">차</li>
                        <li<%if (ProdInitial.Equals("INIT_11")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_11');">카</li>
                        <li<%if (ProdInitial.Equals("INIT_12")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_12');">타</li>
                        <li<%if (ProdInitial.Equals("INIT_13")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_13');">파</li>
					    <li<%if (ProdInitial.Equals("INIT_14")) {%> class="onhover"<%} %>><button type="button" onclick="javascript:search('INIT_14');">하</li>
					</ul>
	       		 </dd>
		        </dl>
		       <!--  list  -->
		       <div id="list_box" class="list_box"></div>

               <div id="spinner" style="display: none; width:0px; margin:0px auto 17px;"></div>
			   <!--  //  list  -->

		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/common/include/footer.js" ></script>
     <script src="<%=GetRoot() %>/common/js/spin.min.js" ></script>
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

         var search = function (init_code) {

             var search_text = $('#<%= search_text.ClientID %>').val();

             location.href = "./pdt_bio_badge_list.aspx?prod_initial=" + init_code + "&search_text=" + search_text;
         }

         var search_all = function () {

             var search_text = $('#<%= search_text.ClientID %>').val();
             var init_code = '<%=ProdInitial%>';

             location.href = "./pdt_bio_badge_list.aspx?prod_initial=" + init_code + "&search_text=" + search_text;
         }

         function more_list() {

             now_page++;

             $.ajax({
                 type: "POST"
                , cache: false
                , url: "<%=GetRoot() %>/ws/product.asmx/GetProductList"
                , data: {
                    "now_page": now_page
                    , "lang_cd": "KOR"
        	        , "catg_no1": "3"
                    , "catg_no2": ""
                    , "prod_type_cd": "PROD_BADG"
                    , "prod_s_init_cd": '<%= Request["prod_initial"] %>'
                    , "prod_e_init_cd": '<%= Request["prod_initial"] %>'
                    , "prod_tag": $('#<%= search_text.ClientID %>').val()
                }
                , async: false
                , dataType: "xml" // Debugging을 위해 일단 TEXT로 받는다.
                , success: function (xml, status) {
                    html = '';

                    $(xml).find("Result>List>Products").each(function () {
                        var PROD_IMG1 = $(this).children("PROD_IMG1").text();
                        var PROD_CD = $(this).children("PROD_CD").text();
                        var PROD_NM = $(this).children("PROD_NM").text();
                        var USAGE = $(this).children("USAGE").text();
                        var PROD_TYPE = $(this).children("PROD_TYPE").text();

                        html += '<article class="list_type_img">';
                        html += '	<span class="left_img">';
                        if (PROD_TYPE == "PROD_NEW") {
                            html += '       <i class="new"> new </i>';
                        }
                        html += '       <img src="' + PROD_IMG1 + '" alt=""  width="107" height="78" onerror="this.src=<%=GetRoot() %>/common/images/products/new_no.jpg" />';
                        html += '   </span>';
                        html += '   <a href="/pdt/pdt_bio_badge_view.aspx?prod_cd=' + PROD_CD + '" class="right_text">';
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
     </script>

</asp:Content>
