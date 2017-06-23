<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="event_list.aspx.cs" Inherits="AdminSite.evt.event_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceSubLayer" runat="server">

<!-- CONTENT -->
<div id="content-outer">
<div id="content">
  
	<div id="page-heading">
		<h1> 이벤트 관리  </h1>
	</div>

	<div class="wrap_box">
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
					<th> <label for="pdt_name">   제목  </label>  </th>   
					<td> <input  type="text" id="title" class="span4 text" runat="server"/>  
						<!--select  id="pdt_name" style="width:90px;">
							<option>채용타이틀</option>
							<option>채용타이틀+내용 </option>
						</select>
						<input class="span4 text" type="text" -->
					</td>  
					<th> <label for="datepicker">   등록일   </label>  </th>   
					<td>  <!-- <input type="text" class="span4 text" placeholder="등록일을   입력해 주세요 "> -->
                        <input type="hidden" id="start_date" runat="server" />
						<input type="text" name="start_date" value="<%=Request["start_date"]%>" title="특정 기간 시작 날짜" class="date_in" id="datepicker" onchange="javascript:start_date_ch(this.value);" /> 
						~ 
                        <input type="hidden" id="end_date" runat="server" />
						<input type="text" name="end_date"  value="<%=Request["end_date"]%>" title="특정 기간 종료 날짜" class="date_in" id="datepicker2" onchange="javascript:end_date_ch(this.value);" />
					</td>
					<td class=" aligncenter">
						<asp:LinkButton ID="btn_global_Search" runat="server" onClick="btnSearch_Click">
					        <span class="btn s_search">검색.</span>
                        </asp:LinkButton>
					</td>
				</tr> 
			</tbody>
		</table>
	
		<table cellpadding="0" cellspacing="0" border="0" class="table_new">
			<thead>
				<tr> 
					<th width="7%"> 번호 </th>
					<th width="6%"> 노출 </th>
					<th width="7%"> 상태 </th>
					<th> 제목 </th>
                    <th width="9%"> 미리보기  </th>
					<th width="9%"> 시작일  </th>
					<th width="9%"> 종료일  </th>
					<th width="9%"> 작성자   </th>
					<th width="9%"> 등록일  </th>
					<th width="12%"> 참여자 결과보기  </th>
				</tr>
			</thead>
			<tbody>
                <%
                    int total = DataTotalCount;
                    
	                if (GetRowCount() > 0)
	                {
		                for (int i = 0; i < GetRowCount(); i++)
		                {
                %>
				<tr>
                    <td><%=GetBoardNum(i, Convert.ToInt32(nowPageNo.Value), 10)%></td>
                    <td><%=GetData(i, "IS_SHOW")%></td>
                    <td><%=GetData(i, "STATUS_EVT")%></td>
                    <td> <a href="event_detail.aspx?seq_no=<%=GetData(i, "SEQ_NO")%>"><%=GetData(i, "EVT_TTL")%> </a></td>
                    <td>
                    <% if (GetData(0, "SEQ_NO") != "") { %>
					    <a href="<%=ConfigurationManager.AppSettings["HOMEPAGE_DOMAIN"] %>event/event_view.aspx?seq_no=<%=GetData(i, "SEQ_NO")%>&is_show=<%=GetData(i, "IS_SHOW")%>" target="_blank">미리보기</a>
                    <% } %>
                    </td>
                    <td><%=GetData(i, "START_DATE")%></td>
                    <td><%=GetData(i, "END_DATE")%></td>
                    <td><%=GetData(i, "WRITER_ID")%></td>
                    <td><%=GetData(i, "REG_DT")%></td>
                    <td>
                    <% if (GetData(i, "SEQ_NO") != "") {%> 
                    <a href="event_result.aspx?ee_seq_no=<%=GetData(i, "SEQ_NO")%>"><span style="text-decoration: blink;"><%=GetData(i, "RESULT_CT")%> 명 결과보기</span></a>
                    
                    <% } %>
                    </td>
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
				<a href="./event_detail.aspx"><span class="btn btn-ok">등록</span></a>
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
    
    function start_date_ch(date) {

        document.getElementById('<%= start_date.ClientID %>').value = date;

    }

    function end_date_ch(date) {

        document.getElementById('<%= end_date.ClientID %>').value = date;

    }
</script>

</asp:Content>
