<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="job_guide_list.aspx.cs" Inherits="AdminSite.rcm.job_guide_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">
<!-- CONTENT -->
<div id="content-outer">
<div id="content">
	<div id="page-heading">
		<h1>입사지원 현황</h1>
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
					<th><label for="pdt_name">채용타이틀</label></th>   
					<td><input  type="text" id="title" class="span4 text" placeholder="채용타이틀을  입력해 주세요" runat="server" /></td> 
					<th><label for="pdt_select">채용결과</label></th>       
					<td>
						<label for="name_01" class="mR10">	
							<input type="radio" id="rcm_all" runat="server" name="name_01" value="RCM_ALL" class="inline" />전체 
						</label>  
						<label for="name_02" class="mR10">	
							<input type="radio" id="rcm_ing" runat="server" name="name_01" value="RCM_ING" class="inline" />모집중       
						</label>
						<label for="name_02" class="mR10">	
							<input type="radio" id="rcm_end" runat="server" name="name_01" value="RCM_END" class="inline" />종료        
						</label>    
					</td>
					<td class="aligncenter">
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
					<th width="5%">번호</th>
					<th>채용타이틀</th>
					<th width="10%">시작일</th>
					<th width="10%">종료일</th>
					<th width="8%">지원자수</th>
					<th width="8%">합격자수</th>
					<th width="8%">결과</th>
					<th width="10%">등록일</th>
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
					<td class="alignleft" ><a href="job_guide_detail.aspx?reg_seq_no=<%=GetData(i, "REG_SEQ_NO")%>"><%=GetData(i, "RCM_TTL")%></a></td>
					<td><%=GetData(i, "START_DATE")%></td>
					<td><%=GetData(i, "END_DATE")%></td>
					<td><a href="job_support_list.aspx?reg_seq_no=<%=GetData(i, "REG_SEQ_NO")%>"><%=GetData(i, "SUPPORT_CNT")%></a></td>   
					<td><%=GetData(i, "SUCC_CNT")%></td>
					<td><%=GetData(i, "STATUS")%></td>
					<td><%=GetData(i, "REG_DT")%></td>
				</tr>
            <% 
                    }
                }
                else
                {
            %>
			<!-- 내용이 없을 경우  -->
			<tr >
				<td colspan="10" class="no_data"> 
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
				<a href="job_guide_detail.aspx"><span class="btn btn-ok">등록</span></a>
			</div>
		</div>						
		<asp:HiddenField ID="nowPageNo" runat="server"  Value="1" onvaluechanged="nowPageNo_ValueChanged"/>			
        <%= AdminSite.page.paging.getPageNo(DataTotalCount, Convert.ToInt32(nowPageNo.Value), 10)%>
	</div>
	<!--//  wrap_box -->
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