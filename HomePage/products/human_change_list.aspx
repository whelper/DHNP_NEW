<%@ Page Language="C#" MasterPageFile="~/Products_Sub.Master" AutoEventWireup="true" CodeBehind="human_change_list.aspx.cs" Inherits="HomePage.products.human_change_list" %>
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
	    <table class="table_list" border="1">
		    <caption class="hidden">제품변경정보 리스트</caption>
		    <colgroup>
			    <col style="width:10%">
			    <col >
			    <col style="width:15%">
			    <col style="width:15%">
			    <col style="width:10%">
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
                    if (GetRowCount() > 0)
                    {
                        for (int i = 0; i < GetRowCount(); i++)
                        {
                %>
			    <tr>
				    <td><%=GetData(i, "SEQ_NO")%></td>
				    <td><a href="./human_change_view.aspx?seq_no=<%=GetData(i, "SEQ_NO")%>"><% if (GetData(i, "NEW_YN") == "Y") {%><i class="new"> NEW </i><%} %><%=GetData(i, "TTL")%></a></td>
				    <td><%=GetData(i, "WRITER_NM")%></td>
				    <td><%=GetData(i, "REG_DATE")%></td>
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
            <asp:Button ID="btnSearch" runat="server" CssClass="btn_search small fB" OnClick="btnSearch_Click" Text="Search" />
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
