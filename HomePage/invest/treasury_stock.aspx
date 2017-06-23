<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="treasury_stock.aspx.cs" Inherits="HomePage.invest.treasury_stock" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content">
			<header>
				<h1 class="pageTitle line">자기주식</h1>
				<p class="location">
				    <a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
                    <a href="/invest/ir_info_list.aspx"><span>투자</span></a><em> > </em>
			        <a href="/invest/stock_info.aspx"><span>주식정보</span></a><em> > </em>
			        <a href="/invest/treasury_stock.aspx"><strong>자기주식</strong></a>
				</p>
			</header>
			<!--  내용  ***************** -->
			<h2 class="pageTitle_02">자기주식현황</h2>
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
	                    if (GetRowCount() > 0)
	                    {
                            string css = "";
                            
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
			<!-- // 내용 ***************** -->         
		</section>  <!--// sub_content -->

</asp:Content>