<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="bio_rnd.aspx.cs" Inherits="MobileWeb.en.pdt.bio_rnd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
	<header class="header">
		<script src="<%=GetRoot() %>/en/common/include/header.js"></script> 	
		<h1 class="acc-hidden">Bio</h1>	
		<p class="location">
			<span>Products</span><em>></em>
			<span>Bio</span><em>></em>
			<strong>R&D</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/en/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">연구분야</h1>	
		<ul class="tap_3depth">
			<li style="width:50%"> <a href="bio_rnd.aspx?menu=0302" class="onhover">R&D</a></li>
			<li style="width:50%"> <a href="pdt_list.aspx?category=11&menu=0301">Serum Free Media</a></li>
		</ul>
		<section class="content">
			<div><img src="/en/common/images/m_bio01.jpg" /></div>
		</section>
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/common/include/footer.js" ></script>
     
</asp:Content>
