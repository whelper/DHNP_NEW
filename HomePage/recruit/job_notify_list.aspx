<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="job_notify_list.aspx.cs" Inherits="HomePage.recruit.job_notify_list" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle"> 채용공고  </h1>
		<p class="location">
			<a href="/index.aspx"><span><img src="/common/images/common/i_home.png" alt="home" /></span></a>
            <a href="/recruit/new_person.aspx"><span>채용</span></a><em> > </em>
			<a href="/recruit/job_notify_list.aspx"><span>상시채용</span></a><em> > </em>
			<a href="/recruit/job_notify_list.aspx"><strong>채용공고</strong></a>
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
    <img src="/common/images/sub/job_notify_title.jpg" class="mB10" alt="채용공고" >
    <% 
        }
    %>
	
	<table class="table_list" border="1">
		<caption class="hidden"> 채용공고 리스트   </caption>
		<colgroup>
			<col style="width:10%">
			<col >
			<col style="width:12%">
			<col style="width:13%">
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
            string hit_cnt1 = "0";
            
            if (GetRowCount(0) > 0)
            {
                for (int i = 0; i < GetRowCount(0); i++)
                {
                    if (GetData(0, i, "HIT_CNT") == "")
                    {
                        hit_cnt1 = "0";
                    }
                    else
                    {
                        hit_cnt1 = GetData(0, i, "HIT_CNT");
                    }
                    
                    string show_tp = GetData(0, i, "SHOW_TP");
        %>
			<tr>
                <% 
                    string show_tp_nm = "";
                    if(show_tp.Equals("2")){
                        show_tp_nm = "공지";
                %>
				    <td><i class="icolor orange"> 공지 </i> </td>
                <%
                    }else if(show_tp.Equals("3")){
                        show_tp_nm = "정규";
                %>
                    <td><i class="icolor green">정규</i></td>
                <%
                    }
                    else if (show_tp.Equals("1"))
                    {
                        show_tp_nm = "상시";
                %>
                    <td><i class="icolor blue">상시</i></td>
                <%
                    }
                    else
                    {
                %>
                    <td><%=GetBoardNum(i, Convert.ToInt32(nowPageNo.Value), 10)%></td>
                <% 
                    }   
                %>
                <td>
                    <a href="job_notify_view.aspx?seq_no=<%=GetData(0, i, "SEQ_NO")%>&dp_seq_no=<%=show_tp_nm%>"><%=GetData(0, i, "TTL")%></a>
                </td>
				<td><%=GetData(0, i, "WRITER_NM")%></td>
				<td><%=GetData(0, i, "REG_DT")%></td>
				<td><%=hit_cnt1%></td>
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