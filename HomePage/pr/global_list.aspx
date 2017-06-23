<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="global_list.aspx.cs" Inherits="HomePage.pr.global_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle">해외자원투자</h1>
		<p class="location">
			<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
			<a href="/pr/news_list.aspx"><span>홍보</span></a><em> > </em>
			<a href="/pr/global_list.aspx"><strong>해외자원투자</strong></a>
		</p>
	</header>

     <% 
        if (DsHeader != null && DsHeader.Tables.Count > 0 && DsHeader.Tables[0].Rows.Count > 0)
        {   
    %>
    <%=DsHeader.Tables[0].Rows[0]["CONT"].ToString()%>
    <% 
        }
    %>

	<!--  내용  ***************** -->
	<table class="table_list" border="1">
		<caption class="hidden"> 새소식 리스트   </caption>
		<colgroup>
			<col style="width:10%">
			<col >
			<col style="width:15%">
			<col style="width:15%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호 </th>
				<th scope="col">제목</th>
				<th scope="col">작성자 </th>
				<th scope="col">등록일  </th>
				<th scope="col">조회수  </th>
			</tr>
		</thead>
		<tbody>
            <%
                if (GetRowCount() > 0)
                {
                    for (int i = 0; i < GetRowCount(); i++)
                    {
            %>
			<tr>
				<td><%=GetBoardNum(i, Convert.ToInt32(nowPageNo.Value), 10)%></td>
				<td><a href="global_view.aspx?seq_no=<%=GetData(i, "SEQ_NO")%>&dp_seq_no=<%=GetBoardNum(i, Convert.ToInt32(nowPageNo.Value), 10)%>"><% if (GetData(i, "NEW_YN") == "Y") {%><i class="new"> NEW </i><%} %><%=GetData(i, "TTL")%></a></td>
				<td><%=GetData(i, "WRITER_NM")%></td>
				<td><%=GetData(i, "REG_DT")%></td>
				<td><%=GetData(i, "HIT_CNT")%></td>
			</tr>
            <% 
                    }
                }
                else
                {
            %>
			<!-- 내용이 없을 경우  -->
			<tr >
				<td colspan="5" class="no_data"> 
					<p > 내용이 없습니다. </p> 
				</td>
			</tr>
            <% 
                }
            %>
			<!-- // 내용이 없을 경우  -->			
		</tbody>
	</table>

	<asp:HiddenField ID="nowPageNo" runat="server"  Value="1" onvaluechanged="nowPageNo_ValueChanged"/>
	<%= HomePage.page.paging.getPageNo(DataTotalCount, Convert.ToInt32(nowPageNo.Value), 10)%>
			
	<p class="search_center">
		<label  for="<%=s_search_type.ClientID %>" class="acc-hidden">검색조건</label>
		<select class="list" id="s_search_type" runat="server">
            <option selected="selected" >선택</option>
			<option value="title">제목</option>
			<option value="title_cont"> 제목 + 내용</option>
		</select>
        <label for="<%=txt_search_value.ClientID %>" class="acc-hidden">검색내용</label>
		<input type="text" id="txt_search_value" class="list" runat="server" />
        <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn_search small fB" OnClick="btnSearch_Click" Text="Search" />
	<p>
	<!-- // 내용 ***************** -->         
</section>  <!--// sub_content -->

<script type="text/javascript" >
    function movePage(page_no) {
        document.getElementById('<%= nowPageNo.ClientID %>').value = page_no;
        document.forms[0].submit();
    }
</script>

</asp:Content>
