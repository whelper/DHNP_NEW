<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="pdt_bio_catalog_view.aspx.cs" Inherits="MobileWeb.en.pdt.pdt_bio_catalog_view" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/en/common/include/header.js"></script> 	
		<h1 class="acc-hidden">Catalog Products</h1>	
		<p class="location">
			<span>Products</span><em>></em>
			<span>Bioprocess</span><em>></em>
			<strong>Catalog Products</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/en/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="view_h1 mB10"><%=GetData(0, "TTL")%></h1>	
		<!--   content -->
		<section class="content pB30">
			<h1 class="acc-hidden">상세설명</h1>
			<!-- 슬라이드 사진  -->
			<div id="slider3_btns" class="view_slide_box w600">
                <% 
                    if (GetData(0, "PROD_TYPE").Equals("PROD_NEW"))
                    { 
                %>
				<i class="new"> new </i>
                <%
                    }
                %>
				<ul id="slider1" >
                    <% 
                        if (GetData(0, "THUMBNAIL").Equals("") == false)
                        { 
                    %>
					<li><img src="<%=GetData(0, "THUMBNAIL")%>" alt="" onerror="this.src='<%=GetRoot() %>/common/images/products/no_big.jpg'"/></li>
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
						<col style="width:26%;" />
						<col />
					</colgroup>
					<tr>
						<th>회사소개</th>
						<td><%=GetData(0, "INTRO")%></td>
					</tr>
					<tr>
						<th>주요제품</th>
						<td><%=GetData(0, "CONT")%></td>
					</tr>
				</table>
			</div>
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	<script src="<%=GetRoot() %>/en/common/include/footer.js" ></script> 

</asp:Content>

