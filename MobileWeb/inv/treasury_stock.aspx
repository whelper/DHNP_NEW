<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="treasury_stock.aspx.cs" Inherits="MobileWeb.inv.treasury_stock" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/common/include/header.js"></script> 	
		<h1 class="acc-hidden">투자</h1>	
		<p class="location">
			<span>투자</span><em>></em>
			<span>주식정보</span><em>></em>
			<strong>자기주식</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden"> 주식발행 </h1>
		<ul class="tap_2depth mB10">
			<li> <a href="stock_info.aspx">주식발행</a></li>
			<li> <a href="treasury_stock.aspx" class="onhover">자기주식</a></li>
		</ul>
		<!--   content -->
		<section class="content pB40 w600 overflow_x">
			<h1 class="acc-hidden">자기주식</h1>
			<table class="table_style_01 th36" width="700">
				<caption class="hidden">자기주식현황표</caption>
				<colgroup>
					<col >
					<col style="width:17%">
					<col style="width:17%">
					<col style="width:17%">
					<col style="width:17%">
					<col style="width:17%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="left_borNo">구분</th>
						<th scope="col" >주주수</th>
						<th scope="col" >비율</th>
						<th scope="col" >주식수</th>
						<th scope="col" >비율</th>
						<th scope="col" >비고</th>
					</tr>
				</thead>
				<tbody>
                    <%
                        string css = "";
                        
	                    if (GetRowCount() > 0)
	                    {
		                    for (int i = 0; i < GetRowCount(); i++)
		                    {
                                if (GetData(i, "TYPE_CD").Equals("합계"))
                                {
                                    css = " class=\"total\"";
                                }
                                else
                                {
                                    css = "";
                                }
                    %>
					<tr<%=css %>>
						<th scope="row"><%=GetData(i, "TYPE_CD")%></th>
						<td><%=GetData(i, "STO_CNT")%></td>
						<td><%=GetData(i, "STO_RATIO")%></td>
						<td><%=GetData(i, "STOK_CNT")%></td>
						<td><%=GetData(i, "STOK_RATIO")%></td>
						<td><%=GetData(i, "REMARK")%></td>
					</tr>
                    <%          
		                    }
	                    }
	                    else
	                    {
                    %>
                    <!-- 내용이 없을 경우  -->
                    <tr >
	                    <td colspan="8" class="no_data"> 
		                    <p > 내용이 없습니다. </p> 
	                    </td>
                    </tr>
                    <% 
	                    }
                    %>
                    <!-- // 내용이 없을 경우  -->
				</tbody>
			</table>	
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	<script src="<%=GetRoot() %>/common/include/footer.js" ></script> 

</asp:Content>