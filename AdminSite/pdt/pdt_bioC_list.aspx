<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="pdt_bioC_list.aspx.cs" Inherits="AdminSite.pdt.pdt_bioC_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
	
	<div id="page-heading">
		<h1>카탈로그</h1>
	</div>

	<div class="wrap_box">
	    <ul class="list_tab  clearfix target" >
		    <li ><a href="pdt_bio_list.aspx">배지 / 레진</a></li>
		    <li class="tab_on"><a href="pdt_bioC_list.aspx">카탈로그</a></li>
            <li><a href="pdt_catalog_list.aspx?upr_catg_no=3">대표카탈로그</a></li>
	    </ul>
		<table class="table_search">
			<colgroup>
				<col width="10%">
				<col width="34%">
				<col width="10%">
				<col width="34%">
				<col>
			</colgroup>
			<tbody>
				<tr> 
					<th><label for="pdt_name">제목</label></th>
					<td colspan="3"><input  type="text" runat="server" id="title" class="span4 text" placeholder="제품명을  입력해 주세요" /></td> 
					<td  rowspan="2" class=" aligncenter">
						<asp:LinkButton ID="btnSearch" runat="server" CssClass="btn s_search" onclick="btnSearch_Click" Text="검색" />
					</td>
				</tr>
			</tbody>
		</table>
	
		<table cellpadding="0" cellspacing="0" border="0" class="table_new">
			<thead>
				<tr> 
					<th width="10%">번호</th>
					<th>제목</th>
					<th width="15%">작성자</th>
					<th width="15%">등록일</th>
				</tr>
			</thead>
			<tbody>
			<%
                int total = DataTotalCount;
                
                if (GetDataCount() > 0)
                {
                    for (int i = 0; i < GetDataCount(); i++)
                    {
            %>
				<tr>
					<td><%=GetBoardNum(i, Convert.ToInt32(nowPageNo.Value), 10)%></td>
                    <td class="alignleft" ><a href="pdt_bioC_detail.aspx?prod_cd=<%=GetData(i, "PROD_CD")%>"><%=GetData(i, "TTL")%></a> </td>
					<td><%=GetData(i, "WRITER_ID")%></td> 
					<td><%=GetData(i, "REG_DT")%></td>
				</tr>
            <%
                    }
                }
                else
                {
            %>
                <tr >
	                <td colspan="7" class="no_data"> 
		                <p>등록된 제품이 없습니다.</p>
	                </td>
                </tr>
            <%
                }
            %>
			</tbody>
		</table>
		<div class="btn_area clearfix">
			<div class="f_right">
				<a href="pdt_bioC_detail.aspx"><span class="btn btn-ok">등록</span></a>
			</div>
		</div>			
        			
		<asp:HiddenField ID="nowPageNo" runat="server" Value="1" onvaluechanged="nowPageNo_ValueChanged"/>
	    <%= AdminSite.page.paging.getPageNo(DataTotalCount, Convert.ToInt32(nowPageNo.Value), 10)%>

	</div><!--//  wrap_box -->
	
		
</div>
</div>
<!--//  CONTENT -->
    <script type="text/javascript" >
        function movePage(page_no) {
            document.getElementById('<%= nowPageNo.ClientID %>').value = page_no;
            document.forms[0].submit();
        }
    </script>
</asp:Content>