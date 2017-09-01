<%@ Page Title="" Language="C#" MasterPageFile="~/Products_Sub.Master" AutoEventWireup="true" CodeBehind="bio_rnd.aspx.cs" Inherits="HomePage.products.bio_rnd1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">
<p class="pdf_target">
    <%
        string rep_catg_url = RepCatal;
        if ("".Equals(rep_catg_url))
        {
    %>
    <a href="javascript:alert('등록된 카달로그가 없습니다. 고객센터로 문의해 주세요.');">
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
		<h1 class="pageTitle line">연구분야</h1>
		<p class="location">
			<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
			<a href="/products/human_new_list.aspx"><span>제품</span></a><em> > </em>
			<a href="/products/bio_badge_list.aspx"><span>바이오 의약품</span></a><em> > </em>
			<a href="/products/bio_badge_list.aspx"><strong>연구분야</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
	<div class="view_box clear">  
		
<img src="/common/images/sub/bio01.jpg" />
	</div> <!--// view_box -->
	<!-- // 내용 ***************** -->         
</section>  <!--// sub_content -->

</asp:Content>
