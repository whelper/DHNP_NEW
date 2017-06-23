<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="stock_info.aspx.cs" Inherits="MobileWeb.inv.stock_info" %>
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
			<li> <a href="stock_info.aspx" class="onhover">주식발행</a> </li>
			<li> <a href="stockholder.aspx">주주구성</a></li>
			<li> <a href="treasury_stock.aspx">자기주식</a></li>
		</ul>
		<!--   content -->
		<section class="content pB40 w600 overflow_x">
			<h1 class="acc-hidden">자기주식</h1>
			<table class="table_style_01 th36" width="700">
				<caption class="hidden">주식발행내역표</caption>
				<colgroup>
					<col >
					<col style="width:23%">
					<col style="width:23%">
					<col style="width:23%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="left_borNo">주식의 종류</th>
						<th scope="col" > 발행주식총수  </th>
						<th scope="col" > 액면총액   </th>
						<th scope="col" > 비고   </th>
					</tr>
				</thead>

				<tbody>
					<%
                        string stok_type_cd = "";
                        string pub_stok_total_cnt = "0";
                        string face_total_amt = "0";
                        string remark = "";
                
                        if (GetRowCount() > 0)
                        {
                            for (int i = 0; i < GetRowCount(); i++)
                            {
                                if (GetData(i, "STOK_TYPE_CD").Equals("합계"))
                                {
                                    stok_type_cd = GetData(i, "STOK_TYPE_CD");
                                    pub_stok_total_cnt = GetData(i, "PUB_STOK_TOTAL_CNT");
                                    face_total_amt = GetData(i, "FACE_TOTAL_AMT");
                                    remark = GetData(i, "REMARK");
                                }else
                                {
                    %>
			        <tr>
				        <th scope="row"><%=GetData(i, "STOK_TYPE_CD")%></th>
				        <td><%=GetData(i, "PUB_STOK_TOTAL_CNT")%></td>
				        <td><%=GetData(i, "FACE_TOTAL_AMT")%></td>
				        <td><%=GetData(i, "REMARK")%></td>
			        </tr>
                    <%
                            
                                }
                            }
                        }
                        else
                        {
                    %>
			        <!-- 내용이 없을 경우  -->
			        <tr >
				        <td colspan="6" class="no_data"> 
					        <p > 내용이 없습니다. </p> 
				        </td>
			        </tr>
                    <% 
                        }
                    %>
				</tbody>

                <tfoot>
					<tr class="total">
						<th scope="row"><%=stok_type_cd%></th>
				        <td><%=pub_stok_total_cnt%></td>
				        <td><%=face_total_amt%></td>
				        <td><%=remark%></td>
					</tr>
				</tfoot>
			</table>
		</section> 
		<!--   // content -->
	</section>
	 <!-- //  width:100% -->
	 <script src="<%=GetRoot() %>/common/include/footer.js" ></script> 

</asp:Content>