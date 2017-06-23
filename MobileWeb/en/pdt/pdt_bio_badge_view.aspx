<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="pdt_bio_badge_view.aspx.cs" Inherits="MobileWeb.en.pdt.pdt_bio_badge_view" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/en/common/include/header.js"></script> 	
		<h1 class="acc-hidden">Cell Culture Media</h1>
		<p class="location">
			<span>Products</span><em>></em>
			<span>Bioprocess</span><em>></em>
			<strong>Cell Culture Media</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/en/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="view_h1 mB10"><%=GetData(0, "PROD_NM")%></h1>	
		<!--   content -->
		<section class="content pB30">
			<h1 class="acc-hidden">상세설명</h1>
			<!-- 슬라이드 사진  -->
			<div id="slider3_btns" class="view_slide_box w600">
				<% 
                    if (GetData(0, "PROD_TYPE").Equals("PROD_NEW"))
                    { 
                %>
				<i class="new"> new </i>
                <%
                    }
                %>
				<ul id="slider1" >
                    <% 
                        if (GetData(0, "PROD_IMG1").Equals("") == false)
                        { 
                    %>
					<li><img src="<%=GetData(0, "PROD_IMG1")%>" alt="" onerror="this.src='<%=GetRoot() %>/common/images/products/no_big.jpg'"/></li>
                    <%
                        } 
                        if (GetData(0, "PROD_IMG2").Equals("") == false)                            
                        { 
                    %>
					<li><img src="<%=GetData(0, "PROD_IMG2")%>" alt="" onerror="this.src='<%=GetRoot() %>/common/images/products/no_big.jpg'"/></li>
                    <%
                        } 
                        if (GetData(0, "PROD_IMG3").Equals("") == false)                            
                        { 
                    %>
					<li><img src="<%=GetData(0, "PROD_IMG3")%>" alt="" onerror="this.src='<%=GetRoot() %>/common/images/products/no_big.jpg'"/></li>
                    <%
                        } 
                        if (GetData(0, "PROD_IMG4").Equals("") == false)                            
                        { 
                    %>
					<li><img src="<%=GetData(0, "PROD_IMG4")%>" alt="" onerror="this.src='<%=GetRoot() %>/common/images/products/no_big.jpg'"/></li>
                    <%
                        }
                        if (GetData(0, "PROD_IMG5").Equals("") == false)
                        { 
                    %>
					<li><img src="<%=GetData(0, "PROD_IMG5")%>" alt="" onerror="this.src='<%=GetRoot() %>/common/images/products/no_big.jpg'"/></li>
                    <% } %>
				</ul>
			</div>	
			<div class="sns w600"> 
				<a href="#" class="i_f" data-href="<%=GetWebpageFullURI()%>" data-type="button_count"><span>페이스북</span></a>
				<a href="https://twitter.com/share" class="i_t" data-url="<%=GetWebpageFullURI()%>"><span>트위터</span></a>
				<a href="#" class="i_c"><span>링크복사</span></a>
			</div>
			<!-- // 슬라이드 사진  -->
			<div class="view_text_01 mB5 ">
				<table border="1" >
					<colgroup>
						<col style="width:26%;" />
						<col />
					</colgroup>
					<tr>
						<th>분류</th>
						<td><%=GetData(0, "CATG_NM2")%></td>
					</tr>
					<tr>
						<th>분류번호</th>
						<td><%=GetData(0, "CATG_NO")%></td>
					</tr>
					<tr>
						<th>개요</th>
						<td><%=GetData(0, "SUMR")%></td>
					</tr>
				</table>
			</div>
			<div class="view_text_02 w600">
				<h2 class="title"> 주요정보 </h2>
				<dl class="info_dl">
					<dd><%=GetData(0, "USAGE") %></dd>
				</dl>
			</div>
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	<script src="/en/common/include/footer.js" ></script> 

    <script>        !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } } (document, 'script', 'twitter-wjs');</script>
    <script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1";
            fjs.parentNode.insertBefore(js, fjs);
        } (document, 'script', 'facebook-jssdk'));
    </script>

</asp:Content>