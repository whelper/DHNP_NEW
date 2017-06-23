<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="money_bill.aspx.cs" Inherits="HomePage.en.invest.money_bill" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
			<header>
				<h1 class="pageTitle line">Income Statement</h1>
				<p class="location">
					<a href="/en/index.aspx"><span><img src="/en/common/images/common/i_home.png" alt="home" /></span></a>
                    <a href="/en/invest/ir_info_list.aspx"><span>Investors</span></a><em> > </em>
			        <a href="/en/invest/money_mark.aspx"><span>Financial Reports</span></a><em> > </em>
			        <a href="/en/invest/money_bill.aspx"><strong>Income Statement</strong></a>
				</p>
			</header>
			<!--  내용  ***************** -->
			<p class="money_tit"><span class="left"><%--대한뉴팜 (주)--%></span><span class="right">(Notes: KRW'000)</span></p>
			<table class="table_style_01" border="1">
				<caption class="hidden">손익계산표</caption>
				<colgroup>
					<col >
					<col style="width:23%">
					<col style="width:23%">
					<col style="width:23%">
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2"  scope="col" class="left_borNo">Account Title</th>
						<th scope="col" ><%=GetData(0, 0, "FLAGB") %></th>
						<th scope="col" ><%=GetData(0, 1, "FLAGB") %></th>
						<th scope="col" ><%=GetData(0, 2, "FLAGB") %></th>
					</tr>
					<tr>
						<th scope="col" ><%=GetData(0, 0, "REG_DAY") %></th>
						<th scope="col" ><%=GetData(0, 1, "REG_DAY") %></th>
						<th scope="col" ><%=GetData(0, 2, "REG_DAY") %></th>
					</tr>
				</thead>
				<tbody>
                    <%  
    
                        if (GetRowCount(1) > 0)
                        {
                            for (int i = 0; i < GetRowCount(1); i++)
                                {
                    %>
					<tr>
						<th scope="row" class="left fb" ><%=GetData(1, i, "ATC_NM")%></th>
						<td><%=GetData(1, i, "FIRST_COL")%></td>
						<td><%=GetData(1, i, "SECOND_COL")%></td>
						<td><%=GetData(1, i, "THIRD_COL")%></td>
					</tr>
                    <% 
                                }
                            }
                    %>
				</tbody>
			</table>
			<!-- // 내용 ***************** -->         
		</section>  <!--// sub_content -->

</asp:Content>
