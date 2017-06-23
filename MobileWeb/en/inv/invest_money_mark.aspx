<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="invest_money_mark.aspx.cs" Inherits="MobileWeb.en.inv.invest_money_mark" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/en/common/include/header.js" ></script> 	
		<h1 class="acc-hidden">Investors</h1>	
		<p class="location">
			<span>Investors</span><em>></em>
            <span>Financial Reports</span><em>></em>
			<strong>Balanced Sheet</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/en/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">재무상태표</h1>
		<ul class="tap_2depth mB10">
			<li> <a href="invest_money_mark.aspx" class="onhover">Balanced Sheet</a></li>
			<li> <a href="invest_money_bill.aspx">Income Statement</a></li>
		</ul>
		<!--   content -->
		<section class="content pB40 w600 overflow_x">
			<h1 class="acc-hidden">재무상태표</h1>
            <table class="table_style_01"  width="100%">
				<caption class="hidden">재무상태표</caption>
				<colgroup>
					<col style="width:6%">
					<col style="width:44%">
					<col style="width:50%">
				</colgroup>
				<thead>
					<tr>
						<th colspan="2" rowspan="2"  scope="col" class="left_borNo" >Account Title</th>
						<th scope="col" ><%=GetData(0, 0, "FIRST_COL") %></th>
					</tr>
					<tr>
						<th scope="col" ><%=GetData(0, 1, "FIRST_COL") %></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th  colspan="2" class="first"> Ⅰ. CURRENT ASSETS  </th>
						<td><%=GetData(0, 2, "FIRST_COL") %></td>
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
					</tr>
                    <%
                            }
                        }
                    %>
					<tr class="total">
						<th colspan="2"> CURRENT ASSETS Total  </th>
						<td><%=GetData(0, 3, "FIRST_COL") %></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th  colspan="2" class="first"> Ⅱ. NON-CURRENT ASSETS  </th>
						<td><%=GetData(0, 4, "FIRST_COL") %></td>
					</tr>
					<%  
    
                        if (GetRowCount(2) > 0)
                        {
                            for (int i = 0; i < GetRowCount(2); i++)
                            {
                    %>
					<tr>
						<th><%=GetData(2, i, "ROWNUM")%></th>
						<th  class="left"><%=GetData(2, i, "ATC_NM")%></th>
						<td><%=GetData(2, i, "L_ATC_AMT")%></td>
					</tr>
                    <%
                            }
                        }
                    %>
					<tr class="total">
						<th colspan="2"> NON-CURRENT ASSETS Total  </th>
						<td><%=GetData(0, 5, "FIRST_COL") %></td>
					</tr>
					<tr class="total_01">
						<th colspan="2">ASSETS Total</th>
						<td><%=GetData(0, 6, "FIRST_COL") %></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th  colspan="2" class="first"> Ⅲ. CURRENT LIABILITIES  </th>
						<td><%=GetData(0, 7, "FIRST_COL") %></td>
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
					</tr>
                    <%
                            }
                        }    
                    %>
					<tr class="total">
						<th colspan="2"> CURRENT LIABILITIES Total  </th>
						<td><%=GetData(0, 8, "FIRST_COL") %></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th  colspan="2" class="first"> Ⅳ. NON-CURRENT LIABILITIES   </th>
						<td><%=GetData(0, 9, "FIRST_COL") %></td>
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
					</tr>
                    <% 
                            }
                        }
                    %>
					<tr class="total">
						<th colspan="2"> NON-CURRENT LIABILITIES Total  </th>
						<td><%=GetData(0, 10, "FIRST_COL") %></td>
					</tr>
					<tr class="total_01">
						<th colspan="2"> LIABILITIES Total  </th>
						<td><%=GetData(0, 11, "FIRST_COL") %></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th  colspan="2" class="first">Ⅴ. SHAREHOLDERS' EQUITY  </th>
						<td><%=GetData(0, 12, "FIRST_COL") %></td>
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
					</tr>
                    <% 
                            }
                        }
                    %>
					<tr class="total">
						<th colspan="2"> SHAREHOLDERS' EQUITY Total  </th>
						<td><%=GetData(0, 13, "FIRST_COL") %></td>
					</tr>
					<tr class="total_01">
						<th colspan="2"> LIABILITIES / SHAREHOLDERS' EQUITY Total  </th>
						<td><%=GetData(0, 14, "FIRST_COL") %></td>
					</tr>
				</tbody>							
			</table>
        </section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/en/common/include/footer.js" ></script> 

</asp:Content>