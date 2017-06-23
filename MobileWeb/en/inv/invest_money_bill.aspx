<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="invest_money_bill.aspx.cs" Inherits="MobileWeb.en.inv.invest_money_bill" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

	<header class="header">
		<script src="<%=GetRoot() %>/en/common/include/header.js" ></script> 	
		<h1 class="acc-hidden">Investors</h1>	
		<p class="location">
			<span>Investors</span><em>></em>
            <span>Financial Reports</span><em>></em>
			<strong>Income Statement</strong>
		</p>
	</header>

    <!-- 오픈시 보일 메뉴 -->
	<nav class="gnb" >
		<script src="<%=GetRoot() %>/en/common/include/gnb.js" ></script> 	
	</nav>
	<!-- // 오픈시 보일 메뉴  -->

	<!--   width:100% -->
	<section class="container">
		<h1 class="acc-hidden">손익계산서</h1>
		<ul class="tap_2depth mB10">
			<li> <a href="invest_money_mark.aspx">Balanced Sheet</a></li>
			<li> <a href="invest_money_bill.aspx" class="onhover">Income Statement</a></li>
		</ul>
		<!--   content -->
		<section class="content pB40 w600 overflow_x">
			<h1 class="acc-hidden">손익계산서 표</h1>
			<table class="table_style_01" width="100%">
				<caption class="hidden">손익계산표</caption>
				<colgroup>
					<col style="width:50%">
                    <col style="width:50%">
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2"  scope="col" class="left_borNo" >Account Title</th>
						<th scope="col" ><%=GetData(0, 0, "FLAGB") %></th>
					</tr>
					<tr>
						<th scope="col" ><%=GetData(0, 0, "REG_DAY") %></th>
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
					</tr>
                    <% 
                                }
                            }
                    %>
				</tbody>
			</table>
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/en/common/include/footer.js" ></script>

</asp:Content>