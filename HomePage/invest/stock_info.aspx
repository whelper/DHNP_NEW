<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="stock_info.aspx.cs" Inherits="HomePage.invest.stock_info" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle line">주식발행</h1>
		<p class="location">
			<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
            <a href="/invest/ir_info_list.aspx"><span>투자</span></a><em> > </em>
			<a href="/invest/stock_info.aspx"><span>주식정보</span></a><em> > </em>
			<a href="/invest/stock_info.aspx"><strong>주식발행</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
	<h2 class="pageTitle_02">주식발행내역</h2>
	<p class="money_tit"><span class="left"></span><span class="right"> ( 단위 : 주, 천원 ) </span></p>
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
				<th scope="col" class="left_borNo" >주식의 종류</th>
				<th scope="col" >발행주식총수</th>
				<th scope="col" >액면총액</th>
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
                        if (GetData(i, "STOK_TYPE_CD").Equals("합계"))
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
		</tbody>
	</table>
	<!-- // 내용 ***************** -->         
</section>  <!--// sub_content -->

</asp:Content>