<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="stock_info.aspx.cs" Inherits="HomePage.en.invest.stock_info" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle line">Number of Issued Shares</h1>
		<p class="location">
			<a href="/en/index.aspx"><span><img src="/en/common/images/common/i_home.png" alt="home" /></span></a>
            <a href="/en/invest/ir_info_list.aspx"><span>Investors</span></a><em> > </em>
			<a href="/en/invest/stock_info.aspx"><span>Shareholder Services</span></a><em> > </em>
			<a href="/en/invest/stock_info.aspx"><strong>Number of Issued Shares</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
	
	<p class="money_tit"><span class="left"></span><span class="right"> (Notes: KRW'000) </span></p>
	<table class="table_style_01 th36" border="1" >
		<caption class="hidden">주식발행내역표</caption>
		<colgroup>
			<col >
			<col style="width:23%">
			<col style="width:23%">
			<col style="width:23%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col" class="left_borNo" >Class of Shares</th>
				<th scope="col" >Total Number of Issued Shares</th>
				<th scope="col" >Nominal Value</th>
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
                        if (GetData(i, "STOK_TYPE_CD").Equals("Total"))
                        {
                            css = " class=\"total\"";
                        }
                        else
                        {
                            css = "";
                        }
            %>
			<tr<%=css%>>
				<th scope="row"><%=GetData(i, "STOK_TYPE_CD")%></th>
				<td><%=GetData(i, "PUB_STOK_TOTAL_CNT")%></td>
				<td><%=GetData(i, "FACE_TOTAL_AMT")%></td>
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
				<td colspan="6" class="no_data"> 
					<p > 내용이 없습니다. </p> 
				</td>
			</tr>
            <% 
                }
            %>
	</table>
	<!-- // 내용 ***************** -->         
</section>  <!--// sub_content -->

</asp:Content>