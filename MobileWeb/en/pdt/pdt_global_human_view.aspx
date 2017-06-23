<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="pdt_global_human_view.aspx.cs" Inherits="MobileWeb.en.pdt.pdt_global_human_view" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/en/common/include/header.js" ></script> 	
		<h1 class="acc-hidden">Pharmaceutical</h1>	
		<p class="location">
			<span>Products</span><em>></em>
			<span>International Sales</span><em>></em>
			<strong>Pharmaceutical</strong>
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
						<th>구성</th>
						<td><%=GetData(0, "COMPT")%></td>
					</tr>
					<tr>
						<th>포장단위</th>
						<td><%=GetData(0, "PACK_MEA")%></td>
					</tr>
					<tr>
						<th>정보</th>
						<td><%=GetData(0, "PROD_INFO")%></td>
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
	<script src="<%=GetRoot() %>/en/common/include/footer.js" ></script>


</asp:Content>