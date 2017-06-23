<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="stockholder.aspx.cs" Inherits="MobileWeb.inv.stockholder" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <header class="header">
		<script src="<%=GetRoot() %>/common/include/header.js" ></script> 	
		<h1 class="acc-hidden">투자</h1>	
		<p class="location">
			<span>투자</span><em>></em>
			<span>주식정보</span><em>></em>
			<strong>주식발행</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">주식발행</h1>
		<ul class="tap_3depth mB10">
			<li> <a href="stock_info.aspx">주식발행</a> </li>
			<li> <a href="stockholder.aspx" class="onhover">주주구성</a></li>
			<li> <a href="treasury_stock.aspx">자기주식</a></li>
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
						<th scope="col" rowspan="3"class="left_borNo">성명</th>
						<th scope="col" rowspan="3">관계</th>
						<th scope="col" rowspan="3">주식의 종류</th>
						<th scope="col" colspan="6">소유주식수(지분율)</th>
					</tr>
					<tr>
						<th scope="col" colspan="2">기초</th>
						<th scope="col">증가</th>
						<th scope="col">감소</th>
						<th scope="col" colspan="2">기말</th>
					</tr>
					<tr>
						<th scope="col">주식수</th>
						<th scope="col">지분율</th>
						<th scope="col">주식수</th>
						<th scope="col">주식수</th>
						<th scope="col">주식수</th>
						<th scope="col">지분율</th>
					</tr>
				</thead>
				<tfoot>
					<tr class="total">
						<th colspan="2" rowspan="3" >계</th>
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
		                    <p>내용이 없습니다.</p> 
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