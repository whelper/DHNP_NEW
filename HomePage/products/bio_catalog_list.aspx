<%@ Page Language="C#" MasterPageFile="~/Products_Sub.Master" AutoEventWireup="true" CodeBehind="bio_catalog_list.aspx.cs" Inherits="HomePage.products.bio_catalog_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">
<p class="pdf_target">
    <%
        string rep_catg_url = RepCatal;
        if ("".Equals(rep_catg_url))
        {
    %>
    <a href="javascript:alert('등록된 카탈로그가 없습니다. 고객센터로 문의해 주세요.');">
        <img src="/common/images/common/btn_pdf_03.png" alt="카다로그 다운로드" />
    </a>
    <% 
        }
        else
        {
    %>
    <a href="<%=rep_catg_url %>">
        <img src="/common/images/common/btn_pdf_03.png" alt="카다로그 다운로드" />
    </a>
    <% 
        }
    %>
</p>
</nav> <!-- // snb --> 
<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle line">카탈로그</h1>
		<p class="location">
			<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
			<a href="/products/human_new_list.aspx"><span>제품</span></a><em> > </em>
			<a href="/products/bio_badge_list.aspx"><span>바이오 공정소재</span></a><em> > </em>
			<a href="/products/bio_catalog_list.aspx"><strong>카탈로그</strong></a>
		</p>
	</header>
    <!--  내용  ***************** -->
			<section class="new_list clear">
				<img src="/common/images/products/bio_catalog_ex.gif" alt="" >
				<div class="acc-hidden">
					<h1>Catalog Products</h1>
					<p>해외 바이오 기업과 전략적 파트너쉽을 맺고 다양한 제품을 국내에 공급하고 있습니다.
						궁금하신 사항은 영업팀에 문의바랍니다.</p>
					<span>연락처: 02-3415-7811(직통)</span>
					<span>이메일: bio@dhnp.co.kr</span>
				</div>
				<table class="table_list lineheight" border="1">
					<caption class="hidden"> 파트너 리스트   </caption>
					<colgroup>
						<col>
						<col style="width:16px">
						<col style="width:226px">
						<col style="width:16px">
						<col style="width:226px">
						<col style="width:96px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">회사명 </th>
							<th>&nbsp;</th>
							<th scope="col">회사소개</th>
							<th>&nbsp;</th>
							<th scope="col">주요제품 </th>
							<th scope="col">다운로드 </th>
						</tr>
					</thead>
					<tbody>
                    <% 
                        if (GetDataCount() > 0)
                        {
                            for (int i = 0; i < GetDataCount(); i++)
                            {
                    %>
						<tr>
							<td scope="row"><img src="<%=GetData(i, "THUMBNAIL")%>" alt="" onerror='this.src="/common/images/products/no_big.jpg"' style="width:115px;height:104px;" /> </td>
							<td>&nbsp;</td>
							<td><%=GetData(i, "INTRO")%>
							</td>
							<td>&nbsp;</td>
							<td><%=GetData(i, "CONT")%></td>
							<td> 
                            <% 
                                if ("".Equals(GetData(i, "CATALOG")) == false)
                                {
                            %>
                                <a href="<%=GetData(i, "CATALOG") %>" class="button job_on" target="_blank">다운로드</a>
                            <% 
                                }
                            %>
                            </td>
						</tr>
                    <% 
                            }
                        }
                        else
                        {
                    %>
                        <!-- 내용이 없을 경우  -->
						<tr>
							<td colspan="6" class="no_data"> 
								<p> 내용이 없습니다. </p> 
							</td>
						</tr>
						<!-- // 내용이 없을 경우  -->
                    <% 
                        }
                    %>					
					</tbody>
				</table>
				<asp:HiddenField ID="nowPageNo" runat="server"  Value="1" onvaluechanged="nowPageNo_ValueChanged"/>
	            <%= HomePage.page.paging.getPageNo(DataTotalCount, Convert.ToInt32(nowPageNo.Value), 10)%>
			</section>
			<!-- // 내용 ***************** -->
	
	<!-- // 내용 ***************** -->     
</section>  <!--// sub_content -->

<script type="text/javascript" >
    function movePage(page_no) {
        document.getElementById('<%= nowPageNo.ClientID %>').value = page_no;
        document.forms[0].submit();
    }
</script>

</asp:Content>
