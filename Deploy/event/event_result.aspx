<%@ Page Language="C#" MasterPageFile="~/SiteSub.Master" AutoEventWireup="true" CodeBehind="event_result.aspx.cs" Inherits="AdminSite.evt.event_result" %>
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
					<th> <label for="datepicker">   참여일   </label>  </th>   
					<td>  <!-- <input type="text" class="span4 text" placeholder="등록일을   입력해 주세요 "> -->
                        <input type="hidden" id="start_date" runat="server" />
						<input type="text" name="start_date" value="<%=Request["start_date"]%>" title="특정 기간 시작 날짜" class="date_in" id="datepicker" onchange="javascript:start_date_ch(this.value);" /> 
						~ 
                        <input type="hidden" id="end_date" runat="server" />
						<input type="text" name="end_date"  value="<%=Request["end_date"]%>" title="특정 기간 종료 날짜" class="date_in" id="datepicker2" onchange="javascript:end_date_ch(this.value);" />
					</td>
					<td class=" aligncenter">
						<asp:LinkButton ID="btn_global_Search" runat="server" onClick="btnSearch_Click"> <span class="btn s_search">검색</span> </asp:LinkButton>
					</td>
				</tr> 
			</tbody>
		</table>

		<div class="tit_rightbtn">
			<h2> <%=GetData(0, "EVT_TTL")%> </h2>
            <asp:LinkButton ID="btn_Excel" runat="server" onclick="btn_Excel_Click"> <span class="btn s_search">엑셀다운로드</span> </asp:LinkButton>
		</div>
		<style>
			.tit_rightbtn{position: relative}
			.tit_rightbtn h2{margin: 0;padding:0 0 10px;line-height:30px}
			.tit_rightbtn .btn{position: absolute;top:0;right:0;}
		</style>
		<table cellpadding="0" cellspacing="0" border="0" class="table_new">
			<thead>
				<tr> 
					<th width="4%"> 번호 </th>
					<th width="5%"> 고유번호 </th>
					<th width="10%"> 이벤트명 </th>
					<th width="8%"> 참여일  </th>

                     <% foreach (string item in GetData(0, "CONT_Q").Split(new string[] { "|" }, StringSplitOptions.None)) { %>
                        <th> <%=item%></th>
                     <% } %>
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
                    <td><%=GetData(i, "SEQ_NO")%></td>
                    <td><%=GetData(i, "EVT_TTL")%></td>
                    <td><%=GetData(i, "REG_DT")%></td>

                     <% foreach (string item in GetData(i, "CONT_A").Split(new string[] { "|" }, StringSplitOptions.None)) { %>
                        <td> <%=item%></td>
                     <% } %>
				</tr>
                <% 
		                }
	                }
	                else
	                {
                %>
                <!-- 내용이 없을 경우  -->
                <tr >
	                <td colspan="9" class="no_data"> 
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
            <div class="f_left"><a href="event_list.aspx"><span class="btn">목록</span></a></div>
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
