<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="invest_ir_view.aspx.cs" Inherits="MobileWeb.inv.invest_ir_view" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/common/include/header.js" ></script> 	
		<h1 class="acc-hidden">투자</h1>	
		<p class="location">
			<span>투자</span><em>></em>
			<strong>경영정보</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<header class="title_view"> 
			<h1><%=GetData(0, 0, "TTL", 86)%></h1>
			<span><%=GetData(0, 0, "REG_DT")%></span>
		</header>
		<!--   content -->
		<section class="content pB20 ">
			<h1 class="acc-hidden"> 상세내용  </h1>
			<div class="view_area w600">
				<!-- 상세내용  -->
				<div class="text">
					<%=GetData(0, 0, "CONT")%>
				</div>
				<!-- // 상세내용  -->
			</div>
			<div class="btn_center mT30">
            <% 
                if ("0".Equals(GetData(2, 0, "PREV_SEQ_NO")) == false)
                {
            %>
				<button type="button" class="button01 prev mR5" onclick="javascript:location.href='invest_ir_view.aspx?seq_no=<%=GetData(2, 0, "PREV_SEQ_NO")%>'"><em> <  </em> <span> 이전글 </span></button>
            <% 
                }
            %>
				<button type="button" onclick="javascript:location.href='invest_ir_list.aspx'" class="button01 mR5"><span> 목록</span></button>

            <% 
                if ("0".Equals(GetData(1, 0, "NEXT_SEQ_NO")) == false)
                {
            %>
				<button type="button" class="button01 next" onclick="javascript:location.href='invest_ir_view.aspx?seq_no=<%=GetData(1, 0, "NEXT_SEQ_NO")%>'"><span> 다음글</span><em>  > </em> </button>				
            <% 
                }
            %>
			</div>			
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/common/include/footer.js" ></script> 

</asp:Content>