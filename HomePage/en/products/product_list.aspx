<%@ Page Language="C#" MasterPageFile="/en/EnProducts_Sub.Master" AutoEventWireup="true" CodeBehind=".cs" Inherits="HomePage.en.products.product_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">
<p class="pdf_target">
    <%
        string rep_catg_url = RepCatal;
        if ("".Equals(rep_catg_url))
        {
    %>
    <a href="javascript:alert('등록된 카달로그가 없습니다. 고객센터로 문의해 주세요.');">
        <img src="/en/common/images/common/btn_pdf_<%=category.Substring(0,2)%>.png" alt="카다로그 다운로드" />
    </a>
    <% 
        }
        else
        {
    %>
    <a href="<%=rep_catg_url %>">
        <img src="/en/common/images/common/btn_pdf_<%=category.Substring(0,2)%>.png" alt="카다로그 다운로드" />
    </a>
    <% 
        }
    %>
</p>
</nav> <!-- // snb --> 
<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle"> Products </h1>
		<p class="location">
			<a href="/en/index.aspx"><span><img src="/en/common/images/common/i_home.png" alt="home" /></span></a>
			<a href="/en/products/?menu=<%=menu %>&category=<%=category %>"><span>Products</span></a><em> > </em>
			<a href="/en/products/?menu=<%=menu %>&category=<%=category %>"><span><%=categoryName %></span></a><%--<em> > </em>--%>
		<%--	<a href="/en/products/"><strong>Products</strong></a>--%>
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
                        <li class="total"><a href="?prod_initial=&catg_no2=<%=CatgNo2%>">A-Z</a></li>
					<li><a href="?prod_initial=A&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("A")) {%> class="active" <%}%>>A</a></li>
					<li><a href="?prod_initial=B&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("B")) {%> class="active" <%}%>>B</a></li>
                    <li><a href="?prod_initial=C&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("C")) {%> class="active" <%}%>>C</a></li>
                    <li><a href="?prod_initial=D&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("D")) {%> class="active" <%}%>>D</a></li>
                    <li><a href="?prod_initial=E&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("E")) {%> class="active" <%}%>>E</a></li>
                    <li><a href="?prod_initial=F&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("F")) {%> class="active" <%}%>>F</a></li>
                    <li><a href="?prod_initial=G&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("G")) {%> class="active" <%}%>>G</a></li>
                    <li><a href="?prod_initial=H&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("H")) {%> class="active" <%}%>>H</a></li>
                    <li><a href="?prod_initial=I&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("I")) {%> class="active" <%}%>>I</a></li>
                    <li><a href="?prod_initial=J&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("J")) {%> class="active" <%}%>>J</a></li>
                    <li><a href="?prod_initial=K&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("K")) {%> class="active" <%}%>>K</a></li>
                    <li><a href="?prod_initial=L&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("L")) {%> class="active" <%}%>>L</a></li>
                    <li><a href="?prod_initial=M&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("M")) {%> class="active" <%}%>>M</a></li>
                    <li><a href="?prod_initial=N&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("N")) {%> class="active" <%}%>>N</a></li>
                    <li><a href="?prod_initial=O&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("O")) {%> class="active" <%}%>>O</a></li>
                    <li><a href="?prod_initial=P&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("P")) {%> class="active" <%}%>>P</a></li>
                    <li><a href="?prod_initial=Q&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("Q")) {%> class="active" <%}%>>Q</a></li>
                    <li><a href="?prod_initial=R&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("R")) {%> class="active" <%}%>>R</a></li>
                    <li><a href="?prod_initial=S&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("S")) {%> class="active" <%}%>>S</a></li>
                    <li><a href="?prod_initial=T&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("T")) {%> class="active" <%}%>>T</a></li>
                    <li><a href="?prod_initial=U&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("U")) {%> class="active" <%}%>>U</a></li>
                    <li><a href="?prod_initial=V&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("V")) {%> class="active" <%}%>>V</a></li>
                    <li><a href="?prod_initial=W&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("W")) {%> class="active" <%}%>>W</a></li>
                    <li><a href="?prod_initial=X&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("X")) {%> class="active" <%}%>>X</a></li>
                    <li><a href="?prod_initial=Y&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("Y")) {%> class="active" <%}%>>Y</a></li>
					<li><a href="?prod_initial=Z&catg_no2=<%=CatgNo2%>"<%if (ProdInitial.Equals("Z")) {%> class="active" <%}%>>Z</a></li>
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
	<!--정렬 End-->
	<%if (category.Substring(0,2) == "09" || category.Substring(0,2) == "10"){ %>
	<div class="tab_typeA tab-<%=category.Substring(0,2)%>">
		<ul>					
			<%--<li class="first"><a href="?menu=<%=menu%>&category=02" class="<%=(category == "02") ? "on" : "" %>">전체</a></li>--%>
			 <% 
				
				 if (CatgDs != null)
				 {
					 string _category = String.Empty;
					 for (int i = 0; i < CatgDs.Tables[0].Rows.Count; i++)
					 {
						 _category = CatgDs.Tables[0].Rows[i]["CATE_CD"].ToString();
						 if (_category.Length > 4) continue;
			%>
			<li><a href="?menu=<%=menu%>&category=<%=CatgDs.Tables[0].Rows[i]["CATE_CD"]%>" class="<%=(_category.Substring(0, 4) == category.Substring(0,cutLimit)) ? "on" : "" %>"><%=CatgDs.Tables[0].Rows[i]["CATE_NAME"]%></a></li>
			<% 
					}
				}
			%>
		
		</ul>
	</div>	
	<%} %>
	<nav class="<%=(category.Substring(0,2) == "09" || category.Substring(0,2) == "10") ? "tap_nav1" : "tap_nav" %>">
		<h1 class="acc-hidden"> 제품소개 메뉴</h1>
		<ul class="clear sub-tab">
            <% 
				string catgCss = "";

				if (CatgDs != null)
				{
					string _category = String.Empty;
					for (int i = 0; i < CatgDs.Tables[0].Rows.Count; i++)
					{

						_category = CatgDs.Tables[0].Rows[i]["CATE_CD"].ToString();
						if (category.Substring(0,2) == "09" || category.Substring(0,2) == "10") {
							if (category.Length < 4 || _category.Length <= 4 || _category.Substring(0,cutLimit) != category.Substring(0,cutLimit)) continue;
						}

					catgCss =  (_category == category) ? " class='onhover'" : "";


            %>
			<li><a href="?menu=<%=menu%>&category=<%=CatgDs.Tables[0].Rows[i]["CATE_CD"]%>"<%=catgCss%>><%=CatgDs.Tables[0].Rows[i]["CATE_NAME"]%> (<%=CatgDs.Tables[0].Rows[i]["CNT"]%>) </a></li>
            <% 
                    }
                }
            %>
		</ul>	
	</nav> <!--  tap_nav -->
	<section class="new_list clear">
		<h1 class="acc-hidden"> 제품소개 리스트  </h1>
			
		<% 
			if (GetDataCount() > 0)
			{

				for (int i = 0; i < GetDataCount(); i++)
				{
					if(i == 0 || i %2 == 0) Response.Write("<div class=\"row\">");
        %>
                 
		<article class="list_Item about">
			
			<a href="/en/products/product_view.aspx?menu=<%=menu%>&prod_cd=<%=GetData(i, "PROD_CD") %>&category=<%=category%>">
			    <% 
                    if (GetData(i, "PROD_IMG1").Equals("") == false)
                    {
                %>
                <img src="<%=GetData(i, "PROD_IMG1") %>" width="330" height="240" alt="" onerror="this.src='/common/images/products/new_no.jpg'" />
                <% 
                    }
                    else
                    {
                %>
                <img src="/common/images/products/new_no.jpg" width="330" height="240" alt="" />
                <% 
                    }
                %>
            </a>
            <h1><%=GetData(i, "PROD_NM") %></h1>
			<p></p>
		</article>
                    <% if ((i+1) % 2 == 0 || i == GetDataCount()){ %>
                         </div>
                    <% } %>
        <% 
                } // end of for
            }
            else
            {
        %>
        <% 
            }
        %>

	</section> <!-- // new_list -->

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