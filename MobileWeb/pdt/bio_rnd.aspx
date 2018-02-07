<%@ Page Title="" Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="bio_rnd.aspx.cs" Inherits="MobileWeb.pdt.bio_rnd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
	<header class="header">
		<script src="<%=GetRoot() %>/common/include/header.js"></script> 	
		<h1 class="acc-hidden">바이오 의약품</h1>	
		<p class="location">
			<span>제품</span><em>></em>
			<span>바이오 의약품</span><em>></em>
			<strong>연구분야</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">연구분야</h1>	
		<ul class="tap_3depth">
			<li style="width:50%"> <a href="pdt_list.aspx?category=03&menu=0301">제품군</a></li>
			<li style="width:50%"> <a href="bio_rnd.aspx?menu=0302" class="onhover">연구분야</a></li>
		</ul>
		<section class="content">
			<div><img src="/common/images/logo.png" /></div>
		</section>
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/common/include/footer.js" ></script>
     
</asp:Content>
