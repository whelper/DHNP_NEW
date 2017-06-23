<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="stockholder.aspx.cs" Inherits="HomePage.en.invest.stockholder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
			<header>
				<h1 class="pageTitle line">Number of Issued Shares</h1>
				<p class="location">
					<a href="/en/index.aspx"><span><img src="/en/common/images/common/i_home.png" alt="home" /></span></a>
                    <a href="/en/invest/ir_info_list.aspx"><span>Investors</span></a><em> > </em>
			        <a href="/en/invest/stock_info.aspx"><span>Shareholder Services</span></a><em> > </em>
			        <a href="/en/invest/stockholder.aspx"><strong>Number of Issued Shares</strong></a>
				</p>
			</header>
			<!--  내용  ***************** -->
			
			<p class="money_tit"><span class="left"></span><span class="right">( 단위 : 주, % )</span></p>
			<table class="table_style_01 juju" border="1">
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
						<th scope="col">Percentage of Shareholding</th>
						<th scope="col">Percentage of Shareholding</th>
						<th scope="col">Percentage of Shareholding</th>
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
		                    <p>내용이 없습니다.</p> 
	                    </td>
                    </tr>
                    <% 
	                    }
                    %>
                    <!-- // 내용이 없을 경우  -->
				</tbody>
			</table>
			<!-- // 내용 ***************** -->         
		</section>  <!--// sub_content -->
</asp:Content>