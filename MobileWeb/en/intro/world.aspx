<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="world.aspx.cs" Inherits="MobileWeb.en.intro.world" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/en/common/include/header.js" ></script> 	
		<h1 class="acc-hidden"> 기업  </h1>	
		<p class="location">
			<span>기업</span>   <em> > </em>
			<strong>경영철학</strong>
		</p>
	</header>

	<!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/en/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">경영철학</h1>	
		<!--   content -->
		<section class="content">
			<div id="no_content">
				<p> 자료 미비페이지입니다 </p>


				
			</div>
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/en/common/include/footer.js" ></script> 

</asp:Content>