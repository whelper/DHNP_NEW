<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="pdt_bio_catalog_list.aspx.cs" Inherits="MobileWeb.pdt.pdt_bio_catalog_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/common/include/header.js"></script> 	
		<h1 class="acc-hidden">카달로그제품</h1>	
		<p class="location">
			<span>제품</span><em>></em>
			<span>바이오 공정소재</span><em>></em>
			<strong>카달로그제품</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">카달로그제품</h1>	
		<ul class="tap_3depth">
			<li> <a href="pdt_bio_badge_list.aspx">배지</a> </li>
			<li> <a href="pdt_bio_resin_list.aspx">레진</a> </li>
			<li> <a href="pdt_bio_catalog_list.aspx" class="onhover">카달로그제품</a></li>
		</ul>
		<!--   content -->
		<section class="content">
		    <!--  list  -->
		    <div id="list_box" class="list_box">
            <% 
                if (GetDataCount() > 0)
                {
                    for (int i = 0; i < GetDataCount(); i++)
                    {
            %>
                <article class="list_type_img">
					<span class="left_img">
						<i class="new"> new </i>
						<img src="<%=GetData(i, "THUMBNAIL") %>" alt=""  width="107" height="78">
					</span>
					<a href="pdt_bio_catalog_view.aspx?prod_cd=<%=GetData(i, "PROD_CD") %>" class="right_text">
						<h1><%=GetData(i, "TTL") %></h1>
						<p><%=GetData(i, "INTRO") %></p>
					</a>
				</article>
            <% 
                    }
                }
            %>
            </div>
			<!--  //  list  -->

		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/common/include/footer.js" ></script>
     <script src="<%=GetRoot() %>/common/js/spin.min.js" ></script>
</asp:Content>