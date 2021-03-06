﻿<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="pdt_animal_new_list.aspx.cs" Inherits="MobileWeb.en.pdt.pdt_animal_new_list" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/en/common/include/header.js" ></script> 	
		<h1 class="acc-hidden">Animal Health & Nutrition</h1>	
		<p class="location">
			<span>Products</span><em>></em>
			<span>Animal Health & Nutrition</span><em>></em>
			<strong>New Products</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/en/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">New Products</h1>	
		<ul class="tap_2depth">
			<li> <a href="pdt_animal_new_list.aspx" class="onhover">New Products</a></li>
			<li> <a href="pdt_animal_products_list.aspx">Products</a></li>
		</ul>
		<!--   content -->
		<section class="content">
			<div class="lineB">
				<fieldset class="search_products w600">
					<legend class="acc-hidden">제품검색 폼</legend>
					<label for="value_01" class="acc-hidden">제품검색</label>
					<span class="input_bg"><input type="text" id="search_text" name="search_text" runat="server" placeholder="" /></span>
					<button type="button" class="button green" onclick="javascript:search_all();"> Search  </button>
				</fieldset>
			</div>
			
			<div class="text_search clear  mB10 w600">
				<label for="value_02">Types</label>
					<asp:DropDownList ID="catg_no2" runat="server" AutoPostBack="false" />
			</div>
	       	<dl class="text_search_box w600">
	       		 <dt  class="acc-hidden"> 제품명 </dt>
	       		 <dd>
					<ul class="box">
						<li <%if (ProdInitial.Equals("")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('');">A-Z</li>
					    <li <%if (ProdInitial.Equals("A")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('A');">A</li>
					    <li <%if (ProdInitial.Equals("B")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('B');">B</li>
                        <li <%if (ProdInitial.Equals("C")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('C');">C</li>
                        <li <%if (ProdInitial.Equals("D")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('D');">D</li>
                        <li <%if (ProdInitial.Equals("E")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('E');">E</li>
                        <li <%if (ProdInitial.Equals("F")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('F');">F</li>
                        <li <%if (ProdInitial.Equals("G")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('G');">G</li>
                        <li <%if (ProdInitial.Equals("H")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('H');">H</li>
                        <li <%if (ProdInitial.Equals("I")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('I');">I</li>
                        <li <%if (ProdInitial.Equals("J")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('J');">J</li>
                        <li <%if (ProdInitial.Equals("K")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('K');">K</li>
                        <li <%if (ProdInitial.Equals("L")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('L');">L</li>
                        <li <%if (ProdInitial.Equals("M")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('M');">M</li>
					    <li <%if (ProdInitial.Equals("N")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('N');">N</li>
                        <li <%if (ProdInitial.Equals("O")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('O');">O</li>
                        <li <%if (ProdInitial.Equals("P")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('P');">P</li>
                        <li <%if (ProdInitial.Equals("Q")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('Q');">Q</li>
                        <li <%if (ProdInitial.Equals("R")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('R');">R</li>
                        <li <%if (ProdInitial.Equals("S")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('S');">S</li>
                        <li <%if (ProdInitial.Equals("T")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('T');">T</li>
                        <li <%if (ProdInitial.Equals("U")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('U');">U</li>
                        <li <%if (ProdInitial.Equals("V")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('V');">V</li>
                        <li <%if (ProdInitial.Equals("W")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('W');">W</li>
                        <li <%if (ProdInitial.Equals("X")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('X');">X</li>
                        <li <%if (ProdInitial.Equals("Y")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('Y');">Y</li>
                        <li <%if (ProdInitial.Equals("Z")) {%> class="onhover" <%}%>><button type="button" onclick="javascript:search('Z');">Z</li>
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

         var search = function (init_code) {
             var catg_no2 = $('#<%= catg_no2.ClientID %>').val();
             var search_text = $('#<%= search_text.ClientID %>').val();

             location.href = "./pdt_animal_new_list.aspx?prod_initial=" + init_code + "&catg_no2=" + catg_no2 + "&search_text=" + search_text;
         }

         var search_all = function () {

             var catg_no2 = $('#<%= catg_no2.ClientID %>').val();
             var search_text = $('#<%= search_text.ClientID %>').val();
             var init_code = '<%=ProdInitial%>';

             location.href = "./pdt_animal_new_list.aspx?prod_initial=" + init_code + "&catg_no2=" + catg_no2 + "&search_text=" + search_text;
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
        	        , "catg_no1": "2"
                    , "catg_no2": $('#<%= catg_no2.ClientID %>').val()
                    , "prod_type_cd": "PROD_NEW"
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

                        html += '<article class="list_type_img">';
                        html += '	<span class="left_img">';
                        html += '       <i class="new"> new </i>';
                        html += '       <img src="' + PROD_IMG1 + '" alt=""  width="107" height="78" onerror="this.src=\'<%=GetRoot() %>/en/common/images/products/new_no.jpg\'" />';
                        html += '   </span>';
                        html += '   <a href="/en/pdt/pdt_animal_new_view.aspx?prod_cd=' + PROD_CD + '" class="right_text">';
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