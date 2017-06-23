<%@ Page Language="C#" MasterPageFile="/en/EnSiteSub.Master" AutoEventWireup="true" CodeBehind="ir_info_list.aspx.cs" Inherits="HomePage.en.invest.ir_info_list" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<section id="content" class="sub_content" >
	<header>
		<h1 class="pageTitle">IR Report</h1>
		<p class="location">
			<a href="/en/index.aspx"><span><img src="/en/common/images/common/i_home.png" alt="home" /></span></a>
            <a href="/en/invest/ir_info_list.aspx"><span>Investors</span></a><em> > </em>
			<a href="/en/invest/ir_info_list.aspx"><span>Prospective Investors</span></a><em> > </em>
			<a href="/en/invest/ir_info_list.aspx"><strong>IR Report</strong></a>
		</p>
	</header>
	<!--  내용  ***************** -->
	<table class="table_list" border="1" >
		<caption class="hidden">IR자료 리스트</caption>
		<colgroup>
			<col style="width:10%" />
			<col />
			<col style="width:12%" />
			<col style="width:13%" />
			<col style="width:10%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">Subject</th>
				<th scope="col">Writer</th>
				<th scope="col">Date</th>
				<th scope="col">View</th>
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
                    <a href="ir_info_view.aspx?seq_no=<%=GetData(i, "SEQ_NO")%>"><%=GetData(i, "TTL")%></a>
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