<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="money_mark.aspx.cs" Inherits="HomePage.invest.money_mark" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle line"> 재무상태표   </h1>
		<p class="location">
			<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
            <a href="/invest/ir_info_list.aspx"><span>투자</span></a><em> > </em>
			<a href="/invest/money_mark.aspx"><span>재무정보</span></a><em> > </em>
			<a href="/invest/money_mark.aspx"><strong>재무상태표</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
	<p class="money_tit"><span class="left"> 대한뉴팜 (주) </span> <span class="right"> ( 단위 : 천원 ) </span></p>
	<table class="table_style_01" border="1">
		<caption class="hidden"> 재무상태표   </caption>
		<colgroup>
			<col style="width:6%">
			<col >
			<col style="width:23%">
			<col style="width:23%">
			<col style="width:23%">
		</colgroup>
		<thead>
			<tr>
				<th colspan="2" rowspan="2"  scope="col" class="left_borNo">과목</th>
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
				<th  colspan="2" class="first">Ⅰ. 유동자산</th>
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
				<th colspan="2">유동자산 계</th>
				<td><%=GetData(0, 3, "FIRST_COL") %></td>
				<td><%=GetData(0, 3, "SECOND_COL") %></td>
				<td><%=GetData(0, 3, "THIRD_COL") %></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<th  colspan="2" class="first">Ⅱ. 비유동자산</th>
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
				<th colspan="2"> 비유동자산 계  </th>
				<td><%=GetData(0, 5, "FIRST_COL") %></td>
				<td><%=GetData(0, 5, "SECOND_COL") %></td>
				<td><%=GetData(0, 5, "THIRD_COL") %></td>
			</tr>
			<tr class="total_01">
				<th colspan="2"> 자산 계  </th>
				<td><%=GetData(0, 6, "FIRST_COL") %></td>
				<td><%=GetData(0, 6, "SECOND_COL") %></td>
				<td><%=GetData(0, 6, "THIRD_COL") %></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<th  colspan="2" class="first"> Ⅲ. 유동부채  </th>
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
				<th colspan="2"> 유동부채 계  </th>
				<td><%=GetData(0, 8, "FIRST_COL") %></td>
				<td><%=GetData(0, 8, "SECOND_COL") %></td>
				<td><%=GetData(0, 8, "THIRD_COL") %></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<th  colspan="2" class="first"> Ⅳ. 비유동부채   </th>
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
				<th colspan="2"> 비유동부채 계  </th>
				<td><%=GetData(0, 10, "FIRST_COL") %></td>
				<td><%=GetData(0, 10, "SECOND_COL") %></td>
				<td><%=GetData(0, 10, "THIRD_COL") %></td>
			</tr>
			<tr class="total_01">
				<th colspan="2"> 부채 계  </th>
				<td><%=GetData(0, 11, "FIRST_COL") %></td>
				<td><%=GetData(0, 11, "SECOND_COL") %></td>
				<td><%=GetData(0, 11, "THIRD_COL") %></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<th  colspan="2" class="first">Ⅴ. 자본  </th>
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
				<th colspan="2"> 자본 계  </th>
				<td><%=GetData(0, 13, "FIRST_COL") %></td>
				<td><%=GetData(0, 13, "SECOND_COL") %></td>
				<td><%=GetData(0, 13, "THIRD_COL") %></td>
			</tr>
			<tr class="total_01">
				<th colspan="2"> 부채 / 자본 계  </th>
				<td><%=GetData(0, 14, "FIRST_COL") %></td>
				<td><%=GetData(0, 14, "SECOND_COL") %></td>
				<td><%=GetData(0, 14, "THIRD_COL") %></td>
			</tr>
		</tbody>							
	</table>
	<!-- // 내용 ***************** -->         
</section>  <!--// sub_content -->

</asp:Content>
