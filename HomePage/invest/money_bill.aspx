<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="money_bill.aspx.cs" Inherits="HomePage.invest.money_bill" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
			<header>
				<h1 class="pageTitle line">손익계산서</h1>
				<p class="location">
					<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
                    <a href="/invest/ir_info_list.aspx"><span>투자</span></a><em> > </em>
			        <a href="/invest/money_mark.aspx"><span>재무정보</span></a><em> > </em>
			        <a href="/invest/money_bill.aspx"><strong>손익계산서</strong></a>
				</p>
			</header>
			<!--  내용  ***************** -->
			<p class="money_tit"><span class="left">대한뉴팜 (주)</span><span class="right">( 단위 : 천원 )</span></p>
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
						<th rowspan="2"  scope="col" class="left_borNo">과목</th>
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
