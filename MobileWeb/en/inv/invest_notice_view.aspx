<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="invest_notice_view.aspx.cs" Inherits="MobileWeb.en.inv.invest_notice_view" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/common/include/header.js" ></script> 	
		<h1 class="acc-hidden">투자</h1>	
		<p class="location">
			<span>투자</span><em>></em>
			<strong>공고사항</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">공고사항</h1>
		<!--   content -->
		<section class="content pB20 ">
			<header class="title_view"> 
				<h1><%=GetData(0, "TTL", 86) %></h1>
			    <span><%=GetData(0, "REG_DT")%></span>
			</header>
			<div class="view_area w600">
				<!-- 상세내용  -->
				<div class="text">
					<%=GetData(0, "CONT")%>
				</div>
				<!-- // 상세내용  -->
			</div>
			<div class="btn_center mT30">
				<button type="button" class="button01 prev mR5"><em> <  </em> <span> 이전글 </span></button>
				<button type="button" onclick="javascript:history.back();" class="button01 next mR5"><span> 목록</span></button>
				<button type="button" class="button01 next"><span> 다음글</span><em>  > </em> </button>				
			</div>	
					
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/common/include/footer.js" ></script> 

</asp:Content>