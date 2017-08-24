<%@ Page Language="C#" MasterPageFile="~/Products_Sub.Master" AutoEventWireup="true" CodeBehind="product_list.aspx.cs" Inherits="HomePage.products.human_products_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">
<p class="pdf_target">
    <%

		string rep_catg_url = RepCatal;
		if ("".Equals(rep_catg_url))
		{
    %>
    <a href="javascript:alert('등록된 카달로그가 없습니다. 고객센터로 문의해 주세요.');">
        <img src="/common/images/common/btn_pdf.png" alt="카다로그 다운로드" />
    </a>
    <% 
        }
        else
        {
    %>
    <a href="<%=rep_catg_url %>">
        <img src="/common/images/common/btn_pdf_<%=category.Substring(0,2)%>.png" alt="카다로그 다운로드" />
    </a>
    <% 
        }
    %>
</p>
</nav> <!-- // snb --> 
<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle"> 제품소개 </h1>
		<p class="location">
			<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
			<a href="/products/human_new_list.aspx"><span>제품</span></a><em> > </em>
			<a href="/products/human_new_list.aspx"><span><%=categoryName%></span></a><em> > </em>
			<a href="/products/product_list.aspx"><strong>제품소개</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
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
                        <li class="total"><a href="product_list.aspx?menu=<%=menu%>&prod_initial=&category=<%=category%>">전체</a></li>
					    <li class="left"><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_1&category=<%=category%>"<%if (ProdInitial.Equals("INIT_1")) {%> class="active" <%}%>>ㄱ</a></li>
					    <li><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_2&category=<%=category%>"<%if (ProdInitial.Equals("INIT_2")) {%> class="active" <%}%>>ㄴ</a></li>
                        <li><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_3&category=<%=category%>"<%if (ProdInitial.Equals("INIT_3")) {%> class="active" <%}%>>ㄷ</a></li>
                        <li><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_4&category=<%=category%>"<%if (ProdInitial.Equals("INIT_4")) {%> class="active" <%}%>>ㄹ</a></li>
                        <li><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_5&category=<%=category%>"<%if (ProdInitial.Equals("INIT_5")) {%> class="active" <%}%>>ㅁ</a></li>
                        <li><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_6&category=<%=category%>"<%if (ProdInitial.Equals("INIT_6")) {%> class="active" <%}%>>ㅂ</a></li>
                        <li><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_7&category=<%=category%>"<%if (ProdInitial.Equals("INIT_7")) {%> class="active" <%}%>>ㅅ</a></li>
                        <li><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_8&category=<%=category%>"<%if (ProdInitial.Equals("INIT_8")) {%> class="active" <%}%>>ㅇ</a></li>
                        <li><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_9&category=<%=category%>"<%if (ProdInitial.Equals("INIT_9")) {%> class="active" <%}%>>ㅈ</a></li>
                        <li><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_10&category=<%=category%>"<%if (ProdInitial.Equals("INIT_10")) {%> class="active" <%}%>>ㅊ</a></li>
                        <li><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_11&category=<%=category%>"<%if (ProdInitial.Equals("INIT_11")) {%> class="active" <%}%>>ㅋ</a></li>
                        <li><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_12&category=<%=category%>"<%if (ProdInitial.Equals("INIT_12")) {%> class="active" <%}%>>ㅌ</a></li>
                        <li><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_13&category=<%=category%>"<%if (ProdInitial.Equals("INIT_13")) {%> class="active" <%}%>>ㅍ</a></li>
					    <li class="right"><a href="product_list.aspx?menu=<%=menu%>&prod_initial=INIT_14&category=<%=category%>"<%if (ProdInitial.Equals("INIT_14")) {%> class="active" <%}%>>ㅎ</a></li>
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
	<%if (category.Substring(0,2) == "02"){ %>
	<div class="tab_typeA">
		<ul>					
			<li class="first"><a href="?menu=<%=menu%>&category=02" class="<%=(category == "02") ? "on" : "" %>">전체</a></li>
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
	<nav class="<%=(category.Substring(0,2) == "02") ? "tap_nav1" : "tap_nav" %>">
		<h1 class="acc-hidden"> 제품소개 메뉴</h1>
		<ul class="clear">
            <% 
				string catgCss = "";

				if (CatgDs != null)
				{
					string _category = String.Empty;
					for (int i = 0; i < CatgDs.Tables[0].Rows.Count; i++)
					{

						_category = CatgDs.Tables[0].Rows[i]["CATE_CD"].ToString();
						if (category.Substring(0,2) == "02") {
							if (category.Length < 4 || _category.Length <= 4 || _category.Substring(0,cutLimit) != category.Substring(0,cutLimit)) continue;
						}

					catgCss =  (_category == category) ? " class='onhover'" : "";


            %>
			<li><a href="product_list.aspx?menu=<%=menu%>&category=<%=CatgDs.Tables[0].Rows[i]["CATE_CD"]%>"<%=catgCss%>><%=CatgDs.Tables[0].Rows[i]["CATE_NAME"]%> (<%=CatgDs.Tables[0].Rows[i]["CNT"]%>) </a></li>
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
			
			<a href="/products/product_view.aspx?menu=<%=menu%>&prod_cd=<%=GetData(i, "PROD_CD") %>&category=<%=category%>">
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