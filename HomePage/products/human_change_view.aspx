<%@ Page Language="C#" MasterPageFile="~/Products_Sub.Master" AutoEventWireup="true" CodeBehind="human_change_view.aspx.cs" Inherits="HomePage.products.human_change_view" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">
<p class="pdf_target">
    <%
        string rep_catg_url = RepCatal;
        if ("".Equals(rep_catg_url))
        {
    %>
    <a href="javascript:alert('등록된 카달로그가 없습니다. 고객센터로 문의해 주세요.');">
        <img src="/common/images/common/btn_pdf_01.png" alt="카다로그 다운로드" />
    </a>
    <% 
        }
        else
        {
    %>
    <a href="<%=rep_catg_url %>">
        <img src="/common/images/common/btn_pdf_01.png" alt="카다로그 다운로드" />
    </a>
    <% 
        }
    %>
</p>
</nav> <!-- // snb -->
<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle">제품변경정보</h1>
		<p class="location">
			<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
			<a href="/products/human_new_list.aspx"><span>제품</span></a><em> > </em>
			<a href="/products/human_new_list.aspx"><span>인체의약품</span></a><em> > </em>
			<a href="/products/human_change_list.aspx"><strong>제품변경정보</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
	<table class="table_view" border="1" >
		<caption class="hidden">제품변경정보 상세보기</caption>
		<colgroup>
			<col style="width:13%" />
			<col style="width:11%" />
			<col style="width:12%" />
			<col />
			<col style="width:13%" />
			<col style="width:13%" />
			<col style="width:12%" />
			<col />
		</colgroup>
		<thead>
			<tr>
				<th scope="row" colspan="1"><span>제목</span> </th>
				<td colspan="7"><%=GetData(0, "TTL", 86) %></td>
			</tr>
			<tr>
				<th scope="col"><span>번호</span></th>
				<td><%=GetData(0, "SEQ_NO") %></td>
				<th scope="col"><span>작성자</span></th>
				<td><%=GetData(0, "WRITER_NM")%></td>
				<th scope="col"><span>날짜</span></th>
				<td><%=GetData(0, "REG_DATE")%></td>
				<th scope="col"><span>조회수</span></th>
				<td><%=GetData(0, "HIT_CNT")%></td>
			</tr>
            <tr>
				<th colspan="1" scope="row"> <span>첨부파일</span> </th>
				<td colspan="7"> 
					<% if ("".Equals(GetData(0, "IMG1")) == false) {%><span class="i_file"><a href="<%=GetData(0, "IMG1") %>" title="<%=GetFileName(GetData(0, "IMG1"))%>"><%=GetFileName(GetData(0, "IMG1"), 80)%></a></span> <%} %>
					<% if ("".Equals(GetData(0, "IMG2")) == false) {%><br /><span class="i_file"><a href="<%=GetData(0, "IMG2") %>" title="<%=GetFileName(GetData(0, "IMG2"))%>"><%=GetFileName(GetData(0, "IMG2"), 80)%></a></span> <%} %>
                    <% if ("".Equals(GetData(0, "IMG3")) == false) {%><br /><span class="i_file"><a href="<%=GetData(0, "IMG3") %>" title="<%=GetFileName(GetData(0, "IMG3"))%>"><%=GetFileName(GetData(0, "IMG3"), 80)%></a></span> <%} %>
                    <% if ("".Equals(GetData(0, "IMG4")) == false) {%><br /><span class="i_file"><a href="<%=GetData(0, "IMG4") %>" title="<%=GetFileName(GetData(0, "IMG4"))%>"><%=GetFileName(GetData(0, "IMG4"), 80)%></a></span> <%} %>
                    <% if ("".Equals(GetData(0, "IMG5")) == false) {%><br /><span class="i_file"><a href="<%=GetData(0, "IMG5") %>" title="<%=GetFileName(GetData(0, "IMG5"))%>"><%=GetFileName(GetData(0, "IMG5"), 80)%></a></span> <%} %>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td  colspan="8">
					<div  class="view_adit">
                    <% 
                        if (GetData(0, "CLIP_URL") != "")
                        {
                    %>
                        <div class="movie_iframe">
                            <iframe title="youtube clips" width="100%" height="100%" style="height:300px" src="http://www.youtube.com/embed/<%=GetData(0, "CLIP_URL")%>" frameborder="0" allowscriptaccess="always" allowfullscreen="true"></iframe>
                        </div>
                    <% 
                        }
                    %>
						<p><%=GetData(0, "CONT")%></p>
					</div>	 
					<!-- // view_adit -->
				</td>
			</tr>
		</tbody>
	</table>
	<p class="listview_btns">
		<button type="button"  class="btn_view_prev">이전글</button>
		<button type="button"  class="btn_view_next">다음글</button>
		<button type="button" onclick="javascript:history.back();" class="btn_view_list">목록보기</button>
	</p>
	<!-- // 내용 ***************** -->         
</section>  <!--// sub_content -->
</asp:Content>
