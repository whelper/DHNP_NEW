<%@ Page Language="C#" MasterPageFile="/en/EnProducts_Sub.Master" AutoEventWireup="true" CodeBehind="human_new_list.aspx.cs" Inherits="HomePage.en.products.human_new_list" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">
<p class="pdf_target">
    <%
        string rep_catg_url = RepCatal;
        if ("".Equals(rep_catg_url))
        {
    %>
    <a href="javascript:alert('등록된 카달로그가 없습니다. 고객센터로 문의해 주세요.');">
        <img src="/en/common/images/common/btn_pdf_01.png" alt="카다로그 다운로드" />
    </a>
    <% 
        }
        else
        {
    %>
    <a href="<%=rep_catg_url %>">
        <img src="/en/common/images/common/btn_pdf_01.png" alt="카다로그 다운로드" />
    </a>
    <% 
        }
    %>
</p>
</nav> <!-- // snb --> 
<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle">New Products</h1>
		<p class="location">
			<a href="/en/index.aspx"><span><img src="/en/common/images/common/i_home.png" alt="home" /></span></a>
			<a href="/en/products/human_new_list.aspx"><span>Products</span></a><em> > </em>
			<a href="/en/products/human_new_list.aspx"><span>Pharmaceutical</span></a><em> > </em>
			<a href="/en/products/human_new_list.aspx"><strong>New Products</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
	<fieldset class="search_products">
		<legend class="hidden"> 제품검색 폼 </legend>
		<p class="search_01">
			<label for="<%=search_text.ClientID %>" class="fB"> Search </label>
			<input type="text" runat="server" id="search_text" class="search_input" />
            <asp:LinkButton ID="btnSearch" runat="server" Text="Search" CssClass="btn_search fB" OnClick="btnSearch_Click" style="width:150px;text-align:center" />
		</p>
			<dl class="products_total about">
			    <dt class="fB about"> 제품명 </dt>
			    <dd>
				<ul class="products_total_ul about">
                    <li class="total"><a href="human_new_list.aspx?prod_initial=&catg_no2=<%=CatgNo2%>">A-Z</a></li>
					<li><a href="human_new_list.aspx?prod_initial=A&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("A")) {%> class="active" <%}%>>A</a></li>
					<li><a href="human_new_list.aspx?prod_initial=B&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("B")) {%> class="active" <%}%>>B</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=C&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("C")) {%> class="active" <%}%>>C</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=D&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("D")) {%> class="active" <%}%>>D</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=E&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("E")) {%> class="active" <%}%>>E</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=F&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("F")) {%> class="active" <%}%>>F</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=G&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("G")) {%> class="active" <%}%>>G</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=H&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("H")) {%> class="active" <%}%>>H</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=I&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("I")) {%> class="active" <%}%>>I</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=J&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("J")) {%> class="active" <%}%>>J</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=K&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("K")) {%> class="active" <%}%>>K</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=L&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("L")) {%> class="active" <%}%>>L</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=M&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("M")) {%> class="active" <%}%>>M</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=N&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("N")) {%> class="active" <%}%>>N</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=O&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("O")) {%> class="active" <%}%>>O</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=P&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("P")) {%> class="active" <%}%>>P</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=Q&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("Q")) {%> class="active" <%}%>>Q</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=R&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("R")) {%> class="active" <%}%>>R</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=S&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("S")) {%> class="active" <%}%>>S</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=T&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("T")) {%> class="active" <%}%>>T</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=U&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("U")) {%> class="active" <%}%>>U</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=V&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("V")) {%> class="active" <%}%>>V</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=W&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("W")) {%> class="active" <%}%>>W</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=X&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("X")) {%> class="active" <%}%>>X</a></li>
                    <li><a href="human_new_list.aspx?prod_initial=Y&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("Y")) {%> class="active" <%}%>>Y</a></li>
					<li><a href="human_new_list.aspx?prod_initial=Z&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("Z")) {%> class="active" <%}%>>Z</a></li>
				</ul>
			    </dd>
			</dl>
	</fieldset>

    			
	<div class="new_list clear">
        <% 
            if (GetDataCount() > 0)
            {
                for (int i = 0; i < GetDataCount(); i++)
                {
        %>
		<article class="list_Item">
			<i class="i_new"><em>new</em></i>
			<a href="/en/products/human_new_view.aspx?prod_cd=<%=GetData(i, "PROD_CD") %>">
                <% 
                    if (GetData(i, "PROD_IMG1").Equals("") == false)
                    {
                %>
                <img src="<%=GetData(i, "PROD_IMG1") %>" width="330" height="230" alt="" onerror="this.src='/common/images/products/new_no.jpg'" />
                <% 
                    }
                    else
                    {
                %>
                <img src="/en/common/images/products/new_no.jpg" width="330" height="230" alt="" />
                <% 
                    }
                %>
            </a>
			<h1><%=GetData(i, "PROD_NM") %></h1>
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
	</div>  <!-- // new_list -->

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
