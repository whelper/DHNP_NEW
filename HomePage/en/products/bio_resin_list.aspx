<%@ Page Language="C#" MasterPageFile="/en/EnProducts_Sub.Master" AutoEventWireup="true" CodeBehind="bio_resin_list.aspx.cs" Inherits="HomePage.en.products.bio_resin_list" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">
<p class="pdf_target">
    <%
        string rep_catg_url = RepCatal;
        if ("".Equals(rep_catg_url))
        {
    %>
    <a href="javascript:alert('등록된 카달로그가 없습니다. 고객센터로 문의해 주세요.');">
        <img src="/en/common/images/common/btn_pdf_03.png" alt="카다로그 다운로드" />
    </a>
    <% 
        }
        else
        {
    %>
    <a href="<%=rep_catg_url %>">
        <img src="/en/common/images/common/btn_pdf_03.png" alt="카다로그 다운로드" />
    </a>
    <% 
        }
    %>
</p>
</nav> <!-- // snb --> 
<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle line">Chromatography Resins</h1>
		<p class="location">
			<a href="/en/index.aspx"><span><img src="/en/common/images/common/i_home.png" alt="home" /></span></a>
			<a href="/en/products/human_new_list.aspx"><span>Products</span></a><em> > </em>
			<a href="/en/products/bio_badge_list.aspx"><span>Bioprocess</span></a><em> > </em>
			<a href="/en/products/bio_resin_list.aspx"><strong>Chromatography Resins</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
	<img src="/en/common/images/products/bio_resin_ex.gif" alt="레진 TEXT" >
	<section class="new_list clear">
		<h1 class="acc-hidden"> 제품소개 리스트  </h1>
        <div class="row">
        <% 
            if (GetDataCount() > 0)
            {
                for (int i = 0; i < GetDataCount(); i++)
                {
        %>
		<article class="list_Item about">
			<a href="/en/products/bio_resin_view.aspx?prod_cd=<%=GetData(i, "PROD_CD") %>">
            <% 
                    if (GetData(i, "PROD_IMG1").Equals("") == false)
                    {
            %>
                <img src="<%=GetData(i, "PROD_IMG1") %>" width="210" height="160" alt="">
            <% 
                    }
                    else
                    {
            %>
                <img src="/en/common/images/products/new_no.jpg" width="210" height="160" alt="" />
            <% 
                    }
            %>
            </a>
			<h1><%=GetData(i, "PROD_NM")%> </h1>
			<p></p>
		</article>
        <% 
                }
            }
            else
            {
        %>
        <% 
            }
        %>
        </div>
	</section>
	<asp:HiddenField ID="nowPageNo" runat="server"  Value="1" onvaluechanged="nowPageNo_ValueChanged"/>
	<%= HomePage.page.paging.getPageNo(DataTotalCount, Convert.ToInt32(nowPageNo.Value), 10)%>
	<!-- // 내용 ***************** -->     
</section>  <!--// sub_content -->

<script type="text/javascript" >
    function movePage(page_no) {
        document.getElementById('<%= nowPageNo.ClientID %>').value = page_no;
        document.forms[0].submit();
    }
</script>

</asp:Content>
