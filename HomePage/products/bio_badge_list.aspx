<%@ Page Language="C#" MasterPageFile="~/Products_Sub.Master" AutoEventWireup="true" CodeBehind="bio_badge_list.aspx.cs" Inherits="HomePage.products.bio_badge_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">
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
		<h1 class="pageTitle">제품군</h1>
		<p class="location">
			<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
			<a href="/products/human_new_list.aspx"><span>제품</span></a><em> > </em>
			<a href="/products/bio_badge_list.aspx"><span>바이오 의약품</span></a><em> > </em>
			<a href="/products/bio_badge_list.aspx"><strong>제품군</strong></a>
		</p>
	</header>
	<fieldset class="search_products">
			<legend class="hidden"> 제품검색 폼 </legend>
			<p class="search_01">
				<label for="<%=search_text.ClientID %>" class="fB"> 제품검색 </label>
				<input type="text" runat="server" id="search_text" class="search_input" />
				<asp:LinkButton ID="btnSearch" runat="server" Text="Search" CssClass="btn_search fB" OnClick="btnSearch_Click" style="width:150px;text-align:center" />
			</p>
			<dl class="products_total about">
			    <dt class="fB about"> 제품명 </dt>
			    <dd>
					<ul class="products_total_ul about">
                        <li class="total"><a href="animal_products_list.aspx?prod_initial=&catg_no2=<%=CatgNo2%>">전체</a></li>
					    <li class="left"><a href="animal_products_list.aspx?prod_initial=INIT_1&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_1")) {%> class="active" <%}%>>ㄱ</a></li>
					    <li><a href="animal_products_list.aspx?prod_initial=INIT_2&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_2")) {%> class="active" <%}%>>ㄴ</a></li>
                        <li><a href="animal_products_list.aspx?prod_initial=INIT_3&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_3")) {%> class="active" <%}%>>ㄷ</a></li>
                        <li><a href="animal_products_list.aspx?prod_initial=INIT_4&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_4")) {%> class="active" <%}%>>ㄹ</a></li>
                        <li><a href="animal_products_list.aspx?prod_initial=INIT_5&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_5")) {%> class="active" <%}%>>ㅁ</a></li>
                        <li><a href="animal_products_list.aspx?prod_initial=INIT_6&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_6")) {%> class="active" <%}%>>ㅂ</a></li>
                        <li><a href="animal_products_list.aspx?prod_initial=INIT_7&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_7")) {%> class="active" <%}%>>ㅅ</a></li>
                        <li><a href="animal_products_list.aspx?prod_initial=INIT_8&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_8")) {%> class="active" <%}%>>ㅇ</a></li>
                        <li><a href="animal_products_list.aspx?prod_initial=INIT_9&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_9")) {%> class="active" <%}%>>ㅈ</a></li>
                        <li><a href="animal_products_list.aspx?prod_initial=INIT_10&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_10")) {%> class="active" <%}%>>ㅊ</a></li>
                        <li><a href="animal_products_list.aspx?prod_initial=INIT_11&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_11")) {%> class="active" <%}%>>ㅋ</a></li>
                        <li><a href="animal_products_list.aspx?prod_initial=INIT_12&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_12")) {%> class="active" <%}%>>ㅌ</a></li>
                        <li><a href="animal_products_list.aspx?prod_initial=INIT_13&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_13")) {%> class="active" <%}%>>ㅍ</a></li>
					    <li class="right"><a href="animal_products_list.aspx?prod_initial=INIT_14&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("INIT_14")) {%> class="active" <%}%>>ㅎ</a></li>
				    </ul>
			    </dd>
			</dl>

		</fieldset>
	<!--정렬 Begin-->	
	<div Class="wrap_prod_sorting">
		<asp:DropDownList ID="prod_sorting" runat="server" AutoPostBack="True">
			<asp:ListItem Value="">정렬</asp:ListItem>
			<asp:ListItem Value="ORD_NAME_ASC">제품명↑</asp:ListItem>
			<asp:ListItem Value="ORD_NAME_DESC">제품명↓</asp:ListItem>
		</asp:DropDownList>
	</div>
	<!--정렬 End-->
	<!--  내용  ***************** -->
	<!--<img src="/common/images/products/bio_badge_ex.gif" alt="혈청을 사용하여 배양한 세포의 경우 , 알레르기와 같은 부작용, 바이러스, 마이코플라즈마와 같은 
병원성 미생물 감염의 위험이 있어, 무혈청 배지를 이용하여 세포배양 의약품을 개발하는 추세입니다. 
이에, 대한뉴팜은 일본 CSTI사와 전략적 기술 제휴를 맺어 국내 고객들에게 최적의 맞춤형 무혈청 
배지 개발 서비스를 제공하고 있습니다. " >-->
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
			<a href="/products/bio_badge_view.aspx?prod_cd=<%=GetData(i, "PROD_CD") %>">
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
                <img src="/common/images/products/new_no.jpg" width="210" height="160" alt="" />
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
