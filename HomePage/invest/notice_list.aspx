<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="notice_list.aspx.cs" Inherits="HomePage.invest.notice_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content">
	<header>
		<h1 class="pageTitle">공지/공고</h1>
		<p class="location">
			<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
            <a href="/invest/ir_info_list.aspx"><span>투자</span></a><em> > </em>
			<a href="/invest/notice_list.aspx"><span>공지/공고</span></a><em> > </em>
			<a href="/invest/notice_list.aspx"><strong>공지/공고</strong></a>
		</p>
	</header>

    <% 
        if (DsHeader != null && DsHeader.Tables.Count > 0 && DsHeader.Tables[0].Rows.Count > 0)
        {   
    %>
    <%=DsHeader.Tables[0].Rows[0]["CONT"].ToString()%>
    <% 
        }
        else
        {
    %>
    <img src="/common/images/sub/invest_notice_title.jpg" class="mB10" alt="공지/공고" >
    <% 
        }
    %>

	<table class="table_list" border="1">
		<caption class="hidden">공지/공고 리스트</caption>
		<colgroup>
			<col style="width:10%" />
			<col />
			<col style="width:12%" />
			<col style="width:13%" />
			<col style="width:10%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
        <% 
            string hit_cnt = "0";
            
            if (GetRowCount() > 0)
            {
                for (int i = 0; i < GetRowCount(); i++)
                {
                    if (GetData(i, "HIT_CNT") == "")
                    {
                        hit_cnt = "0";
                    }
                    else
                    {
                        hit_cnt = GetData(i, "HIT_CNT");
                    }
        %>
			<tr>
				<td scope="row" ><%=GetBoardNum(i, Convert.ToInt32(nowPageNo.Value), 10)%></td>
				<td>
                    <a href="notice_view.aspx?seq_no=<%=GetData(i, "SEQ_NO")%>&dp_seq_no=<%=GetBoardNum(i, Convert.ToInt32(nowPageNo.Value), 10)%>"><%=GetData(i, "TTL")%></a>
                </td>
				<td><%=GetData(i, "WRITER_NM")%></td>
				<td><%=GetData(i, "REG_DT")%></td>
				<td><%=hit_cnt%></td>
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
				<p>내용이 없습니다.</p> 
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
            <option selected="selected">선택</option>
		    <option value="title">제목</option>
		    <option value="title_cont">제목 + 내용</option>
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
