<%@ Page Title="" Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="pdt_view.aspx.cs" Inherits="MobileWeb.pdt.pdt_view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
	<header class="header">
		<script src="<%=GetRoot() %>/common/include/header.js"></script> 	
		<h1 class="acc-hidden"><%=categoryName %></h1>	
		<p class="location">
			<span>제품</span><em>></em>
			<span><%=categoryName %></span><%--<em>></em>--%>
			<%--<strong>신제품</strong>--%>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
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
				<i class="new">new</i>
				<%
                string img1Big = GetData(0, "PROD_IMG1").Equals("") ? "/common/images/products/no_big.jpg" : GetData(0, "PROD_IMG1");
                string img1 = GetData(0, "PROD_IMG1").Equals("") ? "/common/images/products/no_small.jpg" : GetData(0, "PROD_IMG1");
                string img2 = GetData(0, "PROD_IMG2").Equals("") ? "/common/images/products/no_small.jpg" : GetData(0, "PROD_IMG2");
                string img3 = GetData(0, "PROD_IMG3").Equals("") ? "/common/images/products/no_small.jpg" : GetData(0, "PROD_IMG3");
                string img4 = GetData(0, "PROD_IMG4").Equals("") ? "/common/images/products/no_small.jpg" : GetData(0, "PROD_IMG4");
                string img5 = GetData(0, "PROD_IMG5").Equals("") ? "/common/images/products/no_small.jpg" : GetData(0, "PROD_IMG5");
				string[] thumb = { img1,img2,img3,img4,img5 };
				%>
				<ul id="slider1" >
                    <%
						foreach (string s in thumb){
							if (s == "/common/images/products/no_small.jpg") continue;
					%>
					<li><img src="<%=s%>" alt="" onerror="this.src='<%=GetRoot() %>/common/images/products/no_big.jpg'"/></li>
					<%
						}
					%>
					
					
				</ul>
			</div>	
			<div class="sns w600">
				<a href="#" class="i_c"><span>링크복사</span></a>
			</div>
			<!-- // 슬라이드 사진  -->
			<div class="view_text_01 mB5 ">
				<table border="1" >
					<colgroup>
						<col style="width:30%;" />
						<col />
					</colgroup>
					<%if (!GetData(0, "PROD_DIV_NM").Equals("")){ %>
					<tr>
						<th>구분</th>
						<td><%=GetData(0, "PROD_DIV_NM")%></td>
					</tr>
					<%} %>
					<%if (!GetData(0, "CATG_NM1").Equals("") && category.Substring(0,2) !="02"){ %>
					<tr>
						<th>분류</th>
						<td><%=GetData(0, "CATG_NM1")%></td>
					</tr>
					<%} %>
					<%if (!GetData(0, "CATG_NO").Equals("0")){ %>
					<tr>
						<th>분류번호</th>
						<td><%=GetData(0, "CATG_NO")%></td>
					</tr>
					<%} %>
					<%if (!GetData(0, "IDENT_NUMBER").Equals("")){ %>
					<tr>
						<th>물품식별번호</th>
						<td><%=GetData(0,"IDENT_NUMBER").Replace("\n","<br />")%></td>
					</tr>
					<%} %>
					<%if (!GetData(0, "COMPT").Equals("")){ %>
					<tr>
						<th>구성</th>
						<td><%=GetData(0,"COMPT")%></td>
					</tr>
					<%} %>
					<%if (!GetData(0, "INGREDI").Equals("")){ %>
					<tr>
						<th>주요성분</th>
						<td><%=GetData(0, "INGREDI").Replace("\n","<br />")%></td>
					</tr>
					<%} %>
					<%if (!GetData(0, "TEMPER").Equals("")){ %>	
					<tr>
						<th>성상</th>
						<td><%=GetData(0, "TEMPER")%></td>
					</tr>
					<%} %>
					<%if (!GetData(0, "INSU_CD").Equals("")){ %>
					<tr>
						<th>보험코드</th>
						<td><%=GetData(0, "INSU_CD")%></td>
					</tr>
					<%} %>
					<%if (!GetData(0, "PMEDI").Equals("")){ %>
					<tr>
						<th>약가</th>
						<td><%=GetData(0, "PMEDI")%></td>
					</tr>
					<%} %>
					<%if (!GetData(0, "PACK_MEA").Equals("")){ %>
					<tr>
						<th>포장단위</th>
						<td><%=GetData(0, "PACK_MEA")%></td>
					</tr>
					<%} %>
					<%if (!GetData(0, "PROD_INFO").Equals("")){ %>
					<tr>
						<th>정보</th>
						<td><%=GetData(0, "PROD_INFO")%></td>
					</tr>
					<%} %>
					<%if (!GetData(0, "SUMR").Equals("")){ %>
					<tr>
						<th>개요</th>
						<td><%=GetData(0, "SUMR")%></td>
					</tr>
					<%} %>
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
	<script src="<%=GetRoot() %>/common/include/footer.js" ></script>
</asp:Content>
