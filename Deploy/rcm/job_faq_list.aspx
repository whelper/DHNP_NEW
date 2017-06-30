<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="job_faq_list.aspx.cs" Inherits="AdminSite.rcm.job_faq_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1> FAQ  </h1>
	</div>

	<div class="wrap_box">
		<table class="table_search">
			<colgroup>
				<col width="10%" />
				<col width="34%" />
				<col width="10%" />
				<col width="34%" />
				<col />
			</colgroup>
			<tbody>
				<tr> 
					<th><label for="pdt_name">제목</label></th>   
					<td><input  type="text" id="title" class="span4 text" runat="server"/></td>  
					<th><label for="datepicker">등록일</label></th>   
					<td>
					<input type="text" name="start_date_picker" title="특정 기간 시작 날짜" class="date_in" id="datepicker" onchange ="setSdate()" /> 
                        <input type="hidden" name="start_date"  id="start_date" runat="server"/> 
						~ 
						<input type="text" name="end_date_picker" title="특정 기간 종료 날짜" class="date_in" id="datepicker2"  onchange ="setEdate()" />
                        <input type="hidden" name="end_date"  id="end_date" runat="server" /> 
					</td> 
					<td class=" aligncenter">
						<asp:LinkButton ID="btn_global_search" runat="server" onClick="btnSearch_Click">
					        <span class="btn s_search">검색</span>
                        </asp:LinkButton>
					</td>
				</tr> 
			</tbody>
		</table>
	
		<table cellpadding="0" cellspacing="0" border="0" class="table_new">
			<thead>
				<tr> 
					<th width="10%">번호</th>
					<th>제목</th>
					<th width="10%">작성자</th>
					<th width="15%">등록일</th>
                    <th width="10%">조회수</th>
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
                <td class="alignleft" >
                    <% if (GetData(i, "NEW_YN") == "Y") {%>
                        <i class="new"> NEW </i>
                    <%} %>
                        <a href="job_faq_detail.aspx?seq_no=<%=GetData(i, "SEQ_NO")
                    %>"><%=GetData(i, "TTL", 100)%>
                        </a>
                </td>
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
		<div class="btn_area clearfix">
			<div class="f_right">
				<a href="job_faq_detail.aspx"><span class="btn btn-ok">등록</span></a>
			</div>
		</div>		
        
        <asp:HiddenField ID="nowPageNo" runat="server"  Value="1" onvaluechanged="nowPageNo_ValueChanged"/>			
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

    function setSdate() {
        document.getElementById('<%= start_date.ClientID %>').value = document.getElementById("datepicker").value;
    }

    function setEdate() {
        document.getElementById('<%= end_date.ClientID %>').value = document.getElementById("datepicker2").value;
    }
</script>
</asp:Content>