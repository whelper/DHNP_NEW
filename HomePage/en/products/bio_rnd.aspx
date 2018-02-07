<%@ Page Title="" Language="C#" MasterPageFile="/en/EnProducts_Sub.Master" AutoEventWireup="true" CodeBehind="bio_rnd.aspx.cs" Inherits="HomePage.en.products.bio_rnd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">
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
		<h1 class="pageTitle line">R&D</h1>
		<p class="location">
			<a href="/en/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
			<a href="/en/products/human_new_list.aspx"><span>Products</span></a><em> > </em>
			<a href="/en/products/bio_badge_list.aspx"><span>Bio</span></a><em> > </em>
			<a href="/en/products/bio_badge_list.aspx"><strong>R&D</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
	<div class="view_box clear">  
		
<img src="/common/images/sub/en_bio01.jpg" />
	</div> <!--// view_box -->
	<!-- // 내용 ***************** -->         
</section>  <!--// sub_content -->
</asp:Content>
