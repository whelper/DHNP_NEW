<%@ Page Title="" Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="pdt_view.aspx.cs" Inherits="MobileWeb.en.pdt.pdt_view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
	<header class="header">
		<script src="<%=GetRoot() %>/en/common/include/header.js"></script> 	
		<h1 class="acc-hidden"><%=categoryName %></h1>	
		<p class="location">
			<span>Products</span><em>></em>
			<span><%=categoryName %></span><%--<em>></em>--%>
			<%--<strong>신제품</strong>--%>
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
				<table border="1" style="100%">
					<colgroup>
						<col style="width:30%;" />
						<col />
					</colgroup>
					<%if (!GetData(0, "CATG_NM1").Equals("")){ %>
					<tr>
						<th>· Category</th>
						<td><%=GetData(0, "CATG_NM1")%></td>
					</tr>
					<%} %>
					<%if (category.Substring(0, 2) != "11") { %>
						<%if (!GetData(0, "INGREDI").Equals("")){ %>
						<tr>
							<th>· Active Ingredients</th>
							<td><%=GetData(0, "INGREDI").Replace("\n","<br />")%></td>
						</tr>
						<%} %>	
						<%if (!Regex.Replace(GetData(0, "USAGE").ToString(), @"<(.|\n)*?>", string.Empty).Equals("")) { %>
						<tr>
							<th>· <%=(category.Substring(0,2) == "14") ? "Overview" : "Indication" %></th>
							<td><%=GetData(0, "USAGE") %></td>
						</tr>
						<%}%> 
						<%if (!GetData(0, "DOSAGE").Equals("")){ %>	
						<tr>
							<th>· Dosage</th>
							<td><%=GetData(0, "DOSAGE")%></td>
						</tr>
						<%} %>
						<%if (!GetData(0, "PACK_MEA").Equals("")){ %>
						<tr>
							<th>· Package</th>
							<td><%=GetData(0, "PACK_MEA")%></td>
						</tr>
						<%} %>
					<%}else{ %><%-- only biopharmaceutical --%>
						<%if (!GetData(0, "SUMR").Equals("")){ %>
						<tr>
							<th>· Overview</th>
							<td><%=GetData(0, "SUMR").Replace("\n","<br />")%></td>
						</tr>
						<%} %>
						<%if (!GetData(0, "USAGE").Equals("")){ %>
						<tr>
							<th>· Contents</th>
							<td><%=GetData(0, "USAGE").Replace("\n","<br />")%></td>
						</tr>
						<%} %>
					<%} %>
				</table>
			</div>
			
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	<script src="<%=GetRoot() %>/en/common/include/footer.js" ></script>
</asp:Content>
