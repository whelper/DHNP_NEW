<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="stockholder.aspx.cs" Inherits="MobileWeb.en.inv.stockholder" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <header class="header">
		<script src="<%=GetRoot() %>/en/common/include/header.js" ></script> 	
		<h1 class="acc-hidden">Investors</h1>	
		<p class="location">
			<span>Investors</span><em>></em>
            <span>Shareholder Services</span><em>></em>
			<strong>Number of Issued</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/en/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">주식발행</h1>
		<ul class="tap_3depth mB10">
			<li> <a href="stock_info.aspx">Major Shareholders</a> </li>
			<li> <a href="stockholder.aspx" class="onhover">Number of Issued Shares</a></li>
			<li> <a href="treasury_stock.aspx">Treasury Shares</a></li>
		</ul>
		<!--   content -->
		<section class="content pB40 w600 overflow_x">
			<h1 class="acc-hidden">자기주식</h1>
			<table class="table_style_01 juju" width="700">
				<caption class="hidden">주식소유현황표</caption>
				<colgroup>
					<col >
					<col style="width:10%">
					<col style="width:10%">
					<col style="width:11%">
					<col style="width:11%">
					<col style="width:11%">
					<col style="width:11%">
					<col style="width:11%">
					<col style="width:11%">
				</colgroup> 
				<thead>
					<tr>
						<th scope="col" rowspan="3"class="left_borNo">Name</th>
						<th scope="col" rowspan="3">Relation</th>
						<th scope="col" rowspan="3">Class of Shares</th>
						<th scope="col" colspan="6">Number of Holding Stocks(Percentage of Shareholding)</th>
					</tr>
					<tr>
						<th scope="col" colspan="2">Orginal</th>
						<th scope="col">Increase</th>
						<th scope="col">Decrease</th>
						<th scope="col" colspan="2">End of Term</th>
					</tr>
					<tr>
						<th scope="col">Number of Shares</th>
						<th scope="col">Percentage of Shareholding</th>
						<th scope="col">Number of Shares</th>
						<th scope="col">Number of Shares</th>
						<th scope="col">Number of Shares</th>
						<th scope="col">Percentage of Shareholding</th>
					</tr>
				</thead>
				<tfoot>
					<tr class="total">
						<th colspan="2" rowspan="3" >Total</th>
						<td class="center"><%=GetData(1, 0, "T_STOK_TYPE_CD")%></td>
						<td><%=GetData(1, 0, "T_BASIC_STCK_CNT")%></td>
						<td><%=GetData(1, 0, "T_BASIC_SHARE_RATIO")%></td>
						<td><%=GetData(1, 0, "T_INC_STCK_CNT")%></td>
						<td><%=GetData(1, 0, "T_DECR_STCK_CNT")%></td>
						<td><%=GetData(1, 0, "T_END_TERM_STCK_CNT")%></td>
						<td><%=GetData(1, 0, "T_END_TERM_SHARE_RATIO")%></td>
					</tr>
					<tr class="total">
						<td class="center"><%=GetData(1, 1, "T_STOK_TYPE_CD")%></td>
						<td><%=GetData(1, 1, "T_BASIC_STCK_CNT")%></td>
						<td><%=GetData(1, 1, "T_BASIC_SHARE_RATIO")%></td>
						<td><%=GetData(1, 1, "T_INC_STCK_CNT")%></td>
						<td><%=GetData(1, 1, "T_DECR_STCK_CNT")%></td>
						<td><%=GetData(1, 1, "T_END_TERM_STCK_CNT")%></td>
						<td><%=GetData(1, 1, "T_END_TERM_SHARE_RATIO")%></td>
					</tr>
					<tr class="total">
						<td class="center"><%=GetData(1, 2, "T_STOK_TYPE_CD")%></td>
						<td><%=GetData(1, 2, "T_BASIC_STCK_CNT")%></td>
						<td><%=GetData(1, 2, "T_BASIC_SHARE_RATIO")%></td>
						<td><%=GetData(1, 2, "T_INC_STCK_CNT")%></td>
						<td><%=GetData(1, 2, "T_DECR_STCK_CNT")%></td>
						<td><%=GetData(1, 2, "T_END_TERM_STCK_CNT")%></td>
						<td><%=GetData(1, 2, "T_END_TERM_SHARE_RATIO")%></td>
					</tr>
				</tfoot>
				<tbody>
                    <%  
    
	                    if (GetRowCount(0) > 0)
	                    {
		                    for (int i = 0; i < GetRowCount(0); i++)
		                    {
                    %>
					<tr>
						<td class="left_borNo center"><%=GetData(0, i, "NM")%></td>
						<td class="center"><%=GetData(0, i, "REL")%></td>
						<td class="center"><%=GetData(0, i, "STOK_TYPE_CD")%></td>
						<td><%=GetData(0, i, "BASIC_STCK_CNT")%></td>
						<td><%=GetData(0, i, "BASIC_SHARE_RATIO")%></td>
						<td><%=GetData(0, i, "INC_STCK_CNT")%></td>
						<td><%=GetData(0, i, "DECR_STCK_CNT")%></td>
						<td><%=GetData(0, i, "END_TERM_STCK_CNT")%></td>
						<td><%=GetData(0, i, "END_TERM_SHARE_RATIO")%></td>
					</tr>
                    <% 
		                    }
	                    }
	                    else
	                    {
                    %>
                    <!-- 내용이 없을 경우  -->
                    <tr >
	                    <td colspan="11" class="no_data"> 
		                    <p>No data</p> 
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
	 <script src="<%=GetRoot() %>/en/common/include/footer.js" ></script>

</asp:Content>