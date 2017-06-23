<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="treasury_stock.aspx.cs" Inherits="HomePage.en.invest.treasury_stock" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content">
			<header>
				<h1 class="pageTitle line">Treasury Shares</h1>
				<p class="location">
				    <a href="/en/index.aspx"><span><img src="/en/common/images/common/i_home.png" alt="home" /></span></a>
                    <a href="/en/invest/ir_info_list.aspx"><span>Investors</span></a><em> > </em>
			        <a href="/en/invest/stock_info.aspx"><span>Shareholder Services</span></a><em> > </em>
			        <a href="/en/invest/treasury_stock.aspx"><strong>Treasury Shares</strong></a>
				</p>
			</header>
			<!--  내용  ***************** -->
			
			<p class="money_tit"><span class="left"></span></p>
			<table class="table_style_01 th36" border="1" >
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
						<th scope="col" class="left_borNo">Classification</th>
						<th scope="col" >Number of Shareholders</th>
						<th scope="col" >Percentage</th>
						<th scope="col" >Number of Shares</th>
						<th scope="col" >Percentage</th>
						<th scope="col" >Remarks</th>
					</tr>
				</thead>
				<tbody>
                    <%                        
	                    if (GetRowCount() > 0)
	                    {
                            string css = "";
                            
		                    for (int i = 0; i < GetRowCount(); i++)
		                    {
                                if (GetData(i, "TYPE_CD").Equals("Total"))
                                {
                                    css = " class=\"total\"";
                                }
                                else
                                {
                                    css = "";
                                }
                    %>
					<tr<%=css%>>
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
			<!-- // 내용 ***************** -->         
		</section>  <!--// sub_content -->

</asp:Content>