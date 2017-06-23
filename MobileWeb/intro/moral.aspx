<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="moral.aspx.cs" Inherits="MobileWeb.intro.moral" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/common/include/header.js" ></script> 	
		<h1 class="acc-hidden"> 기업  </h1>	
		<p class="location">
			<span>기업</span>   <em> > </em>
			<strong>기업윤리  </strong>
		</p>
	</header>

	<!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">기업윤리  </h1>	
		<!--   content -->
		<section class="content">
			<div id="no_content">
				<p> 자료 미비페이지입니다 </p>


				
			</div>
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/common/include/footer.js" ></script> 

</asp:Content>