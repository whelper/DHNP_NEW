<%@ Page Language="C#" MasterPageFile="/en/EnProducts_Sub.Master" AutoEventWireup="true" CodeBehind="product_view.20170915.aspx.cs" Inherits="HomePage.en.products.product_view" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">
<%
	if (category == "")
	{
%>
<script>history.back();</script>
<%
		Response.End();
	}
%>
<p class="pdf_target">
    <%
        string rep_catg_url = RepCatal;
        if ("".Equals(rep_catg_url))
        {
    %>
    <a href="javascript:alert('등록된 카달로그가 없습니다. 고객센터로 문의해 주세요.');">
		<img src="/en/common/images/common/btn_pdf_<%=category.Substring(0, 2)%>.png" alt="카다로그 다운로드" />
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
		<h1 class="pageTitle">Products</h1>
		<p class="location">
			<a href="/en/index.aspx"><span><img src="/en/common/images/common/i_home.png" alt="home" /></span></a>
			<a href="/en/products/product_list.aspx?menu=<%=menu %>&category=<%=category %>"><span>Products</span></a><em> > </em>
			<a href="/en/products/product_list.aspx?menu=<%=menu %>&category=<%=category %>"><span><%=categoryName %></span></a>
			
<%--			<a href="/en/products/human_new_list.aspx"><span>Products</span></a><em> > </em>
			<a href="/en/products/human_new_list.aspx"><span>Pharmaceutical</span></a><em> > </em>
			<a href="/en/products/human_products_list.aspx"><strong>Products</strong></a>--%>
		</p>
	</header>
	<!--  내용  ***************** -->
	<div class="view_box clear">  
		<!-- 갤러리 -->
	 	<figure class="view_img">
	 		<i class="i_new"> <em> new </em></i>
	 		<%
                string img1Big = GetData(0, "PROD_IMG1").Equals("") ? "/common/images/products/no_big.jpg" : GetData(0, "PROD_IMG1");
                string img1 = GetData(0, "PROD_IMG1").Equals("") ? "/common/images/products/no_small.jpg" : GetData(0, "PROD_IMG1");
                string img2 = GetData(0, "PROD_IMG2").Equals("") ? "/common/images/products/no_small.jpg" : GetData(0, "PROD_IMG2");
                string img3 = GetData(0, "PROD_IMG3").Equals("") ? "/common/images/products/no_small.jpg" : GetData(0, "PROD_IMG3");
                string img4 = GetData(0, "PROD_IMG4").Equals("") ? "/common/images/products/no_small.jpg" : GetData(0, "PROD_IMG4");
                string img5 = GetData(0, "PROD_IMG5").Equals("") ? "/common/images/products/no_small.jpg" : GetData(0, "PROD_IMG5");
				string[] thumb = { img1,img2,img3,img4,img5 };
			%>

            <a class= "image-popup-vertical-fit" href="<%=img1Big %>">
	 		  <img id="largeImage" src="<%=img1Big %>" width="300" height="220" alt=""> 
            </a >
	 		<div  id="thumbs" class="small" >
		 		<%
					foreach (string s in thumb) {
						if (s == "/common/images/products/no_small.jpg") continue;
				%>
				<span><img src="<%=s%>" width="56" height="56" alt="" onerror="this.src='/common/images/products/new_no.jpg'"></span>
				<%} %>
		 	</div>
	 	</figure>

	 	<article class="view_text">
	  		<h1><%=GetData(0, "PROD_NM") %></h1>
			<div class="tb_list_cate">
				<table summary="">
					<caption></caption>
					<colgroup>
						<col width="100px">
						<col width="260px">
					</colgroup>
					<tbody>
						<%if (!GetData(0, "CATG_NM1").Equals("")){ %>
						<tr>
							<th scope="row">Category</th>
							<td><%=GetData(0, "CATG_NM1") %></td>
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>

	  		<p class="btn_target"> 
                <% 
                    if (GetData(0, "MANUAL").Equals("") == false)
                    {
                %>
	  			<button type="button" class="view_story" onclick="download_descript('<%=GetData(0, "MANUAL")%>');"><span> 제품설명서</span></button>
                <% 
                    }
                %>
                <% 
                    if (GetData(0, "CLIP_URL").Equals("") == false)
                    {
                %>
	  			<a href="#pop_mov_guide" data-toggle="modal"><button type="button" class="view_video"><span> 동영상 보기</span></button></a>
                <% 
                    }
                %>
                <button type="button" onclick="window.print();" class="view_print"><span>Print</span></button>
	  		</p>
	 	</article>	
	</div> <!--// view_box -->
	

	<div class="tb_list_plain">
	<table summary="">
		<caption></caption>
		<colgroup>
			<col width="150px">
			<col width="536px">
		</colgroup>
		<tbody>			
			<%if (category.Substring(0, 2) != "11")
					{ %>
				<%if (!GetData(0, "INGREDI").Equals(""))
					{ %>
				<tr>
					<th scope="row">· Active Ingredients</th>
					<td><%=GetData(0, "INGREDI").Replace("\n", "<br />") %></td>
				</tr>
				<%} %>

				<%if (!Regex.Replace(GetData(0, "USAGE").ToString(),@"<(.|\n)*?>", string.Empty).Equals("")){ %>
				<tr>
					<th scope="row">· <%=(category.Substring(0,2) == "14") ? "Overview" : "Indication" %></th>
					<td><%=GetData(0, "USAGE") %></td>
				</tr>
				<%} %>

				<%if (!GetData(0, "DOSAGE").Equals(""))
					{ %>
				<tr>
					<th scope="row">· Dosage</th>
					<td><%=GetData(0, "DOSAGE").Replace("\n", "<br />") %></td>
				</tr>
				<%} %>
				<%if (!GetData(0, "PACK_MEA").Equals(""))
					{ %>
				<tr>
					<th scope="row">· Package</th>
					<td><%=GetData(0, "PACK_MEA")%></td>
				</tr>
				<%} %>
			<%}else{ %><%-- only biopharmaceutical --%>
				<%if (!GetData(0, "SUMR").Equals("")){ %>
				<tr>
					<th scope="row" valign="top">· Overview</th>
					<td><%=GetData(0, "SUMR").Replace("\n","<br />")%></td>
				</tr>
				<%} %>
				<%if (!GetData(0, "USAGE").Equals("")){ %>
				<tr>
					<th scope="row" valign="top">· Contents</th>
					<td><%=GetData(0, "USAGE").Replace("\n","<br />")%></td>
				</tr>
				<%} %>
			<%} %>
		</tbody>
	</table>
</div>
	
	
	
	
	 <!--// con_tap_box -->
	<!-- // 내용 ***************** -->         
</section>  <!--// sub_content -->

<% 
    if (GetData(0, "CLIP_URL").Equals("") == false)
    {
%>
<div id="pop_mov_guide" class="modal hide fade" style="display: none; ">
	<div class="modal-header">
		<h3>동영상</h3>
		<button type="button" class="close" data-dismiss="modal"><span class="icon_close"></span></button>
	</div>
	<div class="modal-body">	
		<div class="movie_iframe">
            <iframe title="youtube clips" width="100%" height="100%" style="height:300px" src="http://www.youtube.com/embed/<%=GetData(0, "CLIP_URL")%>" frameborder="0" allowscriptaccess="always" allowfullscreen="true"></iframe>
        </div>
	</div>
	<div class="modal-footer">
	    <a href="#" data-dismiss="modal"><button class="btn">닫기</button></a>
	</div>
</div>
<% 
    }
%>

<script type="text/javascript">
    var download_descript = function (url) {
        location.href = url;
    }
</script>

</asp:Content>
