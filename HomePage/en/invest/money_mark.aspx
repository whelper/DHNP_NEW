<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="money_mark.aspx.cs" Inherits="HomePage.en.invest.money_mark" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle line"> Balanced Sheet   </h1>
		<p class="location">
			<a href="/en/index.aspx"><span><img src="/en/common/images/common/i_home.png" alt="home" /></span></a>
            <a href="/en/invest/ir_info_list.aspx"><span>Investors</span></a><em> > </em>
			<a href="/en/invest/money_mark.aspx"><span>Financial Reports</span></a><em> > </em>
			<a href="/en/invest/money_mark.aspx"><strong>Balanced Sheet</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
	<p class="money_tit"><span class="left"> <%--대한뉴팜 (주)--%> </span> <span class="right"> (Notes: KRW'000) </span></p>
	<table class="table_style_01" border="1">
		<caption class="hidden"> CONSOLIDATED BALANCE SHEETS   </caption>
		<colgroup>
			<col style="width:6%">
			<col >
			<col style="width:23%">
			<col style="width:23%">
			<col style="width:23%">
		</colgroup>
		<thead>
			<tr>
				<th colspan="2" rowspan="2"  scope="col" class="left_borNo">Account Title</th>
				<th scope="col"><%=GetData(0, 0, "FIRST_COL") %></th>
				<th scope="col"><%=GetData(0, 0, "SECOND_COL") %></th>
				<th scope="col"><%=GetData(0, 0, "THIRD_COL") %></th>
			</tr>
			<tr>
				<th scope="col"><%=GetData(0, 1, "FIRST_COL") %></th>
				<th scope="col"><%=GetData(0, 1, "SECOND_COL") %></th>
				<th scope="col"><%=GetData(0, 1, "THIRD_COL") %></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th  colspan="2" class="first">Ⅰ. CURRENT ASSETS</th>
				<td><%=GetData(0, 2, "FIRST_COL") %></td>
				<td><%=GetData(0, 2, "SECOND_COL")%></td>
				<td><%=GetData(0, 2, "THIRD_COL")%></td>
			</tr>
            <%  
    
                if (GetRowCount(1) > 0)
                {
                    for (int i = 0; i < GetRowCount(1); i++)
                    {
            %>
			<tr>
				<th><%=GetData(1, i, "ROWNUM")%></th>
				<th class="left"><%=GetData(1, i, "ATC_NM")%></th>
				<td><%=GetData(1, i, "L_ATC_AMT")%></td>
				<td><%=GetData(1, i, "C_ATC_AMT")%></td>
				<td><%=GetData(1, i, "R_ATC_AMT")%></td>
			</tr>
            <%
                    }
                }
            %>
			<tr class="total">
				<th colspan="2">TOTAL CURRENT ASSETS</th>
				<td><%=GetData(0, 3, "FIRST_COL") %></td>
				<td><%=GetData(0, 3, "SECOND_COL") %></td>
				<td><%=GetData(0, 3, "THIRD_COL") %></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<th  colspan="2" class="first">Ⅱ. NON-CURRENT ASSETS</th>
				<td><%=GetData(0, 4, "FIRST_COL") %></td>
				<td><%=GetData(0, 4, "SECOND_COL") %></td>
				<td><%=GetData(0, 4, "THIRD_COL") %></td>
			</tr>
            <%  
    
                if (GetRowCount(2) > 0)
                {
                    for (int i = 0; i < GetRowCount(2); i++)
                    {
            %>
			<tr>
				<th><%=GetData(2, i, "ROWNUM")%></th>
				<th class="left"><%=GetData(2, i, "ATC_NM")%></th>
				<td><%=GetData(2, i, "L_ATC_AMT")%></td>
				<td><%=GetData(2, i, "C_ATC_AMT")%></td>
				<td><%=GetData(2, i, "R_ATC_AMT")%></td>
			</tr>
            <%
                    }
                }
            %>
			<tr class="total">
				<th colspan="2"> TOTAL NON-CURRENT ASSETS  </th>
				<td><%=GetData(0, 5, "FIRST_COL") %></td>
				<td><%=GetData(0, 5, "SECOND_COL") %></td>
				<td><%=GetData(0, 5, "THIRD_COL") %></td>
			</tr>
			<tr class="total_01">
				<th colspan="2"> TOTAL ASSETS  </th>
				<td><%=GetData(0, 6, "FIRST_COL") %></td>
				<td><%=GetData(0, 6, "SECOND_COL") %></td>
				<td><%=GetData(0, 6, "THIRD_COL") %></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<th  colspan="2" class="first"> Ⅲ. CURRENT LIABILITES  </th>
				<td><%=GetData(0, 7, "FIRST_COL") %></td>
				<td><%=GetData(0, 7, "SECOND_COL") %></td>
				<td><%=GetData(0, 7, "THIRD_COL") %></td>
			</tr>
            <%  
                if (GetRowCount(3) > 0)
                {
                    for (int i = 0; i < GetRowCount(3); i++)
                    {
            %>
			<tr>
				<th><%=GetData(3, i, "ROWNUM")%></th>
				<th  class="left"><%=GetData(3, i, "ATC_NM")%></th>
				<td><%=GetData(3, i, "L_ATC_AMT")%></td>
				<td><%=GetData(3, i, "C_ATC_AMT")%></td>
				<td><%=GetData(3, i, "R_ATC_AMT")%></td>
			</tr>
            <%
                    }
                }    
            %>
			<tr class="total">
				<th colspan="2"> TOTAL CURRENT LIABILITIES  </th>
				<td><%=GetData(0, 8, "FIRST_COL") %></td>
				<td><%=GetData(0, 8, "SECOND_COL") %></td>
				<td><%=GetData(0, 8, "THIRD_COL") %></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<th  colspan="2" class="first"> Ⅳ. NON-CURRENT LIABILITIES   </th>
				<td><%=GetData(0, 9, "FIRST_COL") %></td>
				<td><%=GetData(0, 9, "SECOND_COL") %></td>
				<td><%=GetData(0, 9, "THIRD_COL") %></td>
			</tr>
            <%  
    
                if (GetRowCount(4) > 0)
                {
                    for (int i = 0; i < GetRowCount(1); i++)
                    {
            %>
			<tr>
				<th><%=GetData(4, i, "ROWNUM")%></th>
				<th  class="left"><%=GetData(4, i, "ATC_NM")%></th>
				<td><%=GetData(4, i, "L_ATC_AMT")%></td>
				<td><%=GetData(4, i, "C_ATC_AMT")%></td>
				<td><%=GetData(4, i, "R_ATC_AMT")%></td>
			</tr>
            <% 
                    }
                }
            %>
			<tr class="total">
				<th colspan="2"> TOTAL NON-CURRENT LIABILITIES  </th>
				<td><%=GetData(0, 10, "FIRST_COL") %></td>
				<td><%=GetData(0, 10, "SECOND_COL") %></td>
				<td><%=GetData(0, 10, "THIRD_COL") %></td>
			</tr>
			<tr class="total_01">
				<th colspan="2"> TOTAL LIABILITIES  </th>
				<td><%=GetData(0, 11, "FIRST_COL") %></td>
				<td><%=GetData(0, 11, "SECOND_COL") %></td>
				<td><%=GetData(0, 11, "THIRD_COL") %></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<th  colspan="2" class="first">Ⅴ. SHAREHOLDERS' EQUITY  </th>
				<td><%=GetData(0, 12, "FIRST_COL") %></td>
				<td><%=GetData(0, 12, "SECOND_COL") %></td>
				<td><%=GetData(0, 12, "THIRD_COL") %></td>
			</tr>
            <%  
    
                if (GetRowCount(5) > 0)
                {
                    for (int i = 0; i < GetRowCount(5); i++)
                    {
            %>
			<tr>
				<th><%=GetData(5, i, "ROWNUM")%></th>
				<th  class="left"><%=GetData(5, i, "ATC_NM")%></th>
				<td><%=GetData(5, i, "L_ATC_AMT")%></td>
				<td><%=GetData(5, i, "C_ATC_AMT")%></td>
				<td><%=GetData(5, i, "R_ATC_AMT")%></td>
			</tr>
            <% 
                    }
                }
            %>
			<tr class="total">
				<th colspan="2"> TOTAL SHAREHOLDER'S EQUITY  </th>
				<td><%=GetData(0, 13, "FIRST_COL") %></td>
				<td><%=GetData(0, 13, "SECOND_COL") %></td>
				<td><%=GetData(0, 13, "THIRD_COL") %></td>
			</tr>
			<tr class="total_01">
				<th colspan="2"> TOTAL LIABILITES AND SHAREHOLDERS' EQUITY  </th>
				<td><%=GetData(0, 14, "FIRST_COL") %></td>
				<td><%=GetData(0, 14, "SECOND_COL") %></td>
				<td><%=GetData(0, 14, "THIRD_COL") %></td>
			</tr>
		</tbody>							
	</table>
	<!-- // 내용 ***************** -->         
</section>  <!--// sub_content -->

</asp:Content>
